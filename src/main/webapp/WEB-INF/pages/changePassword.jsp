<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
<head>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
</head>

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
	background-color:#fff;
	border-radius:5px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
	overflow: hidden;
	width: 450px;
	max-width: 100%;
}

.form {
	padding: 30px 30px;
}

.form-control {
	margin-bottom: 2px;
	padding-bottom: 20px;
	position: relative;
}
.form-control input, select {
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
	top: 10px;
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
	border-radius: 50px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	width: 100%;
}

.form button hover {
	opacity: 0.8;
}
</style>

<body>

<table
		style="max-width: 550px; margin: 0 auto; margin-top: 10px; margin-bottom: 10px;">
		<th><a href="abc.htm"> <spring:url value="/images"
					var="images" /> <img src="${images}/vf-leaf.png" width="60"
				height="60" alt="" />
		</a></th>

		<th><a href="abc.htm"> <spring:url value="/images"
					var="images" /> <img src="${images}/logo2.jpg" width="200"
				height="50" alt="" />
		</a></th>
</table>

	<div class="container" style="max-width: 550px; margin: 0 auto;">
	<h4 style="margin-left:8%; margin-top: 20px;">Forgot Password</h4>

		<%-- <form id="myStudentForm" class="form" action="${pageContext.request.contextPath }/addguestcustomers" modelAttribute="customer" method="post"> --%>
        <form:form action="${pageContext.request.contextPath}/forgot/passwordChanged" modelAttribute="customer" method="POST" id="myStudentForm" class="form" >    
			<!-- ......	Email Id......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<form:input path="email" readonly="true" placeholder="email" id="email"></form:input> 
				<!-- <input type="email" placeholder="email" name="email" id="email" readonly="true"/> --> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="emailError"></span>
				<!-- <small>Error message</small> -->
			</div>



			<!-- ......	Password......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<form:password path="newPassword" id="txtPassword" placeholder="Password" ></form:password>
				<!-- <input type="text" placeholder="Password" id="txtNewPassword"
					name="password" /> --> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i><span id="passwordError"></span>
				<!-- <small>Error message</small> -->
			</div>



			<!-- ......	Confirm Password......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<!-- <input type="text" placeholder="Confirm Password"
					name="confirmPassword" id="txtConfirmPassword" />  -->
					<form:password path="confirmPassword" id="txtConfirmPassword"  placeholder="Confirm Password"/>
					<i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span
					id="txtConfirmPasswordError"></span>
				<!-- <small>Error message</small> -->
			</div>


		<button>Change Password</button>
		<%-- </form> --%>
		</form:form>
		

</div>

<div style="text-align: center; margin-top: 20px; font-size: 15px;">
			<a href="#" style="text-decoration: none;"> Conditions of Use </a> |
			<a href="#" style="text-decoration: none;"> Privacy Policy </a> | <a
				href="#" style="text-decoration: none;"> Help </a>
			<p style="margin-top:10px;">© 2020-2021, VeggieFridge.com, Inc.
				or its affiliates</p>
		</div>
	
	

	<!-- ............Script Code.......... -->

	<script>
		$(document)
				.ready(
						function() {
							
							$("#passwordError").hide();
							$("#txtConfirmPasswordError").hide();

							
							var passwordError = false;
							var txtConfirmPasswordError = false;

							
							$("#txtNewPassword").change(function() {
								validate_txtNewPassword();
							});

							$("#txtConfirmPassword").change(function() {
								validate_txtConfirmPassword();
							});

					
							/* ...............Passowrd........... */

							//password Validation
							function validate_txtNewPassword() {
								var val = $("#txtNewPassword").val();
								//var exp = /^[A-Za-z0-9\.\-]+\@[a-z]+\.[a-z\.]{2,10}$/;
								if (val == '') {
									$("#passwordError").html(
											"Enter <b>Password</b>");
									$("#passwordError").css("color", "red");
									$("#passwordError").show();
									passwordError = false;
								} else if ((val.length <= 6)
										|| (val.length > 8)) {
									$("#passwordError")
											.html(
													"Enter <b>Passwords lenght must be between 6 and 8</b>");
									$("#passwordError").css("color", "red");
									$("#passwordError").show();
									passwordError = false;
								}
								//else if(!exp.test(val)){
								//$("#passwordError").html("Enter <b>Valid Password</b>");
								//$("#passwordError").css("color","red");
								//$("#passwordError").show();
								//passwordError = false;
								//} 
								else {
									$("#passwordError").hide();
									passwordError = true;
								}
								return passwordError;
							}

							/* ...............ConfirmPassowrd........... */

							//password Validation
							function validate_txtConfirmPassword() {
								var val = $("#txtConfirmPassword").val();
								var value = $("#txtNewPassword").val();
								//var exp = /^[A-Za-z0-9\.\-]+\@[a-z]+\.[a-z\.]{2,10}$/;
								if (val == '') {
									$("#txtConfirmPasswordError").html(
											"Enter <b>Confirm Password</b>");
									$("#txtConfirmPasswordError").css("color",
											"red");
									$("#txtConfirmPasswordError").show();
									txtConfirmPasswordError = false;
								} else if (value !== val) {
									$("#txtConfirmPasswordError")
											.html(
													"Enter <b>Passwords Does Not Match</b>");
									$("#txtConfirmPasswordError").css("color",
											"red");
									$("#txtConfirmPasswordError").show();
									txtConfirmPasswordError = false;
								}
								//else if(!exp.test(val)){
								//$("#passwordError").html("Enter <b>Valid Password</b>");
								//$("#passwordError").css("color","red");
								//$("#passwordError").show();
								//passwordError = false;
								//} 
								else {
									$("#txtConfirmPasswordError").hide();
									txtConfirmPasswordError = true;
								}
								return txtConfirmPasswordError;
							}

							//---------ON SUBMIT--------------//
							$("#myStudentForm").submit(
									function() {
										
										
										validate_txtNewPassword();
										validate_txtConfirmPassword();

										if (passwordError
												&& txtConfirmPasswordError)
											return true;
										else
											return false;
									});

						});
	</script>
</body>

</html>