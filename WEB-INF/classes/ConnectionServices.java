import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Service;
import pojos.Client;
import pojos.Fumigator;

@WebServlet("/services")
public class ConnectionServices extends HttpServlet {

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
                Service newService = new Service();
                newService.setIdCliente(res.getInt("idCliente"));
                newService.setId(res.getInt("id"));
                newService.setIdFumigador(res.getInt("idFumigador"));
                newService.setCosto(res.getDouble("costo"));
                newService.setFecha(res.getString("fecha"));

                services.add(newService);
            }

            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "SELECT * FROM Cliente;";
            ResultSet res2 = stat.executeQuery(sql2);
            ArrayList<Client> clients = new ArrayList<>();

            // Iterate through ResultSet
            while (res2.next()) {
                Client newClient = new Client();
                newClient.setId(res2.getInt("id"));
                newClient.setNombre(res2.getString("nombre"));
                newClient.setDireccion(res2.getString("direccion"));
                newClient.setCorreo(res2.getString("correo"));
                newClient.setTelefono(res2.getString("telefono"));

                clients.add(newClient);
            }

            for (int i = 0; i < services.size(); i++) {
                for (int j = 0; j < clients.size(); j++) {
                    if (services.get(i).getIdCliente() == clients.get(j).getId()) {
                        services.get(i).setNombreCliente(clients.get(j).getNombre());
                    }
                }
            }



            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();
            String sql3 = "SELECT * FROM Fumigador;";
            ResultSet res3 = stat.executeQuery(sql3);
            ArrayList<Fumigator> fumigators = new ArrayList<>();

            // Iterate through ResultSet
            while (res3.next()) {
                Fumigator newFumigator = new Fumigator();
                newFumigator.setId(res3.getInt("id"));
                newFumigator.setNombre(res3.getString("nombre"));
                newFumigator.setDireccion(res3.getString("direccion"));
                newFumigator.setCorreo(res3.getString("correo"));

                fumigators.add(newFumigator);
            }

            for (int i = 0; i < services.size(); i++) {
                for (int j = 0; j < fumigators.size(); j++) {
                    if (services.get(i).getIdFumigador() == fumigators.get(j).getId()) {
                        services.get(i).setNombreFumigador(fumigators.get(j).getNombre());
                    }
                }
            }

            HttpSession session = request.getSession();
            session.setAttribute("clients", clients);
            session.setAttribute("fumigators", fumigators);
            // Save users in session
            request.setAttribute("services", services);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/services.jsp");

            stat.close();
            con.close();
            stat2.close();
            con2.close();
            stat3.close();
            con3.close();

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}