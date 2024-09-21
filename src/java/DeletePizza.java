
import com.bean.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class DeletePizza extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        
        String pizzaid=request.getParameter("pizzacode");
        
        DataBase db=new DataBase();
        boolean result=db.update("delete from pizzalist where pizzacode='"+pizzaid+"'");
        if(result==true) response.sendRedirect("adminpizzalistpage.jsp");
        else out.println("Error Occur");
    }
}