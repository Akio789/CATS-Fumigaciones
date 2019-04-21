import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Product;
import pojos.ProductService;
import pojos.Provider;

@WebServlet("/productsServices")
public class ConnectionProductsServices extends HttpServlet {

    public void init(ServletConfig config) {
        try {
            super.init(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Initial parameters
            String db = getServletContext().getInitParameter("database");
            String user = getServletContext().getInitParameter("username");
            String pass = getServletContext().getInitParameter("password");
            
            String serviceId = request.getParameter("serviceToShow");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "SELECT * FROM ProductoServicio WHERE id_servicio ='" + serviceId + "';";
            ResultSet res2 = stat2.executeQuery(sql2);
            ArrayList<ProductService> productsServices = new ArrayList<>();
            

            // Iterate through ResultSet
            while (res2.next()) {
            	ProductService newProductService = new ProductService();
                newProductService.setId_producto(res2.getInt("id_producto"));
                newProductService.setId_servicio(res2.getInt("id_servicio"));
                newProductService.setCantidad(res2.getInt("cantidad"));

                productsServices.add(newProductService);
       
            }
            
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();
            String sql = "SELECT * FROM Producto;";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Product> products = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Product newProduct = new Product();
                newProduct.setCant_disp(res.getInt("cant_disp"));
                newProduct.setId(res.getInt("id"));
                newProduct.setIdProveedor(res.getInt("idProveedor"));
                newProduct.setCosto(res.getDouble("costo"));
                newProduct.setNombre(res.getString("nombre"));
                newProduct.setDescripcion(res.getString("descripcion"));

                products.add(newProduct);
            }

            
            

            for (int i = 0; i < products.size(); i++) {
                for (int j = 0; j < productsServices.size(); j++) {
                    if (products.get(i).getId() == productsServices.get(j).getId_producto()) {
                        productsServices.get(j).setProductName(products.get(i).getNombre());
                    }
                }
            }
            
            
            request.setAttribute("products", products);
            
            
            request.setAttribute("productsServices", productsServices);
            request.setAttribute("method", "POST");

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/productsServices.jsp");

            stat.close();
            con.close();
            stat2.close();
            con2.close();

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}