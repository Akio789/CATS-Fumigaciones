import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/modifyUser")
public class ModifyUser extends HttpServlet {

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
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "SELECT * FROM Usuario;";
            ResultSet res2 = stat2.executeQuery(sql2);

            // Get user input
            String id = request.getParameter("id");
            String name = request.getParameter("name");
            String username = request.getParameter("username");
            String job = request.getParameter("job");
            String phoneNum = request.getParameter("phoneNum");
            String email = request.getParameter("email");
            String address = request.getParameter("address");

            String nextPage = "";

            while (res2.next()) {
                String existingUsername = res2.getString("username");
                if (username.equals(existingUsername)) {
                    nextPage = "/existingUsernameError.jsp";
                    break;
                } else {
                    Connection con = DriverManager.getConnection(url, user, pass);
                    Statement stat = con.createStatement();
                    String sql = "UPDATE Usuario SET nombre='" + name + "', username='" + username + "', puesto='" + job
                            + "', telefono='" + phoneNum + "', correo='" + email + "', direccion='" + address
                            + "' WHERE id='" + id + "';";

                    stat.executeUpdate(sql);

                    stat.close();
                    con.close();

                    nextPage = "/users";
                }
            }

            request.setAttribute("lastPageForSuccess", "./users");
            request.setAttribute("lastPageForFailure", "./modifyUser.jsp");

            stat2.close();
            con2.close();

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