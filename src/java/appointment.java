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
public class appointment extends HttpServlet {

        protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                  int pid=Integer.parseInt(request.getParameter("pid"));
                  int did=Integer.parseInt(request.getParameter("did"));
                  String date=request.getParameter("date");
                  String sym=request.getParameter("symptoms");
                  String g=request.getParameter("gender");
                  String time=request.getParameter("time");
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
                    String query="select * from Appointment";
                    rs=stmt.executeQuery(query);
                    while(rs.next()){
                        count++;
                    }
                    int id=3001+count;
                    System.out.println(id);
                    count=0;
                    String query1="insert into Appointment values("+id+","+pid+","+did+",'"+sym+"','"+date+"','"+time+"')";
                    
//                    stmt1.executeUpdate(query1);
                    stmt1.executeUpdate(query1);
//                    stmt2.executeUpdate(query2);
                    response.sendRedirect("patient.jsp?flag="+id+" "+pid);
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

    
   
}
