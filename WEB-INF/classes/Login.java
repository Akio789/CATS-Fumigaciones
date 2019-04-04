import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/menu")
public class Login extends HttpServlet {

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
            String usernameInput = request.getParameter("username");
            String passwordInput = request.getParameter("password");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();
            ResultSet res = stat
                    .executeQuery("SELECT username, password FROM Usuario WHERE username=" + usernameInput + ";");

            // Validate user
            boolean validUser = false;

            while (res.next()) {
                // Get info from database
                String username = res.getString("usuario");
                String password = res.getString("contaseña");

                // If a valid username and password are found, validUser is now true
                if (username.equals(usernameInput) && password.equals(passwordInput)) {
                    validUser = true;
                }
            }

            // Determine page to dispatch to
            String nextPage = validUser ? "/menu.jsp" : "/loginError.jsp";
            RequestDispatcher disp = getServletContext().getRequestDispatcher(nextPage);

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}