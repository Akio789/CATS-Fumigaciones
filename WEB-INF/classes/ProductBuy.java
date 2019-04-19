import java.io.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.ArrayList;

@WebServlet("/productBuy")
public class ProductBuy extends HttpServlet {

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

            int id = Integer.parseInt(request.getParameter("id"));
            Statement stat = con.createStatement();
            String sql = "SELECT cant_disp FROM Producto WHERE id='" + id + "';";
            ResultSet res = stat.executeQuery(sql);

            int currentQuantity = 0;
            int boughtQuantity = Integer.parseInt(request.getParameter("quantity"));
            // Iterate through ResultSet
            while (res.next()) {
                currentQuantity = res.getInt("cant_disp");
            }

            int newQuantity = currentQuantity + boughtQuantity;

            sql = "UPDATE Producto SET cant_disp=' " + newQuantity + " ' WHERE id='" + id + "';";
            stat.executeUpdate(sql);

            // Determine page to dispatch to
            RequestDispatcher disp = getServletContext().getRequestDispatcher("/products");

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