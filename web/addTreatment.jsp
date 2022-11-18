<%-- 
    Document   : addTreatment
    Created on : 9 Nov, 2022, 5:39:31 PM
    Author     : gujar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
            <style>
        
body{
    font-family: 'Roboto', sans-serif;
  }
  /*--------------------------------------------------------------
  # Navigation Menu
  --------------------------------------------------------------*/
  .nav-back{
      background: rgba(17, 219, 207,0.8);
      color: #fff;
  }
  .navbar-brand{
    color: #000;
  }
  .navbar-brand:hover{
    color: #fff;
  }
  .nav-link{
    color: #000;
  }
  .nav-link:hover{
    color:#fff;
  }
  .navbar-toggler{
    outline: none!important;
  }
  
     
   
  /*--------------------------------------------------------------
  # Hero Section
  --------------------------------------------------------------*/
  #hero {
      width: 100%;
      height: 80vh;
      background: url("./images/hero.jpg") center center;
      background-size: cover;
      position: relative;
    }
    
    #hero .container {
      padding-top: 80px;
    }
    
    #hero:before {
      content: "";
      background: rgba(0, 0, 0, 0.6);
      position: absolute;
      bottom: 0;
      top: 0;
      left: 0;
      right: 0;
    }
    
    #hero h1 {
      margin: 0 0 10px 0;
      font-size: 48px;
      font-weight: 700;
      line-height: 56px;
      color: #fff;
    }
    
    #hero h2 {
      color: #eee;
      margin-bottom: 40px;
      font-size: 15px;
      font-weight: 500;
      font-family: "Open Sans", sans-serif;
      letter-spacing: 0.5px;
      text-transform: uppercase;
    }
    
    .main-btn {
      font-family: "Poppins", sans-serif;
      text-transform: uppercase;
      font-weight: 500;
      font-size: 14px;
      letter-spacing: 1px;
      display: inline-block;
      padding: 8px 28px;
      border-radius: 50px;
      transition: 0.5s;
      margin: 10px;
      border: 2px solid #fff;
      color: #fff;
    }
    
     .main-btn:hover {
      background: #11dbcf;
      border: 2px solid #11dbcf;
      text-decoration: none;
      color:#fff;
    }
   .form-group .btn-form{
    background: #11dbcf;
    border: 2px solid #11dbcf;
    text-decoration: none;
    color:#000;
   }
   
   
   
   
   
   
   
   
   
   
   
   
    .footer {
        text-align: center;
        font-size: 0.9rem;
        background:rgba(17, 219, 207,0.8);
      }
      .footer .btn-back{
        background: #fff;
        color: #00d9ff;
      }
      .footer .text{
        color: #000;
      }
      .register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister{
    float: right;
    margin-top: 10%;
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 50%;
    cursor: pointer;
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}
.register-heading{
    text-align: center;
    margin-top: 8%;
    margin-bottom: -15%;
    color: #495057;
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
      <%
          String name=request.getParameter("name");
          String flag=request.getParameter("flag");
                                            if(flag!=null){
                                                String[] arr=flag.split(" ",2);
                                                out.println("<input type='text' id='flag' value="+arr[0]+" hidden=true />");
                                                if(name==null){
                                                    name=arr[1];
                                                }
                                                
                                            }
                                            if(name=="null"){
                                                name=request.getParameter("name");
                                            }
      %>
    <ul class="navbar-nav">
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
<div class="container register">
                <div class="row">
                    
                    <div class="col-md-9 register-right">
                        
                        <div class="tab-content" id="myTabContent">
                            <form action="treatment" method="GET">
                            <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                                <h3 class="register-heading">ADD TREATMENT</h3>
                                <div class="row register-form">
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="aid" placeholder="Enter AID *"/>
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="did" placeholder="ENTER DOCTOR ID *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="pid" placeholder="Enter PID *"/>
                                        </div>
                                        <div class="form-group">
                                            <textarea name="symptoms" class="form-control" placeholder="Enter Symptoms" required></textarea>
                                        </div>
                                        <div class="form-group">
                                            <textarea name="treat" class="form-control" placeholder="Enter Treatment/ Prescribtion" required></textarea>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="form-group">
                                            <input type="date" class="form-control" placeholder="DATE *" value="" name="date" />
                                        </div>
                                        <div class="form-group">
                                            <input type="time"  name="time" class="form-control" placeholder="TIME *" value="" />
                                        </div>
                                        <div class="form-group">
                                            <textarea name="note" class="form-control" placeholder="Enter Note" required></textarea>
                                        </div>
                                 
                                        <input type="submit" class="btnRegister"  value="ADD"/>
                                    </div>
                                </div>
                            </div>
                        </form>
                                        <%
                                                                                        
                                        %>
                        </div>
                    </div>
                    
                </div>
                        
            </div>
                        <script>
                            function Success(){
                                var val=document.getElementById("flag").value;
                                alert("Treatement Added!!");
                            
                            }
                        </script>
  </body>
</html>