
import com.bean.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddPizza extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        String code = request.getParameter("pizzacode"); 
        String name = request.getParameter("pizzaname");
        String price = request.getParameter("pizzaprice");
        String discount = request.getParameter("pizzadiscount");
        
        DataBase ob=new DataBase();
        boolean result = ob.update("insert into pizzalist values('"+code+"','"+name+"','"+price+"','"+discount+"')");
        if(result==true) response.sendRedirect("adminpizzalistpage.jsp");
        else pw.println("Error Occur");
    }
}