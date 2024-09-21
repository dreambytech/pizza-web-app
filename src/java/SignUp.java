import com.bean.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




public class SignUp extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        
        
        String username = req.getParameter("username");
        String userpassword = req.getParameter("userpassword");
        String useremail = req.getParameter("useremail");
        String usercontactno = req.getParameter("usercontactno");
        
        
        User ob=new User();
        
        ob.setUsername(username);
        ob.setUseremail(useremail);
        ob.setUserpassword(userpassword);
        ob.setUsercontactno(usercontactno);
        ob.setUserstatus1("true");
        ob.setUserstatus2("true");
        
        boolean value=ob.signUp();
        if(value==true) {
            String message = "Sucessfully Sign Up";
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
        else {
            String message = "Something Wrong!! Try Different Email Id";
            pw.println("<html>");
            pw.println("<head>");
            pw.println("<title>Alert Message</title>");
            pw.println("</head>");
            pw.println("<body>");
            pw.println("<script type='text/javascript'>");
            pw.println("alert('" + message + "');");
            pw.println("window.location.href = 'signuppage.html';"); // Redirect to another page after alert
            pw.println("</script>");
            pw.println("</body>");
            pw.println("</html>");
        }
    }
}