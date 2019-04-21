import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;

import pojos.Client;
import pojos.Fumigator;
import pojos.Product;
import pojos.ProductService;
import pojos.Provider;
import pojos.Service;

@WebServlet("/reports")
public class Reports extends HttpServlet {

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
            ResultSet res2 = stat2.executeQuery(sql2);
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
            double servicesTotal = 0;
            
            for (int i = 0; i < services.size(); i++) {
                for (int j = 0; j < clients.size(); j++) {
                    if (services.get(i).getIdCliente() == clients.get(j).getId()) {
                        services.get(i).setNombreCliente(clients.get(j).getNombre());
                    }
                }
                servicesTotal += services.get(i).getCosto();
            }

            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();
            String sql3 = "SELECT * FROM Fumigador;";
            ResultSet res3 = stat3.executeQuery(sql3);
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
            
            Connection con4 = DriverManager.getConnection(url, user, pass);
            Statement stat4 = con4.createStatement();
            String sql4 = "SELECT * FROM Producto;";
            ResultSet res4 = stat4.executeQuery(sql4);
            ArrayList<Product> products = new ArrayList<>();
            

            // Iterate through ResultSet
            while (res4.next()) {
            	Product newProduct = new Product();
                newProduct.setCant_disp(res4.getInt("cant_disp"));
                newProduct.setId(res4.getInt("id"));
                newProduct.setIdProveedor(res4.getInt("idProveedor"));
                newProduct.setCosto(res4.getDouble("costo"));
                newProduct.setNombre(res4.getString("nombre"));
                newProduct.setDescripcion(res4.getString("descripcion"));

                products.add(newProduct);
            }
            
            Connection con5 = DriverManager.getConnection(url, user, pass);
            Statement stat5 = con5.createStatement();
            String sql5 = "SELECT ProductoServicio.* ,Producto.id,Producto.costo FROM ProductoServicio CROSS JOIN Producto ON ProductoServicio.id_producto = Producto.id;";
            ResultSet res5 = stat5.executeQuery(sql5);
            
            
            double servicesCost = 0;
            // Iterate through ResultSet
            while (res5.next()) {
            	servicesCost += res5.getDouble("cantidad") * res5.getDouble("costo");
            }
            
            
            int servicesSize = services.size();
            
            
            HttpSession session = request.getSession();
            session.setAttribute("serviceTotal", servicesTotal);
            session.setAttribute("serviceSize", servicesSize);
            session.setAttribute("serviceCost", servicesCost);
            session.setAttribute("clients", clients);
            session.setAttribute("fumigators", fumigators);
            session.setAttribute("products", products);

            // Save clients and fumigators in session
            request.setAttribute("services", services);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/reports.jsp");

            stat.close();
            con.close();
            stat2.close();
            con2.close();
            stat3.close();
            con3.close();
            stat4.close();
            con4.close();
            stat5.close();
            con5.close();
            
            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}