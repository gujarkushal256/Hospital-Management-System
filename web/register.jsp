
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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <style>
            .gradient-custom {
                /* fallback for old browsers */
                background: #f093fb;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to bottom right, rgba(240, 147, 251, 1), rgba(245, 87, 108, 1))
            }

            .card-registration .select-input.form-control[readonly]:not([disabled]) {
                font-size: 1rem;
                line-height: 2.15;
                padding-left: .75em;
                padding-right: .75em;
            }
            .card-registration .select-arrow {
                top: 13px;
                }
        </style>
    </head>
    <body onload="IdGen()">
        <section class="vh-100 gradient-custom">
  <div class="container py-5 h-100">
    <div class="row justify-content-center align-items-center h-100">
      <div class="col-12 col-lg-9 col-xl-7">
        <div class="card shadow-2-strong card-registration" style="border-radius: 15px;">
          <div class="card-body p-4 p-md-5">
            <h3 class="mb-4 pb-2 pb-md-0 mb-md-5">Registration Form</h3>
            <form action="registration" method="GET">
                <%
                  
                  String id=request.getParameter("rid");
                  System.out.println(id);
                  out.println("<input type='text' id='id' value="+id+" hidden=true>");

              %>
              <div class="row">
                <div class="col-md-6 mb-4">

                  <div class="form-outline">
                      <input type="text" id="firstName" name="firstname" class="form-control form-control-lg" required="true" />
                    <label class="form-label" for="firstName">First Name</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                  <div class="form-outline">
                      <input type="text" id="lastName" name="lastname" class="form-control form-control-lg" required="true" />
                    <label class="form-label" for="lastName">Last Name</label>
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 d-flex align-items-center">

                  <div class="form-outline datepicker w-100">
                      <input type="email" class="form-control form-control-lg" name="email" id="email" required="true" />
                    <label for="birthdayDate" class="form-label">Email</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4">

                  <h6 class="mb-2 pb-1">Gender: </h6>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="femaleGender"
                      value="F" checked />
                    <label class="form-check-label" for="femaleGender">Female</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="maleGender"
                      value="M" />
                    <label class="form-check-label" for="maleGender">Male</label>
                  </div>

                  <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="otherGender"
                      value="O" />
                    <label class="form-check-label" for="otherGender">Other</label>
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-md-6 mb-4 pb-2">

                  <div class="form-outline">
                      <input type="password" id="pass" name="pass" class="form-control form-control-lg" required="true" />
                    <label class="form-label" for="password">Password</label>
                  </div>

                </div>
                <div class="col-md-6 mb-4 pb-2">

                  <div class="form-outline">
                      <input type="password" id="cnfpass" class="form-control form-control-lg" required="true" />
                    <label class="form-label" for="cnfpass">Confirm Password</label>
                  </div>

                </div>
              </div>

              <div class="row">
                <div class="col-12">

                  <div class="form-outline">
                      <input type="text" name="phone" id="phoneNumber" class="form-control form-control-lg" required="true" />
                    <label class="form-label" for="phoneNumber">Phone Number</label>
                  </div>

                </div>
              </div>
              
              <div class="mt-4 pt-2">
                  <input class="btn btn-primary btn-lg" type="submit" value="Submit" onclick="Validate()" />
                  <button type="button" class="btn btn-danger float-right" ><a class="nav-link" href="index.jsp">LOGIN</a></button>
              </div>

            </form>
          </div>
        </div>
              
      </div>
    </div>
  </div>
</section>
        
        <script>
            function Validate(){
                var pass=document.getElementById("pass").value;
                var cnfpass=document.getElementById("cnf").value;
                if(pass===cnfpass){
                    alert("Confirm Submission!");
                }else{
                    alert("Password Not Matched!");
                }
            }
            function IdGen(){
                var id=document.getElementById("id").value;
                if(id>2001){
                    alert("Registration Successfull! Your Id is "+id);
                }
            }
        </script>
    </body>
</html>
