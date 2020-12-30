<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    


<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg"> 
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
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

 .social{
    margin: 20px 0 0 0;
}
 .social a{
    padding: 0 2px;
}
 .social a span{
    height: 35px;
    width: 35px;
    color:white;
    line-height: 40px;
    text-align: center;
    font-size: 16px;
    border-radius: 50px;
    transition: 0.3s;
}
/* ...Left Content.... */
 .social a span:hover{
    background: #f12020;
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
         
    <h6 style="color:#4CAF50;font-size:90%; margin-top:2%; text-align:center;"> Eat Healthy,Drink Healthy </h6>
    <h5>We have received your request for reset password. Follow this link to reset your customer account password at VeggieFridge</h5>     
         
    <div class="container" style="text-align: center;">    
   <!-- <a href='http://localhost:8080/vf-online/forgot/newPassword/"+ 
		  		email+"/'>Click here</a> to reset password</body></html>-->
         
         <a href='http://localhost:8080/vf-online/forgot/newPassword/"+ 
		  		email+"/' style="display: inline-block;
        padding: 10px 40px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:12px;">Click here to Reset Your Password</a>
        
    </div>
    <h5 style="color: cornflowerblue;">If this request is not done by you so please ignore the message.</h5>

    <div class="container" style="background-color:#f1f1f1">
    
    <table>
    <h6 style="color: black;">Download the VeggieFridge App</h6>
     <th> 
    <a href="abc.htm">                      
    <spring:url value="/images" var="images" />
    <img src="${images}/Apple-App-store-icon.png" width="100" height="40" style="float: right; margin-right:7%"/>
    </a> 
    </th>
    <th>
    <a href="abc.htm">                        
    <spring:url value="/images" var="images" />
    <img src="${images}/Google-App-store-icon.png" width="100" height="40" style="float: right;"/>
    </a>      
    </th>
    </table>  
    </div>
                            <div class="social" style="align-content: center;margin-left:22%;"> 
                            <a href="https://facebook.com/coding.np"><span class="fab fa-facebook-f" style="background-color:#3B5998;color:white;"></span></a>
                            <a href="#"><span class="fab fa-twitter" style="background-color: #55ACEE;color:white;"></span></a>
                            <a href="https://instagram.com/coding.np" ><span class="fab fa-instagram" style="background-color: #125688;color:white;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-linkedin"  style="background-color:  #007bb5;color:white;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-pinterest"  style="background-color: #bb0000;color:white;"></span></a>
                            <p style="margin-left:4%">support@veggiefridge.com</p><p style="margin-left:20%">9823576042</p>
                            </div>
  
<h6 style="color:red;">This is a system generated email, please do not reply</h6>    
 
    
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
