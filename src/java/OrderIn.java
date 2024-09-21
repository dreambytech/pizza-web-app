import com.bean.DataBase;
import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.LocalDateTime;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderIn extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        HttpSession ses = req.getSession();

        String ordermail = (String) ses.getAttribute("useremail");
        String orderlist = (String) ses.getAttribute("orderlist");
        String orderlocation = req.getParameter("orderlocation");
        String totalcost = String.valueOf(ses.getAttribute("totalprice"));
        String billpaid = "undone";
        String currentDate = LocalDateTime.now().toString();
        String message;

        DataBase ob = new DataBase();
        ses.invalidate();
        if(orderlocation.equals("")||orderlocation==null){
            message="Failed to place order";
            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title>Alert Message</title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<script type='text/javascript'>");
            pw.println("alert('Forget to Enter Location');alert('" + message + "');");
            pw.println("window.location.href = 'index.html';"); // Redirect to another page after alert
            pw.println("</script>");
            pw.println("</body>");
            pw.println("</html>");
        }
        boolean result = ob.update("insert into pizzaorder values('" + ordermail + "','" + orderlist + "','" + orderlocation + "','" + totalcost + "','" + billpaid + "','"+currentDate+"')");
        if (result == true) {
            message = "Order placed successfully!";

            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title>Alert Message</title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<script type='text/javascript'>");
            pw.println("alert('" + message + "');");
            pw.println("window.location.href = 'index.html';"); // Redirect to another page after alert
            pw.println("</script>");
            pw.println("</body>");
            pw.println("</html>");
        } else {
            message="Failed to place order";
            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title>Alert Message</title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<script type='text/javascript'>");
            pw.println("alert('" + message + "');");
            pw.println("window.location.href = 'index.html';"); // Redirect to another page after alert
            pw.println("</script>");
            pw.println("</body>");
            pw.println("</html>");
        }

    }
}
