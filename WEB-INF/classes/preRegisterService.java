import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Fumigator;;

@WebServlet("/preRegisterService")
public class preRegisterService extends HttpServlet {

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
            int userId = Integer.parseInt(request.getParameter("userId"));
            double costo = Double.parseDouble(request.getParameter("costo"));
            int idFumigador = Integer.parseInt(request.getParameter("id_fumigador"));
            String fecha = request.getParameter("fecha");
            int idCliente = Integer.parseInt(request.getParameter("id_cliente"));

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            // Check if client exists
            String sql = "SELECT * FROM Cliente WHERE id='" + idCliente + "' ;";
            ResultSet res = stat.executeQuery(sql);

            res.next();

            // Check if fumigator exists
            String sql3 = "SELECT * FROM Fumigador WHERE id='" + idFumigador + "';";
            ResultSet res2 = stat.executeQuery(sql3);

            res2.next();

            // Only insert new product if client exists
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "INSERT INTO Servicio (costo, fecha, idFumigador, idCliente)" + " VALUES ('" + costo + "', '"
                    + fecha + "', '" + idFumigador + "', '" + idCliente + "');";
            stat2.executeUpdate(sql2, Statement.RETURN_GENERATED_KEYS);

            int serviceId = 0;
            ResultSet rs = stat2.getGeneratedKeys();
            if (rs.next()) {
                serviceId = rs.getInt(1);
            }

            stat2.close();
            con2.close();

            System.out.println("$$$$$$$$$$$$$$$$$$$$$$$");
            System.out.println(serviceId);

            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();

            // Check if provider exists
            String sql4 = "INSERT INTO UsuarioServicio (id_usuario, id_servicio) VALUES ('" + userId + "', '"
                    + serviceId + "');";
            stat3.executeUpdate(sql4);

            stat3.close();
            con3.close();

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/registerSuccess.jsp");

            request.setAttribute("lastPageForSuccess", "./services");
            request.setAttribute("lastPageForFailure", "./preRegisterService.jsp");
            request.setAttribute("method", "POST");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}