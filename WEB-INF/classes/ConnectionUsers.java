import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.User;;

@WebServlet("/users")
public class ConnectionUsers extends HttpServlet {

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
            String sql = "SELECT * FROM Usuario;";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<User> users = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                User newUser = new User();
                newUser.setId(res.getInt("id"));
                newUser.setUsername(res.getString("username"));
                newUser.setPassword(res.getString("password"));
                newUser.setName(res.getString("nombre"));
                newUser.setJob(res.getString("puesto"));
                newUser.setPhoneNum(res.getString("telefono"));
                newUser.setEmail(res.getString("correo"));
                newUser.setAddress(res.getString("direccion"));

                users.add(newUser);
            }

            // Save users in session
            HttpSession session = request.getSession(false);
            session.setAttribute("users", users);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/users.jsp");

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