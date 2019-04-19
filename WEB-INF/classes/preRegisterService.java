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
            double costo = Double.parseDouble(request.getParameter("costo"));
            String nombreFumigador = request.getParameter("nombre_fumigador");
            String fecha = request.getParameter("fecha");
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));



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
            String sql3 = "SELECT * FROM Fumigador WHERE nombre='" + nombreFumigador + "';";
            ResultSet res2 = stat.executeQuery(sql3);

            res2.next();
            int idFumigador = res2.getInt("id");

            // Only insert new product if client exists
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "INSERT INTO Servicio (costo, fecha, idFumigador, idCliente)" + " VALUES ('" + costo
                            + "', '" + fecha + "', '" + idFumigador + "', '" + idCliente + "');";
            stat2.executeUpdate(sql2);

            stat2.close();
            con2.close();

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher(nextPage);

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