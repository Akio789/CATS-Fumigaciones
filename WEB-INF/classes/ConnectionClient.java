import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Client;;

@WebServlet("/client")
public class ConnectionClient extends HttpServlet {

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

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();
            String sql = "SELECT * FROM Cliente;";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Client> client = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Client newClient = new Client();
                newClient.setId(res.getInt("id"));
                newClient.setNombre(res.getString("nombre"));
                newClient.setCorreo(res.getString("correo"));
                newClient.setDireccion(res.getString("direccion"));
                newClient.setTelefono(res.getString("telefono"));

                client.add(newClient);
            }

            // Save users in session
            HttpSession session = request.getSession(false);
            session.setAttribute("client", client);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/client.jsp");

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