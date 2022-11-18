/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
import java.io.IOException;
import java.io.PrintStream;
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
 * @author CHIRAG LALWANI
 */
public class NewServlet extends HttpServlet {

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        HttpSession session=request.getSession();
        int id=0;
        try{
            id=Integer.parseInt(request.getParameter("username"));
        }catch(Exception e){
            
        }
        
        
        String password=request.getParameter("password");
//        System.out.println("Username: "+username+"Password: "+password);
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
            String query="select * from login_patient";
            String query1="select * from login_doctor";
            
            rs=stmt.executeQuery(query);
            rs1=stmt1.executeQuery(query1);
            //rs = stmt.executeQuery(query);
            //5.Process the result set
            int flag=1;
            while (rs.next()) {
                int i = rs.getInt("PID");
                String pass=rs.getString("PASSWORD");
                System.out.println("Username" + i + "Description" + pass);
                if(id==i && password.equals(pass)){
                    flag=0;
                    response.sendRedirect("patient.jsp?id="+id);
                    break;
                }

            }
            System.out.println(flag);
            int flag1=1;
            
            while (rs1.next()) {
                int i = rs1.getInt("DID");
                String pass=rs1.getString("PASSWORD");
                System.out.println("Username" + i + "Description" + pass);
                if(id==i && password.equals(pass)){
                    flag1=0;
                    String query2="select firstname from doctor where did="+i;
                    rs=stmt.executeQuery(query2);
                    while(rs.next()){
                        String name=rs.getString("FIRSTNAME");
                        response.sendRedirect("doctor.jsp?name="+name);
                    }
//                    RequestDispatcher rd=request.getRequestDispatcher("Patient.html");
//                    rd.forward(request, response);
                    break;
                }

            }
            
            if(flag==1 && flag1==1){
                response.sendRedirect("index.jsp?flag="+flag);
            }
            System.out.println("Username:"+id+"Password"+password);                

        } catch (SQLException e) {
            e.printStackTrace();
        }

}

   

   

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
