<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>

@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;

* {
	box-sizing: border-box;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	background-color: #fff;
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width:450px;
	max-width: 100%;
}

.header {
	border-bottom: 1px solid #f0f0f0;
	background-color: #f7f7f7;
	padding: 20px 40px;
}

.header h2 {
	margin: 0;
}

.form {
	padding: 30px 40px;	
}

.form-control {
	margin-bottom:2px; 
	padding-bottom: 20px;
	position: relative;
}

.form-control label {
	display: inline-block;
	margin-bottom: 5px;
}

.form-control input,select {
	border: 2px solid #f0f0f0;
	border-radius: 4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 100%;
}

.form-control input:focus {
	outline: 0;
	border-color: #777;
}

.form-control.success input {
	border-color: #2ecc71;
}

.form-control.error input {
	border-color: #e74c3c;
}

.form-control i {
	visibility: hidden;
	position: absolute;
	top:10px;
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

.form button {
	background-color: #4CAF50;
	border: 2px solid #4CAF50;
	border-radius:50px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	margin-top: 20px;
	width: 100%;
}
.form button hover{
opacity: 0.8;
}
 
</style>    
    
 </head>    
 <body>

  <table style="max-width:550px;
  margin: 0 auto;margin-top:10px;margin-bottom:10px;">
     <th><a href="abc.htm"> <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="60" height="60" alt=""/>
					</a></th>
					
					<th><a href="abc.htm">  <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
					</a></th>
  </table>
			
  <div class="container" style="max-width:550px;
  margin: 0 auto; ">
 
	<form id="form" class="form">
        
		<div class="form-control">
			<!-- <label for="username">Username</label> -->
			<input type="text" placeholder="First Name" id="firstname" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		
		<div class="form-control">
			<!-- <label for="username">Username</label> -->
			<input type="text" placeholder="Last Name" id="lastname" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
	
	<div class="form-control">
 <select  id="city">
  <option value="">Select City</option>
  <option value="saab">Nagpur</option>
  <option value="opel">Hyderbad</option>
  <option value="audi">Bhopal</option>
  </select>
  <i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		
  <div class="form-control">
	<select  id="location">
  <option value="">Select Location</option>
  <option value="saab">Mihan</option>
  <option value="opel">Ameerpet</option>
  <option value="audi">Koh-E-Fiza</option>
  </select>
  <i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		    </div>

	        <div class="form-control">
			<!-- <label for="username">Mobile</label> -->
			<input type="text" placeholder="Mobile Number" id="mobile" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		    </div>
		
		<div class="form-control">
			<!-- <label for="username">Email</label> -->
			<input type="email" placeholder="EmailId" id="email" />
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		
		<div class="form-control">
			<!-- <label for="username">Password</label> -->
			<input type="password" placeholder="Password" id="password"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		<div class="form-control">
			<!-- <label for="username">Password check</label> -->
			<input type="password" placeholder="Confirm Password" id="password2"/>
			<i class="fas fa-check-circle"></i>
			<i class="fas fa-exclamation-circle"></i>
			<small>Error message</small>
		</div>
		<button>Submit</button>
	</form>
</div>

<script>
const form = document.getElementById('form');
const firstname = document.getElementById('firstname');
const email = document.getElementById('email');
const password = document.getElementById('password');
const password2 = document.getElementById('password2');
const mobile  = document.getElementById('mobile');
const lastname  = document.getElementById('lastname');
/* const city  = document.getElementById('city');
const location  = document.getElementById('location'); */
 
form.addEventListener('submit', e => {
	e.preventDefault();
	
	checkInputs();
});

function checkInputs() {
	// trim to remove the whitespaces
	const usernameValue = firstname.value.trim();
	const emailValue = email.value.trim();
	const passwordValue = password.value.trim();
	const password2Value = password2.value.trim();
	const mobileValue = mobile.value.trim();
	const lastnameValue = lastname.value.trim();
    /* const cityValue = city.value.trim();
	const locationValue = location.value.trim(); */

	 // Validation for firstName
	if(usernameValue === '') {
		setErrorFor(firstname, 'firstname cannot be blank');
	} 
	else if((usernameValue.length <= 2) || (usernameValue.length > 10)) {
		setErrorFor(firstname, 'firstname lenght must be between 2 and 10');	
	}
	else if(!isNaN(usernameValue)){
		setErrorFor(firstname, 'Only Character are allowed');
		}
	else {
		
		setSuccessFor(firstname);
	}

	// Validation for lastName
	if(lastnameValue === '') {
		setErrorFor(lastname, 'firstname cannot be blank');
	} 
	else if((lastnameValue.length <= 2) || (lastnameValue.length > 10)) {
		setErrorFor(lastname, 'lastname lenght must be between 2 and 10');	
	}
	else if(!isNaN(lastnameValue)){
		setErrorFor(lastname, 'Only Character are allowed');
		}
	else {
		setSuccessFor(lastname);
	}


	//validation for email
	
	if(emailValue === '') {
		setErrorFor(email, 'Email cannot be blank');
	} else if (!isEmail(emailValue)) {
		setErrorFor(email, 'Not a valid email');
	}
	/* else if(emailValue.indexOf('@') <= 0 ){
		setErrorFor(email, '@ Invalid Position');
		} */
	/* else if((emailValue.charAt(emails.length-4)!='.') && (emailValue.charAt(emails.length-3)!='.')){
		setErrorFor(email, '. Invalid Position');
		} */ 
	 else {
		setSuccessFor(email);
	}


	 //validation for mobile Number
	 
	if(mobileValue === '') {
		setErrorFor(mobile, 'Mobile cannot be blank');
	} else if (isNaN(mobileValue)) {
		setErrorFor(mobile, 'user must write digits only not characters');
	}
	else if (mobileValue.length!=10) {
		setErrorFor(mobile, ' Mobile Number must be 10 digits only');
	}
	 /* else if((mobileValue.charAt(0)!=9) && (mobileValue.charAt(0)!=8) && (mobileValue.charAt(0)!=7)){
		setErrorFor(mobile, 'Mobile Number should start with 9 or 8 or 7'); */
		 else {
		setSuccessFor(mobile);
	}


	
	if(passwordValue === '') {
		setErrorFor(password, 'Password cannot be blank');
	}
	else if((passwordValue.length <= 6) || (passwordValue.length > 8)){
		setErrorFor(password, 'Passwords lenght must be between 6 and 8');
		} 
	 else {
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