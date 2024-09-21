
import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SignIn extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();

        String useremail = req.getParameter("useremail");
        String userpassword = req.getParameter("userpassword");
        String link;

        User ob = new User();
        ob.setUseremail(useremail);
        ob.setUserpassword(userpassword);
        boolean result = ob.signIn();
        if (result == true) {
            System.out.println("I Goooooooooooooooooooooooooo"+ob.getUsername());
            if (ob.getUsername().equals("admin196")) {
                
                res.sendRedirect("adminpage.html");
            } else {
                HttpSession ses = req.getSession();
                ses.setAttribute("username", ob.getUsername());
                ses.setAttribute("useremail", useremail);
                res.sendRedirect("pizzalistpage.jsp");
            }
        } else {
            String message = "Failed to Sign In";
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
