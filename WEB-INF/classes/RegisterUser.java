import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/registerUser")
public class RegisterUser extends HttpServlet {

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
            String usernameInput = request.getParameter("username");
            String passwordInput = request.getParameter("password");
            String passwordInput2 = request.getParameter("password2");
            String nameInput = request.getParameter("name");
            String positionInput = request.getParameter("position");
            String phoneNumInput = request.getParameter("phoneNum");
            String emailInput = request.getParameter("email");
            String addressInput = request.getParameter("address");

            // Only execute insert if passwords are equal
            String nextPage;
            if (passwordInput.equals(passwordInput2)) {
                // JDBC
                Class.forName("com.mysql.jdbc.Driver");
                String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
                Connection con = DriverManager.getConnection(url, user, pass);
                Statement stat = con.createStatement();
                String sql = "INSERT INTO Usuario (username, password, nombre, puesto, telefono, correo, direccion)"
                        + "VALUES ('" + usernameInput + "', '" + passwordInput + "', '" + nameInput + "', '"
                        + positionInput + "', '" + phoneNumInput + "', '" + emailInput + "', '" + addressInput + "');";
                stat.executeUpdate(sql);
                nextPage = "/registerSuccess.jsp";

                stat.close();
                con.close();
            } else {
                nextPage = "/registerError.jsp";
            }

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