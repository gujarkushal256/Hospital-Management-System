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
import java.sql.*;  

/**
 *
 * @author CHIRAG LALWANI
 */
public class Donate extends HttpServlet {

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
            out.println("<title>Servlet appointment</title>");            
            out.println("</head>");
            out.println("<body>");
                    
            try {
            //Rgiester driver
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            System.out.println("Done");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
                // Establish connect
                Connection con = DriverManager.getConnection("jdbc:derby://localhost:1527/sample", "app", "app");
            System.out.println("EStablished HI");
//
                //3.Crete statement
                Statement stmt = con.createStatement();
            //4.Execute query
            String firstname=request.getParameter("firstName");
            String lastname=request.getParameter("lastName");
            String email=request.getParameter("email");
            String gender=request.getParameter("gender");
                String organ=request.getParameter("organ");
                String disease=request.getParameter("symptoms");
                    System.out.println(firstname);
                    System.out.println(lastname);
                    System.out.println(email);
                    System.out.println(organ);
                    System.out.println(disease);
           PreparedStatement ptstmt=con.prepareStatement("insert into Organ values(?,?,?,?,?,?)");  
            ptstmt.setString(1,firstname);//1 specifies the first parameter in the query  
            ptstmt.setString(2, lastname);
             ptstmt.setString(3, email);
             ptstmt.setString(4,gender);
              ptstmt.setString(5, organ);
               ptstmt.setString(6, disease);
               Statement s=con.createStatement();
               ResultSet rs=s.executeQuery("select pid from patient where firstname='"+firstname+"'");
               int id=0;
               while(rs.next()){
                   id=rs.getInt("PID");
               }
            int i=ptstmt.executeUpdate();
            String m="ok "+id;
            response.sendRedirect("confirmOrgan.jsp?flag="+m);
            System.out.println(i);
        } catch (SQLException e) {
            e.printStackTrace();
        }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    
   
}
