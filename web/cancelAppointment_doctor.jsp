

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
            int id=Integer.parseInt(request.getParameter("aid"));
            Connection con = null;
            Statement stmt = null;
            
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
            //4.Execute query
            
            String query="delete from Appointment where aid="+id;
           
            stmt.executeUpdate(query);
            
            response.sendRedirect("cancel_patient.jsp?signal=ok");
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        %>
    </body>
</html>
