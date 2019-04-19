import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Product;;

@WebServlet("/consultProduct")
public class ConsultProduct extends HttpServlet {

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
            String productToConsult = request.getParameter("productToConsult");
            String sql = "SELECT * FROM Producto WHERE nombre='" + productToConsult + "';";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Product> products = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Product newProduct = new Product();
                newProduct.setId(res.getInt("id"));
                newProduct.setNombre(res.getString("nombre"));
                newProduct.setCosto(res.getDouble("costo"));
                newProduct.setCant_disp(res.getInt("cant_disp"));
                newProduct.setIdProveedor(res.getInt("idProveedor"));

                products.add(newProduct);
            }

            // Save users in session
            HttpSession session = request.getSession(false);
            session.setAttribute("products", products);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/consultProduct.jsp");

            stat.close();
            con.close();

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}