import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Fumigator;;

@WebServlet("/modifyService")
public class ModifyService extends HttpServlet {

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
            String id = request.getParameter("id");
            double costo = Double.parseDouble(request.getParameter("costo"));
            String nombreFumigador = request.getParameter("nombre_fumigador");
            String fecha = request.getParameter("fecha");
            String nombreCliente = request.getParameter("nombre_cliente");
            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            String sql2 = "SELECT * FROM Cliente WHERE nombre='" + nombreCliente + "' ;";
            ResultSet res = stat.executeQuery(sql2);

            res.next();
            int idCliente = res.getInt("id");


            // Check if fumigator exists
            String sql3 = "SELECT * FROM Fumigador WHERE nombre='" + nombreFumigador + "';";
            ResultSet res2 = stat.executeQuery(sql3);

            res2.next();
            int idFumigador = res2.getInt("id");


            String sql = "UPDATE Servicio SET costo='" + costo + "', fecha='" + fecha + "', idFumigador='"
                    + idFumigador + "', idCliente='" + idCliente + "' WHERE id='" + id + "';";
            ;
            stat.executeUpdate(sql);

            stat.close();
            con.close();

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/services");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}