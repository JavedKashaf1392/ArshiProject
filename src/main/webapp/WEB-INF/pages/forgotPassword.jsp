<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="images/VeggieFridge.ico" type="image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;

* {
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.errormsg {
	text-align: center;
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid red;
	border-radius: 4px;
	color: red; /* #31708f */
	/* background-color:#4CAF50; */ /* #d9edf7 */
	border-color: red;
	max-width: 450px;;
	margin: 0 auto;
}

.msg {
	text-align: center;
	padding: 15px;
	margin-bottom: 20px;
	border: 1px solid #4CAF50;
	border-radius: 4px;
	color: green; /* #31708f */
	/* background-color:#4CAF50; */ /* #d9edf7 */
	border-color: #4CAF50;
	max-width: 450px;;
	margin: 0 auto;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 10px 0;
	display: inline-block;
	/*  border: 1px solid #ccc; */
	box-sizing: border-box;
	border: 2px solid #f0f0f0;
}

/* Full-width input fields */
input[type=email] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	/* border: 1px solid #ccc; */
	box-sizing: border-box;
	border: 2px solid #f0f0f0;
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
	border-radius: 50px;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #4CAF50;
	border-radius: 50px;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
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
	display: block; /* Hidden by default */
	position: relative; /* Stay in place */
	left: 50;
	top: 50;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	border: 1px solid #ddd;
	width: 80%; /* Could be more or less, depending on screen size */
	border-radius: 5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	padding: 20px 30px;
	max-width: 450px;;
	margin: 0 auto;
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


	<div class="modal">

		<c:if test="${not empty msg}">
			<div class="msg">${msg}</div>
		</c:if>

		<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
			<div class="errormsg">${error_msg}</div>
		</c:if>

		<table
			style="max-width: 450px;; margin: 0 auto; margin-top: 10px; margin-bottom: 10px;">
			<th><a href="abc.htm"> <spring:url value="/images"
						var="images" /> <img src="${images}/vf-leaf.png" width="60"
					height="60" alt="" />
			</a></th>
			<th><a href="abc.htm"> <spring:url value="/images"
						var="images" /> <img src="${images}/logo2.jpg" width="200"
					height="50" alt="" />
			</a></th>
		</table>

		<form class="modal-content animate"
			action="${pageContext.request.contextPath }/forgot/sendMail" method="post"
			modelAttribute="customer" id="myStudentForm">

			<h4 style="margin-left: 5%;">Forgot Password</h4>
			<div class="container">

				<div class="form-control">
					<input type="email" placeholder="Enter Email" name="email"
						id="email"> <span id="emailError"></span>
				</div>


				<button type="submit">Countinue</button>
			</div>

		</form>

		<div style="text-align: center; margin-top: 20px; font-size: 15px;">
			<a href="#" style="text-decoration: none;"> Conditions of Use </a> |
			<a href="#" style="text-decoration: none;"> Privacy Policy </a> | <a
				href="#" style="text-decoration: none;"> Help </a>
			<p style="margin-top:10px;">© 2020-2021, VeggieFridge.com, Inc.
				or its affiliates</p>
		</div>


	</div>

	<!-- ............Script Code.......... -->

	<script>
		$(document).ready(function() {

			$("#emailError").hide();
			

			var emailError = false;
			

			$("#email").keyup(function() {
				validate_email();
			});

			

			//Email Validation
			function validate_email() {
				var val = $("#email").val();
				var exp = /^[A-Za-z0-9\.\-]+\@[a-z]+\.[a-z\.]{2,10}$/;
				if (val == '') {
					$("#emailError").html("Enter <b>EMail ID</b>");
					$("#emailError").css("color", "red");
					$("#emailError").show();
					emailError = false;
				} else {
					$("#emailError").hide();
					emailError = true;
				}
				return emailError;
			}

			
			//---------ON SUBMIT--------------//
			$("#myStudentForm").submit(function() {

				validate_email();
				

				if (emailError)
					return true;
				else
					return false;
			});

		});
	</script>

</body>
</html>

<!-- https://www.w3schools.com/howto/tryit.asp?filename=tryhow_js_scroll_to_top
 -->
 
<!--  https://www.google.com/search?q=message+for+website+vegetable+products&tbm=isch&source=iu&ictx=1&fir=DECBFrjTFuEiZM%252Chv2nrAk51bv80M%252C_&vet=1&usg=AI4_-kR6QyluO-Sk66mlgM6nzpVtT7Xe9Q&sa=X&ved=2ahUKEwjJr5LjhrDvAhXtH7cAHRoFAOAQ9QF6BAgGEAE#imgrc=Vv01KpkpMXLKjM&imgdii=9u6KTkpIMukFAM 

https://www.google.com/search?q=message+for+website+vegetable+products&tbm=isch&source=iu&ictx=1&fir=DECBFrjTFuEiZM%252Chv2nrAk51bv80M%252C_&vet=1&usg=AI4_-kR6QyluO-Sk66mlgM6nzpVtT7Xe9Q&sa=X&ved=2ahUKEwjJr5LjhrDvAhXtH7cAHRoFAOAQ9QF6BAgGEAE#imgrc=OAqgcoIhiXuSIM
-->

