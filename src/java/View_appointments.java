/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author CHIRAG LALWANI
 */
public class View_appointments extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet View_appointments</title>");
            out.print("<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css\" integrity=\"sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T\" crossorigin=\"anonymous\">");
//            String name=request.getParameter("name").trim();
            int id=Integer.parseInt(request.getParameter("id"));
            Connection con = null;
            ResultSet rs = null;
            ResultSet rs1=null;
            Statement stmt1=null;
            Statement stmt = null;
            out.println("<br/><center><h1><U>APPOINTMENT DETAILS</U></h1><BR/><BR/><table class=\"table table-striped w-auto px-8\">\n");
            out.println("  <thead>\n" +
                        "    <tr>\n" +
                        "      <th scope=\"col\">APPOINTMENT ID</th>\n" +
                        "      <th scope=\"col\">DOCTOR ID</th>\n" +
                        "      <th scope=\"col\">SYMPTOMS</th>\n" +
                        "      <th scope=\"col\">DATE</th>\n" +
                        "      <th scope=\"col\">TIME</th>\n" +
                        "    </tr>\n"+
                        "  </thead>\n"+
                        "  <tbody>\n" 
                        );
            try {
            //Rgiester driver
             Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Done");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try{
                con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            System.out.println("EStablished");
//
            //3.Crete statement
            stmt = con.createStatement();
            stmt1=con.createStatement();
            //4.Execute query
            System.out.println("ID="+id);
            String query1="select * from Appointment where did="+id;
            
            rs1=stmt1.executeQuery(query1);
//            System.out.println("Begin While");
            while(rs1.next()){
                int a=rs1.getInt("AID");
                int p=rs1.getInt("PID");
                int d=rs1.getInt("DID");
                String s=rs1.getString("SYMPTOMS");
                String date=rs1.getString("DATE");
                String t=rs1.getString("TIME");
                System.out.println(a+" "+p+" "+" "+s+" "+date+" "+t);
                out.println(
                            "    <tr>\n" +
                            "      <td>"+a+"</td>\n" +
                            "      <td>"+d+"</td>\n" +
                            "      <td>"+s+"</td>\n" +
                            "      <td>"+d+"</td>\n" +
                            "      <td>"+t+"</td>\n" +
                            "    </tr>\n" );
            }
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        out.println("  </tbody>\n" +
                        "</table></CENTER>");

   

}
}
}

