

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body onload="myFunction()">
    
  <section class="vh-100">
    <div class="container-fluid h-100">
      <div class="row d-flex justify-content-center align-items-center h-100">
        <div class="col-md-9 col-lg-6 col-xl-5">
          <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.webp"
            class="img-fluid" alt="Sample image">
        </div>
        <div class="col-md-8 col-lg-6 col-xl-4 offset-xl-1">
            <form action="NewServlet" method="Get">
                
            
           
  
            
  
            <!-- Email input -->
            <div class="form-outline mb-4">
                <input type="text" name="username" id="username" class="form-control form-control-lg"
                placeholder="Enter a valid ID" />
              <label class="form-label" for="username">ID</label>
            </div>
  
            <!-- Password input -->
            <div class="form-outline mb-3">
              <input type="password" name="password" id="password" class="form-control form-control-lg"
                placeholder="Enter password" />
              <label class="form-label" for="password">Password</label>
            </div>
  
            <div class="d-flex justify-content-between align-items-center">
  
            <div class="text-center text-lg-start mt-4 pt-2">
                <%
        int flag=0;
        
        try{
            flag=Integer.parseInt(request.getParameter("flag"));
            
            
        }catch(Exception e){
            
        }
        System.out.println(flag);
            out.println("<input type=\"text\" name=\"txt\" hidden=true value="+flag+" id=\"flag\">");
    %>
              <input type="submit" class="btn btn-primary btn-lg"
                     style="padding-left: 2.5rem; padding-right: 2.5rem;" value="Login">
              <p class="small fw-bold mt-2 pt-1 mb-0">Don't have an account? <a href="register.jsp"
                  class="link-danger">Register</a></p>
            </div>
  
          
        </div>
            </form>
            
      </div>
    </div>
    <div
      class="d-flex flex-column flex-md-row text-center text-md-start justify-content-between py-8 px-4 px-xl-8 bg-primary">
      <!-- Copyright -->
      <div class="text-white mb-13 mb-md-10">
        Copyright © 2020. All rights reserved.
      </div>
      <!-- Copyright -->
  
      <!-- Right -->
      <div>
        <a href="#!" class="text-white me-4">
          <i class="fab fa-facebook-f"></i>
        </a>
        <a href="#!" class="text-white me-4">
          <i class="fab fa-twitter"></i>
        </a>
        <a href="#!" class="text-white me-4">
          <i class="fab fa-google"></i>
        </a>
        <a href="#!" class="text-white">
          <i class="fab fa-linkedin-in"></i>
        </a>
      </div>
      <!-- Right -->
    </div>
  </section>
      <script>
          function myFunction() {
              var val=document.getElementById("flag").value;
              if(val==1){
                  alert("Invalid Credentials");
              }
}
      </script>
    
</body>
</html>
