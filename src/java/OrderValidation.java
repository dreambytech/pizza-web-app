
import com.bean.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderValidation extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String email=request.getParameter("email");
        String time=request.getParameter("time");
        String bill="done";
        
        DataBase db=new DataBase();
        boolean result=db.update("update pizzaorder set billpaid='"+bill+"' where ordermail='"+email+"' and ordertime='"+time+"'");
        if(result==true) response.sendRedirect("adminorderlistpage.jsp");
        else out.println("Error Occur");
    }
}