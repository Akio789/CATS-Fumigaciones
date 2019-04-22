import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;
import pojos.Provider;;

@WebServlet("/registerProduct")
public class RegisterProduct extends HttpServlet {

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
            String nombre = request.getParameter("nombre");
            double costo = Double.parseDouble(request.getParameter("costo"));
            int cant_disp = Integer.parseInt(request.getParameter("cant_disp"));
            String descr = request.getParameter("descr");
            String nombreProveedor = request.getParameter("nombre_proveedor");

            // JDBC
            Class.forName("com.mysql.jdbc.Driver");
            String url = "jdbc:mysql://localhost/" + db + "?useSSL=false&allowPublicKeyRetrieval=true";
            Connection con = DriverManager.getConnection(url, user, pass);
            Statement stat = con.createStatement();

            // Check if provider exists
            String sql = "SELECT * FROM Proveedor WHERE nombre='" + nombreProveedor + "';";
            ResultSet res = stat.executeQuery(sql);

            res.next();
            int idProveedor = res.getInt("id");

            // Only insert new product if provider exists
            Connection con2 = DriverManager.getConnection(url, user, pass);
            Statement stat2 = con2.createStatement();
            String sql2 = "INSERT INTO Producto (nombre, descripcion, cant_disp, costo, idProveedor)" + " VALUES ('"
                    + nombre + "', '" + descr + "', '" + cant_disp + "', '" + costo + "', '" + idProveedor + "');";
            stat2.executeUpdate(sql2, Statement.RETURN_GENERATED_KEYS);
            
            
            int productId = 0;
            ResultSet rs = stat2.getGeneratedKeys();
            if (rs.next()){
            	productId=rs.getInt(1);
            }	

            stat2.close();
            con2.close();
           
            System.out.println("$$$$$$$$$$$$$$$$$$$$$$$");
            System.out.println(productId);
            
            Connection con3 = DriverManager.getConnection(url, user, pass);
            Statement stat3 = con3.createStatement();

            // Check if provider exists
            String sql3 = "INSERT INTO UsuarioProducto (id_usuario, id_producto) VALUES ('"+ userId +"', '"+ productId + "');";
            stat3.executeUpdate(sql3);

            stat3.close();
            con3.close();
            

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/registerSuccess.jsp");

            request.setAttribute("lastPageForSuccess", "./products");
            request.setAttribute("lastPageForFailure", "./registerProduct.jsp");
            request.setAttribute("method", "POST");

            if (disp != null) {
                disp.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}