

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String i=request.getParameter("aid");
            if(i!=null){
                
            
            int id=Integer.parseInt(i);
            Connection con = null;
            Statement stmt = null;
            ResultSet rs=null;
            Statement s=null;
            
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
            s=con.createStatement();
            //4.Execute query
            String q="select pid from Appointment where aid="+id;
            rs=s.executeQuery(q);
            int p=0;
            while(rs.next()){
                p=rs.getInt("PID");
            }
            String query="delete from Appointment where aid="+id;
           
            stmt.executeUpdate(query);
            String m="ok@"+p;
            response.sendRedirect("cancel_patient.jsp?signal="+m);
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }}
        %>
    </body>
</html>
