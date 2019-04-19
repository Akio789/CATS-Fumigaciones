import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/preRegisterService")
public class preRegisterService extends HttpServlet {

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
            double costo = Double.parseDouble(request.getParameter("costo"));
            int idFumigador = Integer.parseInt(request.getParameter("idFumigador"));
            String fecha = request.getParameter("fecha");
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));

            // Only execute insert if client and fumigator exist
            String nextPage = "/preRegisterServiceError.jsp";
            boolean clientExists = false;
            boolean fumigatorExists = false;

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            // Check if client exists
            String sql = "SELECT * FROM Cliente;";
            ResultSet res = stat.executeQuery(sql);

            while (res.next()) {
                if (res.getInt("id") == idCliente) {
                    nextPage = "/registerSuccess.jsp";
                    clientExists = true;
                }
            }

            // Check if fumigator exists
            String sql3 = "SELECT * FROM Fumigador;";
            ResultSet res2 = stat.executeQuery(sql3);

            while (res2.next()) {
                if (res2.getInt("id") == idFumigador) {
                    nextPage = "/registerSuccess.jsp";
                    fumigatorExists = true;
                }
            }

            // Only insert new product if client exists
            if (clientExists && fumigatorExists) {
                Connection con2 = DriverManager.getConnection(url, user, pass);
                Statement stat2 = con2.createStatement();
                String sql2 = "INSERT INTO Servicio (costo, fecha, idFumigador, idCliente)" + " VALUES ('"
                        + costo + "', '" + fecha + "', '" + idFumigador + "', '" + idCliente + "');";
                stat2.executeUpdate(sql2);

                stat2.close();
                con2.close();
            }

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher(nextPage);

            request.setAttribute("lastPageForSuccess", "./services");
            request.setAttribute("lastPageForFailure", "./preRegisterService.jsp");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}