import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Product;
import pojos.Provider;

@WebServlet("/products")
public class ConnectionProducts extends HttpServlet {

    public void init(ServletConfig config) {
        try {
            super.init(config);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            // Initial parameters
            String db = getServletContext().getInitParameter("database");
            String user = getServletContext().getInitParameter("username");
            String pass = getServletContext().getInitParameter("password");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
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

            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "SELECT * FROM Proveedor;";
            ResultSet res2 = stat.executeQuery(sql2);
            ArrayList<Provider> providers = new ArrayList<>();

            // Iterate through ResultSet
            while (res2.next()) {
                Provider newProvider = new Provider();
                newProvider.setId(res2.getInt("id"));
                newProvider.setNombre(res2.getString("nombre"));
                newProvider.setDireccion(res2.getString("direccion"));
                newProvider.setCorreo(res2.getString("correo"));

                providers.add(newProvider);
            }

            for (int i = 0; i < products.size(); i++) {
                for (int j = 0; j < providers.size(); j++) {
                    if (products.get(i).getIdProveedor() == providers.get(j).getId()) {
                        products.get(i).setNombreProveedor(providers.get(j).getNombre());
                    }
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("providers", providers);

            request.setAttribute("products", products);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/products.jsp");

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