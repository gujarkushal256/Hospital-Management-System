

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
    <ul class="navbar-nav">
        <%
            String name=request.getParameter("name").trim();
        %>
      <li class="nav-item active">
          <a class="nav-link" href=<% out.println("viewAppointment.jsp?name="+name);%> >Manage Appointment</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("patientSearch.jsp?name="+name);%>>Search Patient</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("addTreatment.jsp?name="+name);%>>Add Treatment</a>
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
</nav>
        <%
        
            Connection con = null;
            ResultSet rs = null;
            ResultSet rs1=null;
            Statement stmt1=null;
            Statement stmt = null;
            out.println("<br/><center><h1><U>APPOINTMENT DETAILS</U></h1><BR/><BR/><table class=\"table table-striped w-auto px-8\">\n");
            out.println("  <thead>\n" +
                        "    <tr>\n" +
                        "      <th scope=\"col\">APPOINTMENT ID</th>\n" +
                        "      <th scope=\"col\">PATIENT ID</th>\n" +
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
            int id=0;
            System.out.println(name);
            String query="select did from doctor where firstname='"+name+"'";
            rs=stmt.executeQuery(query);
            System.out.println("Begin While");
            while(rs.next()){
                id=rs.getInt("DID");
                System.out.println("I="+id);
            }
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
                            "      <td>"+p+"</td>\n" +
                            "      <td>"+s+"</td>\n" +
                            "      <td>"+date+"</td>\n" +
                            "      <td>"+t+"</td>\n" +
                            "    </tr>\n" );
            }
            
            
        }catch (SQLException e) {
            e.printStackTrace();
        }
        out.println("  </tbody>\n" +
                        "</table></CENTER>");


        %>
        <DIV class="text-center text-lg-start mt-4 pt-2" style="align-items: center">
            
                <center><BUTTON class="btn btn-primary btn-lg"
                                style="padding-left: 2.5rem; padding-right: 2.5rem;" value="" onclick="Canceled()">CANCEL APPOINTMENT</button></center>
            
            <section id="cancel" >
                <br/><br/>
                <center><h2><u>CANCEL APPOINTMENT</u></h2><br><br>
                <FORM action="cancelAppointment_doctor.jsp" method="GET">
                    <input type="text" name="aid"  placeholder="Enter Appointment ID"/><br/><br/>
                    <center><input type="submit" class="btn btn-primary btn-lg"
                               style="padding-left: 2.5rem; padding-right: 2.5rem;" value="SUBMIT"></center>
                    
                </FORM></center>
            </section>
            <%
                String flag=request.getParameter("signal");
                if(flag!=null){
                    out.println("<input type=\"text\" id='signal' value="+flag+" hidden=true />");
                }
            %>
        </DIV>
        <script>
            function Canceled(){
                var x = document.getElementById("cancel");
                if (x.style.display === "none") {
                        x.style.display = "block";
                } else {
//                    console.log(x.style.display);
                    x.style.display = "none";
                }
            }
            function Success(){
                var x=document.getElementById("signal").value;
                if(x=="ok"){
                    alert("Appointment Canceled!!");
                }
            }
        </script>
    </body>
    
</html>
