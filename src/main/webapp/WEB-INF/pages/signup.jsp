<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

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
  background-color: #f1f1f1;;
}

* {
  box-sizing: border-box;
}

/* Add padding to containers */
.container {
  padding: 16px;
  background-color: white;
  width:30%;
  margin-top:2%;
  border: 1px solid #888;
  margin-left:33%;
}

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding:8px;
  margin: 2px 0 18px 0;
  display: inline-block;
  border: none;
   border: 1px solid #ccc;
  /* background: #f1f1f1; */
}

/* Full-width input fields */
input[type=email], input[type=password] {
  width: 100%;
  padding:8px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
 /*  background: #f1f1f1; */
  border: 1px solid #ccc;
}

input[type=text]:focus, input[type=password]:focus {
 /*  background-color: #ddd; */
  outline: none;
}

/* Overwrite default styles of hr */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

/* Set a style for the submit button */
.registerbtn {
  background-color: #4CAF50;
  color: white;
  padding: 16px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
  border-radius: 4px;
}

.registerbtn:hover {
  opacity: 1;
}

/* Add a blue text color to links */
a {
  color: dodgerblue;
}

/* Set a grey background color and center the text of the "sign in" section */
.signin {
  background-color: #f1f1f1;
  text-align: center;
}

.placeholder{
color: black;
}
</style>
</head>
<body>

   <form action="${pageContext.request.contextPath}/member/addguestcustomer" method="post" modelAttribute="customer">
   <div class="container">
   <h3 style="color: green;text-align: center;">Sign Up</h3>
   <hr>
      
    <input type="text" placeholder="Enter Name" name="firstName" id="email" required>

    <input type="text" placeholder="EnteMobile Number" name="mobile" id="mobile" required>

    <input type="text" placeholder="Enter city" name="cities" id="psw-repeat" required>
    
    <input type="text" placeholder="Enter Location" name="location" id="psw-repeat" required>
    
    <input type="email" placeholder="Enter Email" name="email" id="email" required>

    <input type="password" placeholder="Enter Password" name="password" id="psw" required>

    <input type="password" placeholder="Repeat Password" name="confirmPassword" id="psw-repeat" required>
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
   
   <button type="submit" class="registerbtn">Register</button>
  <a href="##" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;text-decoration: none;" onclick="document.getElementById('id02').style.display='block'" class="submitId">Already have an account?</a><button type="button" onclick="document.getElementById('id02').style.display='block'" class="submitId"  
  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;text-align: center;">Sign In</button> 
    
    
</div>
</form>

</body>
</html>
