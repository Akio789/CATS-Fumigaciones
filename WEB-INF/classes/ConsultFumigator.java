import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Fumigator;;

@WebServlet("/consultFumigator")
public class ConsultFumigator extends HttpServlet {

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
            String fumigatorToConsult = request.getParameter("fumigatorToConsult");
            String sql = "SELECT * FROM Fumigador WHERE nombre='" + fumigatorToConsult + "';";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Fumigator> fumigators = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Fumigator newFumigator = new Fumigator();
                newFumigator.setId(res.getInt("id"));
                newFumigator.setNombre(res.getString("nombre"));
                newFumigator.setDireccion(res.getString("direccion"));
                newFumigator.setCorreo(res.getString("correo"));

                fumigators.add(newFumigator);
            }

            // Save users in session
            request.setAttribute("fumigators", fumigators);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/consultFumigator.jsp");

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