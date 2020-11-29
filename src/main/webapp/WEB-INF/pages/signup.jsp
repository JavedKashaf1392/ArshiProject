<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  


<!DOCTYPE html>
<html>
<head>
<script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
        	 $('#errId').text('New Password And Confirm Password Is Not Match');
            /* alert("Password And Confirm Password Is Not Match."); */
            return false;
        }
        return true;
    }
</script>
<!DOCTYPE HTML>
 <html lang="en" dir="ltr">
        <head> 
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home screen of VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
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
 /*  border: 1px solid #888; */
  margin-left:33%;
  border:1px solid #ddd;
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
select {
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
    <font color='red'style="font-size:16px;text-align: center;"><span id="errId"></span></font>
   <form action="${pageContext.request.contextPath}/addguestcustomer" method="post" modelAttribute="customer">
   <div class="container">
   <h3 style="color: green;text-align: center;">Sign Up</h3>
   <hr>
   
    <spring:bind path="customer.firstName">
    <input type="text" placeholder="Enter FirstName" name="${status.expression}" value="${status.value}"required>
    </spring:bind> 
     
    <spring:bind path="customer.lastName">
    <input type="text" placeholder="Enter LastName" name="${status.expression}" value="${status.value}" required>
    </spring:bind>
    
    <spring:bind path="customer.mobile">
    <input type="text" placeholder="Enter MobileNumber" name="${status.expression}" value="${status.value}" required>
    </spring:bind>
    
       <select id="locationid" name="cities"  required > 
       <option value="" style="margin-left: 2%;">Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select>
   
       <select id="locationid" name="location" required>
       <option value="" style="color: black;">Select location</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
       </c:forEach>
      </select>
       
     <spring:bind path="customer.email">
    <input type="email" placeholder="Enter Email" name="${status.expression}" value="${status.value}" required>
     </spring:bind>
     
  <spring:bind path="customer.password">
  <input type="password" placeholder="Enter Password" name="${status.expression}" value="${status.value}" required  
  id="txtPassword" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="psw">
  </spring:bind>
    
    <spring:bind path="customer.confirmPassword">
    <input type="password" placeholder="Repeat Password" name="${status.expression}" value="${status.value}" required  
    id="txtConfirmPassword" >
    </spring:bind>
    
    <hr>
    <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
   
   <button type="submit" class="registerbtn"  onclick="return Validate()">Register</button>
  <a href="##" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;text-decoration: none;" onclick="document.getElementById('id02').style.display='block'" class="submitId">Already have an account?</a><button type="button" onclick="document.getElementById('id02').style.display='block'" class="submitId"  
  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;text-align: center;">Sign In</button> 
    
</div>
</form>

  <script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
        	 /* $('#errId').text('New Password And Confirm Password Is Not Match');  */
           alert("Password And Confirm Password Is Not Match."); 
            return false;
        }
        return true;
    }
</script>
      
       
</body>
</html>
