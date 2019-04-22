import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerClient")
public class RegisterClient extends HttpServlet {

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
            String telefono = request.getParameter("telefono");

            // Only execute insert if provider exists
            String nextPage = "/registerProductError.jsp";
            boolean exists = false;

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            String sql = "INSERT INTO Cliente (nombre, direccion, correo, telefono) VALUES ('" + nombre + "', '"
                    + direccion + "', '" + correo + "', '" + telefono + "');";
stat.executeUpdate(sql, Statement.RETURN_GENERATED_KEYS);
            
            
            int clientId = 0;
            ResultSet rs = stat.getGeneratedKeys();
            if (rs.next()){
            	clientId=rs.getInt(1);
            }	

            stat.close();
            con.close();
           
            System.out.println("$$$$$$$$$$$$$$$$$$$$$$$");
            System.out.println(clientId);
            
            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();

            // Check if provider exists
            String sql3 = "INSERT INTO UsuarioCliente (id_usuario, id_cliente) VALUES ('"+ userId +"', '"+ clientId + "');";
            stat3.executeUpdate(sql3);

            stat3.close();
            con3.close();
            

            request.setAttribute("lastPageForSuccess", "./client");
            request.setAttribute("lastPageForFailure", "./registerClient.jsp");

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