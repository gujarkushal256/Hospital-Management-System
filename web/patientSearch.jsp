<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<title>Dashboard</title>
<meta charset="utf-8">
		  <meta name="viewport" content="width=device-width, initial-scale=1">
		  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
		  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
		  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
		  
<style>
<!-- sidenavbar -->
body {
  font-family: "Calibri", sans-serif;
}
.sidenav {
  height: 100%;
  width: 250px;
  position: fixed;
  z-index: 1;
  top: 0;
  left: 0;
  background-color: #F5F5F5;
  overflow-x: hidden;
  padding-top: 20px;
}
.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  font-size: 20px;
  color: #0000ff;
  display: block;
}
.sidenav a:hover {
  color: #000000;
  text-decoration: none;
}
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}
</style>
    <script>
function includeHTML() {
  var z, i, elmnt, file, xhttp;
  /*loop through a collection of all HTML elements:*/
  z = document.getElementsByTagName("*");
  for (i = 0; i < z.length; i++) {
    elmnt = z[i];
    /*search for elements with a certain atrribute:*/
    file = elmnt.getAttribute("w3-include-html");
    if (file) {
      /*make an HTTP request using the attribute value as the file name:*/
      xhttp = new XMLHttpRequest();
      xhttp.onreadystatechange = function() {
        if (this.readyState == 4) {
          if (this.status == 200) {elmnt.innerHTML = this.responseText;}
          if (this.status == 404) {elmnt.innerHTML = "Page not found.";}
          /*remove the attribute, and call this function once more:*/
          elmnt.removeAttribute("w3-include-html");
          includeHTML();
        }
      }      
      xhttp.open("GET", file, true);
      xhttp.send();
      /*exit the function:*/
      return;
    }
  }
};
</script>
</head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<body>
	
	
	<!--<div w3-include-html="navbar_1.html"> de</div>-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">MEDICAL</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav">
      <li class="nav-item active">
          <a class="nav-link" href=<% out.println("viewAppointment.jsp?name="+request.getParameter("name"));%> >Manage Appointment</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("patientSearch.jsp?name="+request.getParameter("name"));%>>Search Patient</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href=<% out.println("addTreatment.jsp?name="+request.getParameter("name"));%>>Add Treatment</a>
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
	<div class="container">
	<div class="row">
	    
	    
	    <div class="col-sm-12">
	      <!-- display window -->
			<div class="main"><br/><br/>
			<h1>Search Existing Patient</h1></br>
			 		
			
			<div class="card bg-light border-primary mb-3" >
			  <div class="card-header"><h4>By Name</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="SearchPatient" method="GET" >
						 <div class="form-group">
						 	<label>First Name</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="firstName" placeholder="first name"
						 	required="required" autocomplete="off" maxlength="20">
						 </div>
						 <div class="form-group">
						 	<label>Last Name</label>
						 	<input type="text" class="form-control" id="exampleInputEmail1" name="lastName" placeholder="last name"
						 	required="required" autocomplete="off" maxlength="20">
						 </div>
						 <div style="text-align: center;">
				    	<button type="submit" class="btn btn-primary">Search</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>
				
			<div class="card bg-light border-danger mb-3" >
			  <div class="card-header"><h4>By Id</h4></div>
			  <div class="card-body">
			    <p class="card-text">
			    	<form action="SearchPatient" method="GET" >
						 <div class="form-group">
						 	<label>Id</label>
						 	<input type="text" class="form-control" id="id" name="id" placeholder="xxxx"
						 	required="required" autocomplete="off" maxlength="10">
						 </div>
				    	<div style="text-align: center;">
                                            <button type="submit" class="btn btn-primary" onclick="Validate()">Search</button>
				    	</div>
				    </form>
			    </p>
			  </div>
			</div>
			
				
			
		</div>
		</div>
		
	</div>
	</div>
	   <script>
includeHTML();
                        function Validate(){
                                var x=document.getElementById("id").value;
                                if(x<2000 || x>=3000){
                                    alert("Invalid ID!!");
                                }
                        }

</script>
</body>

</html> 
