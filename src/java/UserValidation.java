
import com.bean.DataBase;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserValidation extends HttpServlet{
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setContentType("text/html");
        PrintWriter pw=response.getWriter();
        String email=request.getParameter("validemail");
        DataBase ob=new DataBase();
        boolean ind=false;
        try{
            ResultSet rs=ob.read("select * from pizzauser where useremail='"+email+"'");
            if(rs.next())ind=Boolean.valueOf(rs.getString(6));
            else throw new Exception("No Value");
            if(ind==true) ind=false;
            else ind=true;
            ob.update("update pizzauser set userstatus2='"+String.valueOf(ind)+"' where useremail='"+email+"'");
            response.sendRedirect("admincustomerlistpage.jsp");
        }
        catch(Exception e){
            pw.println("404 Error Occured/"+e+"/"+ind+"/"+email);
        }
    }
}