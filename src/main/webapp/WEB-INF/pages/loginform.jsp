<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap');

*{
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.errormsg{
    text-align:center;
	padding: 15px;
	margin-bottom: 20px;
	margin-top: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: white;/* #31708f */
	background-color:#4CAF50;  /* #d9edf7 */
	border-color: #bce8f1;
}

.msg {
    text-align:center;
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid transparent;
	border-radius: 4px;
	color: white;/* #31708f */
	background-color:#4CAF50;  /* #d9edf7 */
	border-color: #bce8f1;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Full-width input fields */
input[type=email], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* Set a style for all buttons */
button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  border-radius:4px;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  border-radius:4px;
}

/* Center the image and position the close button */
.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* The Modal (background) */
.modal {
  display:block; /* Hidden by default */
  position: relative; /* Stay in place */
 /*  z-index: 1; */ /* Sit on top */
  left: 50;
  top: 50;
  width:35%; /* Full width */
  height: 70%; /* Full height */
/*   overflow: auto;  *//* Enable scroll if needed */
 /*  background-color: rgb(0,0,0); /* Fallback color */
 /*  background-color: rgba(0,0,0,0.4); */ /* Black w/ opacity */ */
  margin-top: 50%;
  margin-left:30%;
  
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
 /*  border: 1px solid #888; */
   border:1px solid #ddd;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}

/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}

</style>
</head>
<body onload='document.loginForm.username.focus();'>

<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
 -->
        <div  class="modal">
        <c:if test="${not empty error}">
			<div class="error">${error}</div>
		</c:if>
		
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
        <font color="red" class="errormsg">
        Your login attempt was not successful due to Bad Credential <%-- <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/> --%>
        </font>
        </c:if>
      <div class="imgcontainer">
   <!--  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span> -->
   <spring:url value="/images" var="images" />
		<img src="${images}/logo.jpg" width="160" height="110"/>
      </div>
    <form class="modal-content animate" action="${pageContext.request.contextPath }/appLogin" method="post" modelAttribute="customer">
   
  
      
      <div class="container">
      <label for="uname"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
        
      <button type="submit">Login</button>
	  <input type="hidden" name="${_csrf.parameterName}"
				value="${_csrf.token}" />
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button"  class="cancelbtn" onclick="history.back()">Cancel</button>
      <span class="psw"><a href="${pageContext.request.contextPath }/login/forgotPassword">Forgot Password?</a></span>
    </div>
  
  <a href="${pageContext.request.contextPath }/signup" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;text-decoration: none;margin-left:2%" onclick="document.getElementById('id02').style.display='block'" class="submitId">New to VeggieFridge? Create an account</a>
  <button type="button" onclick="${pageContext.request.contextPath }/signup" class="submitId"  
  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;">SignUp</button> 
 </form>
 
</div>
<p style="font-size:12px; text-align: center;
  position: relative;margin-right:100px;">© 2020-2021, VeggeiFridge.com, Inc. or its affiliates</p>

<script>
// Get the modal
var modal = document.getElementById('id01');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}
</script>

</body>
</html>
