import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Provider;;

@WebServlet("/providers")
public class ConnectionProviders extends HttpServlet {

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
            String sql = "SELECT * FROM Proveedor;";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Provider> providers = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Provider newProvider = new Provider();
                newProvider.setId(res.getInt("id"));
                newProvider.setNombre(res.getString("nombre"));
                newProvider.setDireccion(res.getString("direccion"));
                newProvider.setCorreo(res.getString("correo"));

                providers.add(newProvider);
            }

            // Save users in session
            HttpSession session = request.getSession(false);
            session.setAttribute("providers", providers);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/providers.jsp");

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