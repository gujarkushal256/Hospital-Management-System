

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
        <title>View Appointment</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
        #cancel{
            display:none;
        }
    </style>
    </head>
    <body onload="Success()">
         <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">MEDICAL</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
      <% int id=0;
         try{
             id=Integer.parseInt(request.getParameter("id"));
         }catch(Exception e){
             
         }   
      %>
    <ul class="navbar-nav">
      <li class="nav-item active">
          <a class="nav-link" href=<% out.println("viewAppointment_patient.jsp?id="+id);%> >View Appointment</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("patient.jsp?id="+id);%>>Book Appointment</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("donateOrgan.jsp?id="+id);%>>Donate Organ</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("treatmentHistory.jsp?id="+id);%>>Treatment History</a>
      </li>
    <li class="nav-item active">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </li>
      <li class="nav-item active">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </li>
      <li class="nav-item active">
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </li>
      <li class="nav-item active">
           &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      </li>
      
      <li class="nav-item active">
          <button type="button" class="btn btn-danger float-right" ><a class="nav-link" href="index.jsp">LOGOUT</a></button>
      </li>
      </ul>
  </div>
</nav>   <%
//        String name=request.getParameter("name").trim();
            Connection con = null;
            ResultSet rs = null;
            ResultSet rs1=null;
            Statement stmt1=null;
            Statement stmt = null;
            out.println("<br/><center><h1><U>TREATMENT HISTORY</U></h1><BR/><BR/><table class=\"table table-striped w-auto px-8\">\n");
            out.println("  <thead>\n" +
                        "    <tr>\n" +
                        "      <th scope=\"col\">APPOINTMENT ID</th>\n" +
                        "      <th scope=\"col\">DOCTOR ID</th>\n" +
                        "      <th scope=\"col\">SYMPTOMS</th>\n" +
                        "      <th scope=\"col\">TREATMENT</th>\n" +
                        "      <th scope=\"col\">NOTE</th>\n" +
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
            
            
            String query1="select * from treatment where pid="+id;
            
            rs1=stmt1.executeQuery(query1);
//            System.out.println("Begin While");
            while(rs1.next()){
                int a=rs1.getInt("AID");
                int d=rs1.getInt("DID");
                int p=rs1.getInt("PID");
                String s=rs1.getString("SYMPTOMS");
                String treat=rs1.getString("TREATMENT");
                String n=rs1.getString("NOTE");
                String date=rs1.getString("DATE");
                String t=rs1.getString("TIME");
                System.out.println(a+" "+p+" "+" "+s+" "+date+" "+t);
                out.println(
                            "    <tr>\n" +
                            "      <td>"+a+"</td>\n" +
                            "      <td>"+p+"</td>\n" +
                            "      <td>"+s+"</td>\n" +
                            "      <td>"+treat+"</td>\n" +
                            "      <td>"+n+"</td>\n" +
                            "      <td>"+d+"</td>\n" +
                            "      <td>"+t+"</td>\n" +
                            "    </tr>\n" );
            }
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        out.println("  </tbody>\n" +
                        "</table></CENTER>");


        %>
        
    </body>
    
</html>
