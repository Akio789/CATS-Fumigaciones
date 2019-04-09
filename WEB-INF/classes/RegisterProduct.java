import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerProduct")
public class RegisterProduct extends HttpServlet {

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

            // Get user input
            String nombre = request.getParameter("nombre");
            double costo = Double.parseDouble(request.getParameter("costo"));
            int cant_disp = Integer.parseInt(request.getParameter("cant_disp"));
            String descr = request.getParameter("descr");
            int idProveedor = Integer.parseInt(request.getParameter("idProveedor"));

            // Only execute insert if provider exists
            String nextPage = "/registerProductError.jsp";
            boolean exists = false;

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            // Check if provider exists
            String sql = "SELECT * FROM Proveedor;";
            ResultSet res = stat.executeQuery(sql);

            while (res.next()) {
                if (res.getInt("id") == idProveedor) {
                    nextPage = "/registerProductSuccess.jsp";
                    exists = true;
                }
            }

            // Only insert new product if provider exists
            if (exists) {
                Connection con2 = DriverManager.getConnection(url, user, pass);
                Statement stat2 = con2.createStatement();
                String sql2 = "INSERT INTO Producto (nombre, descripcion, cant_disp, costo, idProveedor)" + " VALUES ('"
                        + nombre + "', '" + descr + "', '" + cant_disp + "', '" + costo + "', '" + idProveedor + "');";
                stat2.executeUpdate(sql2);

                stat2.close();
                con2.close();
            }

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher(nextPage);

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}