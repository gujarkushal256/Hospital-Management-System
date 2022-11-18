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
public class registration extends HttpServlet {

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
        String fname=request.getParameter("firstname");
                  String lname=request.getParameter("lastname");
                  String email=request.getParameter("email");
                  String pass=request.getParameter("pass");
                  String phn=request.getParameter("phone");
                  System.out.println(phn);
                  String g=request.getParameter("gender");
                  Connection con = null;
                  ResultSet rs = null;
                  Statement stmt1=null;
                  Statement stmt = null;
                  Statement stmt2=null;
            
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
                    stmt2=con.createStatement();
                    //4.Execute query
                    int count=0;
                    String query="select * from patient";
                    rs=stmt.executeQuery(query);
                    while(rs.next()){
                        count++;
                    }
                    int id=2002+count;
                    count=0;
                    String query1="insert into patient values("+id+",'"+fname+"','"+lname+"','"+g+"','"+email+"','"+phn+"')";
                    String query2="insert into login_patient values("+id+",'"+pass+"')";
//                    stmt1.executeUpdate(query1);
                    stmt1.executeUpdate(query1);
                    stmt2.executeUpdate(query2);
                    response.sendRedirect("register.jsp?rid="+id);
        }catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (rs != null) {
                rs.close();
            }
            if (stmt != null) {
                stmt.close();
            }
            if (stmt1 != null) {
                stmt1.close();
            }
            if(stmt2!=null){
                stmt.close();
            }
            if (con != null) {
                con.close();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
