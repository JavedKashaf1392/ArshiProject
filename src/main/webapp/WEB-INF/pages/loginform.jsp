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
@import url('https://fonts.googleapis.com/css?family=Muli&display=swap');
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
	border: 1px solid red;
	border-radius: 4px;
	/* #31708f */
	background-color:white;  /* #d9edf7 */
	border-color:red;
	margin-left:30px;
	
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

input[type=email]{
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
  border-radius:50px;
}

button:hover {
  opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  border-radius:50px;
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
  left: 50;
  top: 50;
  width:35%; /* Full width */
  height: 70%; /* Full height */
  margin-left:30%;
  margin-top:2%;
  
}

/* Modal Content/Box */
.modal-content {
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
   border:1px solid #ddd;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */


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


.form-control i {
	visibility: hidden;
	position: absolute;
	top: 40px;
	right: 10px;
}

.form-control.success i.fa-check-circle {
	color: #2ecc71;
	visibility: visible;
}

.form-control.error i.fa-exclamation-circle {
	color: #e74c3c;
	visibility: visible;
}

.form-control small {
	color: #e74c3c;
	position: absolute;
	bottom: 0;
	left: 0;
	visibility: hidden;
}

.form-control.error small {
	visibility: visible;
}



</style>
</head>

<body>


        <div  class="modal">
  	
		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>
		
		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
        <font color="red" class="errormsg">
        ${error_msg}
        </font>
        </c:if>
        
   <div class="imgcontainer" style="margin-left:150px;">
  <table>
                      
					 <th><a href="abc.htm"> <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="60" height="60" alt=""/>
					</a></th>
					
					<th><a href="abc.htm">  <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
					</a></th>
				</table>
      </div>
      
      <form class="modal-content animate" action="${pageContext.request.contextPath }/appLogin" method="post" modelAttribute="customer" id="form" class="form">
   
      
      <div class="container">
      <div class="form-control">
      <label for="uname"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" id="email" required>
            <i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
      </div>
        
        <div class="form-control">
      <label for="psw"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" id="password" required>
       <i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
       </div>
        
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
  border: none; margin-top: 2%;margin-left: 2%;border-radius:50px;">SignUp</button> 
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

<script type="text/javascript">
<script>
const form = document.getElementById('form');
const username = document.getElementById('username');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');

form.addEventListener('submit', e => {
e.preventDefault();

checkInputs();
});

function checkInputs() {
// trim to remove the whitespaces
const usernameValue = username.value.trim();
const emailValue = email.value.trim();
const passwordValue = password.value.trim();
const password2Value = password2.value.trim();

if(usernameValue === '') {
	setErrorFor(username, 'Username cannot be blank');
} else {
	setSuccessFor(username);
}

if(emailValue === '') {
	setErrorFor(email, 'Email cannot be blank');
} else if (!isEmail(emailValue)) {
	setErrorFor(email, 'Not a valid email');
} else {
	setSuccessFor(email);
}

if(passwordValue === '') {
	setErrorFor(password, 'Password cannot be blank');
} else {
	setSuccessFor(password);
}

if(password2Value === '') {
	setErrorFor(password2, 'Password2 cannot be blank');
} else if(passwordValue !== password2Value) {
	setErrorFor(password2, 'Passwords does not match');
} else{
	setSuccessFor(password2);
}
}

function setErrorFor(input, message) {
const formControl = input.parentElement;
const small = formControl.querySelector('small');
formControl.className = 'form-control error';
small.innerText = message;
}

function setSuccessFor(input) {
const formControl = input.parentElement;
formControl.className = 'form-control success';
}

function isEmail(email) {
return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}

</script>

</body>
</html>
