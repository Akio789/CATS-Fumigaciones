import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Provider;;

@WebServlet("/modifyProduct")
public class ModifyProduct extends HttpServlet {

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
            String id = request.getParameter("id");
            String nombre = request.getParameter("nombre");
            double costo = Double.parseDouble(request.getParameter("costo"));
            String nombreProveedor = request.getParameter("nombre_proveedor");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            String sql2 = "SELECT * FROM Proveedor WHERE nombre='" + nombreProveedor + "';";
            ResultSet res2 = stat.executeQuery(sql2);

            res2.next();
            int idProveedor = res2.getInt("id");

            String sql = "UPDATE Producto SET nombre='" + nombre + "', costo='" + costo + "', idProveedor='"
                    + idProveedor + "' WHERE id='" + id + "';";

            stat.executeUpdate(sql);

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/products");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}