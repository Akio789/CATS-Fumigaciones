import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Service;

@WebServlet("/services")
public class ConnectionServices extends HttpServlet {

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
            String sql = "SELECT * FROM Servicio;";
            ResultSet res = stat.executeQuery(sql);

            ArrayList<Service> services = new ArrayList<>();

            // Iterate through ResultSet
            while (res.next()) {
                Service newService = new Service ();
                newService.setIdCliente(res.getInt("idCliente"));
                newService.setId(res.getInt("id"));
                newService.setIdFumigador(res.getInt("idFumigador"));
                newService.setCosto(res.getDouble("costo"));
                newService.setFecha(res.getString("fecha"));

                services.add(newService);
            }

            // Save users in session
            HttpSession session = request.getSession(false);
            session.setAttribute("services", services);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/services.jsp");

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