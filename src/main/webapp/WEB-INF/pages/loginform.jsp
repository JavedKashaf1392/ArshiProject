<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
font-family: Arial, Helvetica, sans-serif;
 background-color:#f1f1f1;

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
  border: 1px solid #888;
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
<body>



<!-- <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Login</button>
 -->
     <div  class="modal">
     <form class="modal-content animate" action="${pageContext.request.contextPath }/login/doLogin" method="post" modelAttribute="customer">
     <div class="imgcontainer">
   <!--  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span> -->
   <spring:url value="/images" var="images" />
   <img src="${images}/logo.jpg" width="150" height="100"/>
      </div>
     <div class="container">
      <label for="uname"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required>

      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required>
        
      <button type="submit">Login</button>
      <label>
        <input type="checkbox" checked="checked" name="remember"> Remember me
      </label>
    </div>

    <div class="container" style="background-color:#f1f1f1">
      <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
      <span class="psw"><a href="#">Forgot Password?</a></span>
    </div>
  <a href="${pageContext.request.contextPath }/home/signup" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;text-decoration: none;" onclick="document.getElementById('id02').style.display='block'" class="submitId">New to VeggieFridge?Create an account</a><button type="button" onclick="${pageContext.request.contextPath }/home/signup" class="submitId"  
  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;">SignUp</button> 
    
 </form>
</div>

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
