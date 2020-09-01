<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 
 <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
 body{
background-color:#f1f1f1;
}


* {
  box-sizing: border-box;
}


.splash{
   text-align: center;
   margin-left:32%;
   margin-top:5%;
   font-family: 'Montserrat', sans-serif;
   background-color: #fff;
   border-radius: 10px;
  /*  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
	0 10px 10px rgba(0,0,0,0.22); */
	position: relative;
	overflow: hidden;
	width: 450px;
    max-width: 100%;
	min-height: 100px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
.col-75 {
   width: 100%;
  margin-top: 11px;
  color: black;
}
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 14px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top: 10px;
}

input[type=submit]:hover {
  background-color: #45a049;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}
</style>

</head>
<body>
<div class="splash">
  <div class="row">
  <div class="col-75"> 
    
 <form method="post" action="${pageContext.request.contextPath}/login/loginForm" modelAttribute="customer">
  <spring:url value="/images" var="images" />
  <img src="${images}/logo.jpg" width="130" height="100"/>
 <h2 style="color:#4CAF50;">Create new password</h2>
 <h5 style="color:#4CAF50;">We will ask for this password whenever you sign in</h5>    
   
  <label style="margin-right:55%;">New Password</label>
  <input type="password" name="${status.expression}" value="${status.value}" placeholder="Enter Password"  required style="width: 77%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;"><br>
  
  <label style="margin-right:55%;">Confirm Password</label>
  <input type="password" name="${status.expression}" value="${status.value}" placeholder="Confirm Password"  required style="width: 77%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;">
  
  <input type="submit" value="Save changes and sign in"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;"/>
      </div>
      </div>

    <!--  <div style="text-align:center;">
    <input type="submit" value="Continue"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;"/>
    </div> --></form>
<h3 style="color:#4CAF50;margin-right:33%;">Secure Password Tips:</h3>
<h5>1.Use at least 8 characters, a combination of numbers and letters is best.<h5>
<h5>2.Do not use the same password you have used with us previously.<h5>
<h5>3.Do not use the same password for multiple online accounts.<h5>
</div>
</body>
</html>