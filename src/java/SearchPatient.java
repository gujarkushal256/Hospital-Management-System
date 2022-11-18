/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author gujar
 */
public class SearchPatient extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        
        
        int id;
        String name=request.getParameter("id");
        if(name!=null){
            id=Integer.parseInt(name);
        }else{
            id=0;
        }
        String firstname=request.getParameter("firstName");
        String lastname=request.getParameter("lastName");

        Connection con = null;
        ResultSet rs = null;
        ResultSet rs1=null;
        Statement stmt1=null;
        Statement stmt = null;
            
            
        try {
            //Rgiester driver
             Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Done");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            // Establish connect
            con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            System.out.println("EStablished");
//
            //3.Crete statement
            stmt = con.createStatement();
            stmt1=con.createStatement();
            //4.Execute query
          
//            System.out.println("Username:"+username+"Password"+password);                
            //String query = "select * from Product";
            System.out.println(firstname);

            
            
            
            System.out.println(id);
            //rs = stmt.executeQuery(query);
            //5.Process the result set
            if((id>1000 &&id<2000 )|| id>=3000){
                response.sendRedirect("patientSearch.jsp");
            }

            if(id>2000 && id<3000){
                System.out.println(id);
                String query="select * from patient where pid="+id;
                rs=stmt.executeQuery(query);
                while(rs.next()){
                    int i=rs.getInt("PID");
                    String fn=rs.getString("FIRSTNAME");
                    String ln=rs.getString("LASTNAME");
                    String g=rs.getString("SEX");
                    String e=rs.getString("EMAIL");
                    int p=rs.getInt("PHONE");
                    System.out.println("Id: "+i+"fn: "+fn+"ln: "+ln+"g: "+g+"e: "+e+"p: "+p);
                
              response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Patient Details</title>"); 
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class=\"navbar navbar-expand-lg navbar-dark bg-primary\">\n" +
"  <a class=\"navbar-brand\" href=\"#\">MEDICAL</a>\n" +
"  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
"    <span class=\"navbar-toggler-icon\"></span>\n" +
"  </button>\n" +
"  <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n" +
"    <ul class=\"navbar-nav\">\n" +
"      <li class=\"nav-item active\">\n" +

"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"        <a class=\"nav-link\" href=\"patientSearch.jsp?name=\"+request.getParameter(\"name\")>Search Patient</a>\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"        <a class=\"nav-link\" href=\"viewAppointment.jsp?name=\"+request.getParameter(\"name\")>Add Treatment</a>\n" +
"      </li>\n" +
"    <li class=\"nav-item active\">\n" +
"           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      \n" +
"      <li class=\"nav-item active\">\n" +
"          <button type=\"button\" class=\"btn btn-danger float-right\" ><a class=\"nav-link\" href=\"index.jsp\">LOGOUT</a></button>\n" +
"      </li>\n" +
"      </ul>\n" +
"  </div>\n" +
"</nav>");
            out.println("<br/><br/>"+"<div class='container md-8'>"+"<center>"+"<h1><u>PATIENT DETAILS</u></h1>"+"<br/><br/>"+"<table class=\"table table-striped w-auto px-8\">\n" +
"  <thead>\n" +
"    <tr>\n" +
"      <th scope=\"col\">#</th>\n" +
"      <th scope=\"col\">PARAMETER</th>\n" +
"      <th scope=\"col\">VALUE</th>\n" +
"    </tr>\n" +
"  </thead>\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <th scope=\"row\">1</th>\n" +
"      <td>ID</td>\n" +
"      <td>"+i+"</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"      <th scope=\"row\">2</th>\n" +
"      <td>NAME</td>\n" +
"      <td>"+fn+" "+ln+"</td>\n" +

"    </tr>\n" +
"    <tr>\n" +
"      <th scope=\"row\">3</th>\n" +
"      <td>SEX</td>\n" +
"      <td>"+g+"</td>\n" +
"    </tr>\n" +
        "    <tr>\n" +
"      <th scope=\"row\">4</th>\n" +
"      <td>EMAIL</td>\n" +
"      <td>"+e+"</td>\n" +
"    </tr>\n" +
        "    <tr>\n" +
"      <th scope=\"row\">5</th>\n" +
"      <td>PHONE NUMBER</td>\n" +
"      <td>"+p+"</td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>"+"</center>"+"</div>");
            out.println("</body>");
            out.println("</html>");
        }}
            }
            
                        if(firstname!=null){
                String query1="select * from patient where firstname='"+firstname+"'";
                rs1=stmt1.executeQuery(query1);
                while(rs1.next()){
                    int i=rs1.getInt("PID");
                    String fn=rs1.getString("FIRSTNAME");
                    String ln=rs1.getString("LASTNAME");
                    String g=rs1.getString("SEX");
                    String e=rs1.getString("EMAIL");
                    int p=rs1.getInt("PHONE");
                    System.out.println("Id: "+i+"fn: "+fn+"ln: "+ln+"g: "+g+"e: "+e+"p: "+p);
                    
                    response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Patient Details</title>"); 
            out.println("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi\" crossorigin=\"anonymous\">");
            out.println("</head>");
            out.println("<body>");
            out.println("<nav class=\"navbar navbar-expand-lg navbar-dark bg-primary\">\n" +
"  <a class=\"navbar-brand\" href=\"#\">MEDICAL</a>\n" +
"  <button class=\"navbar-toggler\" type=\"button\" data-toggle=\"collapse\" data-target=\"#navbarNav\" aria-controls=\"navbarNav\" aria-expanded=\"false\" aria-label=\"Toggle navigation\">\n" +
"    <span class=\"navbar-toggler-icon\"></span>\n" +
"  </button>\n" +
"  <div class=\"collapse navbar-collapse\" id=\"navbarNav\">\n" +
"    <ul class=\"navbar-nav\">\n" +
"      <li class=\"nav-item active\">\n" +

"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"        <a class=\"nav-link\" href=\"patientSearch.jsp?name=\"+request.getParameter(\"name\")>Search Patient</a>\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"        <a class=\"nav-link\" href=\"viewAppointment.jsp?name=\"+request.getParameter(\"name\")>Add Treatment</a>\n" +
"      </li>\n" +
"    <li class=\"nav-item active\">\n" +
"           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      <li class=\"nav-item active\">\n" +
"           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\n" +
"      </li>\n" +
"      \n" +
"      <li class=\"nav-item active\">\n" +
"          <button type=\"button\" class=\"btn btn-danger float-right\" ><a class=\"nav-link\" href=\"index.jsp\">LOGOUT</a></button>\n" +
"      </li>\n" +
"      </ul>\n" +
"  </div>\n" +
"</nav>");
            out.println("<br/><br/>"+"<div class='container md-8'>"+"<center>"+"<h1><u>PATIENT DETAILS</u></h1>"+"<br/><br/>"+"<table class=\"table table-striped w-auto px-8\">\n" +
"  <thead>\n" +
"    <tr>\n" +
"      <th scope=\"col\">#</th>\n" +
"      <th scope=\"col\">PARAMETER</th>\n" +
"      <th scope=\"col\">VALUE</th>\n" +
"    </tr>\n" +
"  </thead>\n" +
"  <tbody>\n" +
"    <tr>\n" +
"      <th scope=\"row\">1</th>\n" +
"      <td>ID</td>\n" +
"      <td>"+i+"</td>\n" +
"    </tr>\n" +
"    <tr>\n" +
"      <th scope=\"row\">2</th>\n" +
"      <td>NAME</td>\n" +
"      <td>"+fn+" "+ln+"</td>\n" +

"    </tr>\n" +
"    <tr>\n" +
"      <th scope=\"row\">3</th>\n" +
"      <td>SEX</td>\n" +
"      <td>"+g+"</td>\n" +
"    </tr>\n" +
        "    <tr>\n" +
"      <th scope=\"row\">3</th>\n" +
"      <td>EMAIL</td>\n" +
"      <td>"+e+"</td>\n" +
"    </tr>\n" +
        "    <tr>\n" +
"      <th scope=\"row\">3</th>\n" +
"      <td>PHONE NUMBER</td>\n" +
"      <td>"+p+"</td>\n" +
"    </tr>\n" +
"  </tbody>\n" +
"</table>"+"</center>"+"</div>");
            out.println("</body>");
            out.println("</html>");
        }
                }
            }
//            System.out.println("Username:"+id+"Password"+password);                

        } catch (SQLException e) {
            e.printStackTrace();
        }

        
    }

 
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
