import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerProvider")
public class RegisterProvider extends HttpServlet {

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
            int userId = Integer.parseInt(request.getParameter("userId"));
            String nombre = request.getParameter("nombre");
            String direccion = request.getParameter("direccion");
            String correo = request.getParameter("correo");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            // Check if provider exists
            String sql = "INSERT INTO Proveedor (nombre, direccion, correo) VALUES ('" + nombre + "', '" + direccion
                    + "', '" + correo + "');";
            stat.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            
            
            int providerId = 0;
            ResultSet rs = stat.getGeneratedKeys();
            if (rs.next()){
                providerId=rs.getInt(1);
            }	

            stat.close();
            con.close();
           
            System.out.println("$$$$$$$$$$$$$$$$$$$$$$$");
            System.out.println(providerId);
            
            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();

            // Check if provider exists
            String sql3 = "INSERT INTO UsuarioProveedor (id_usuario, id_proveedor) VALUES ('"+ userId +"', '"+ providerId + "');";
            stat3.executeUpdate(sql3);

            stat3.close();
            con3.close();
            

            request.setAttribute("lastPageForSuccess", "./providers");

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/registerSuccess.jsp");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}