import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;

@WebServlet("/addProduct")
public class AddProduct extends HttpServlet {

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

            // Get user input
            int serviceId = Integer.parseInt(request.getParameter("id"));
            int cantidad = Integer.parseInt(request.getParameter("cantidad"));
            String nombreProducto = request.getParameter("nombre_producto");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();
            
            String sql = "SELECT * FROM Producto WHERE nombre='" + nombreProducto + "';";
            ResultSet res = stat.executeQuery(sql);

            res.next();
            int cant_disp = res.getInt("cant_disp");
            int idProducto = res.getInt("id");
            
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
           
            String sql2 = "INSERT INTO ProductoServicio (id_producto, id_servicio, cantidad)" + " VALUES ('"
                    + serviceId + "', '" + idProducto + "', '" + cantidad + "');";
            stat2.executeUpdate(sql2);
            
            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con2.createStatement();
            
            String sql3 = "UPDATE Producto SET cant_disp='" + (cant_disp - cantidad) + "' WHERE id='" + idProducto + "';";
            ;
            stat.executeUpdate(sql3);


            stat.close();
            con.close();
            stat2.close();
            con2.close();
            stat3.close();
            con3.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/registerSuccess.jsp");

            request.setAttribute("lastPageForSuccess", "./services");
            request.setAttribute("lastPageForFailure", "./addProduct.jsp");
            request.setAttribute("method", "POST");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}