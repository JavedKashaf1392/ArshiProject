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
	<h4 style="margin-left:8%; margin-top: 20px;">Create Account</h4>

		<form id="myStudentForm" class="form" action="${pageContext.request.contextPath }/addguestcustomers" modelAttribute="customer" method="post">

			<!-- ......First Name.....  -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="firstName" name="firstName"
					id="firstName" /> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="firstNameError"></span>
				<!-- <small>Error message</small> -->
			</div>

			<!-- ............last Name..............	 -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="lastName" name="lastName"
					id="lastName" /> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="lastNameError"></span>
				<!-- <small>Error message</small> -->
			</div>

			<!-- ......	Mobile......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="mobile" name="mobile" id="mobile" />
				<i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="mobileError"></span>
				<!-- <small>Error message</small> -->
			</div>

			<!-- ......	Email Id......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="email" name="email" id="email" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="emailError"></span>
				<!-- <small>Error message</small> -->
			</div>


			<!-- ..........City........... -->

			<div class="form-control">
				<select id="city" name="cities">
					<option value="">Select City</option>
					<option value="Nagpur">Nagpur</option>
					<option value="Hyderbad">Hyderbad</option>
					<option value="Bhopal">Bhopal</option>
				</select> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i>
				<!-- <small>Error message</small> -->
				<span id="cityError"></span>
			</div>

			<!-- ..........Location........... -->

			<div class="form-control">
				<select id="location" name="location">
					<option value="">Select KioskLocation</option>
					<option value="Mihan">Mihan</option>
					<option value="Ameerpet">Ameerpet</option>
					<option value="Koh-e-Fiza">Koh-e-Fiza</option>
				</select> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i>
				<!-- <small>Error message</small> -->
				<span id="locationError"></span>
			</div>

			<!-- ......	Password......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="Password" id="txtNewPassword"
					name="password" /> <i class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span id="passwordError"></span>
				<!-- <small>Error message</small> -->
			</div>



			<!-- ......	Confirm Password......... -->

			<div class="form-control">
				<!-- <label for="username">Username</label> -->
				<input type="text" placeholder="Confirm Password"
					name="confirmPassword" id="txtConfirmPassword" /> <i
					class="fas fa-check-circle"></i> <i
					class="fas fa-exclamation-circle"></i> <span
					id="txtConfirmPasswordError"></span>
				<!-- <small>Error message</small> -->
			</div>


			<button>Submit</button>
		</form>
		
<div style="text-align: center;margin-bottom:20px;">
<span>
Already have an account?<a
href="${pageContext.request.contextPath }/login"
style="text-decoration: none;"> Log In</a></span>
</div>
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
							$("#firstNameError").hide();
							$("#lastNameError").hide();
							$("#mobileError").hide();
							$("#emailError").hide();
							$("#cityError").hide();
							$("#locationError").hide();
							$("#passwordError").hide();
							$("#txtConfirmPasswordError").hide();

							var firstNameError = false;
							var lastNameError = false;
							var mobileError = false;
							var emailError = false;
							var cityError = false;
							var locationError = false;
							var passwordError = false;
							var txtConfirmPasswordError = false;

							$("#firstName").keyup(
									function() {
										//convert lower to upper case
										$("#firstName").val(
												$("#firstName").val()
														.toUpperCase());
										validate_firstName();
									});

							$("#lastName").keyup(
									function() {
										//convert lower to upper case
										$("#lastName").val(
												$("#lastName").val()
														.toUpperCase());
										validate_lastName();
									});

							$("#mobile").keyup(function() {
								validate_mobile();
							});

							$("#email").keyup(function() {
								validate_email();
							});

							$("#city").change(function() {
								validate_city();
							});

							$("#location").change(function() {
								validate_location();
							});

							$("#txtNewPassword").change(function() {
								validate_txtNewPassword();
							});

							$("#txtConfirmPassword").change(function() {
								validate_txtConfirmPassword();
							});

							//FirstName validation
							function validate_firstName() {
								var val = $("#firstName").val();
								//only upper/lower case chars atleast 3 char and at max 8 chars
								var exp = /^[A-Z]{3,8}$/;

								if (val == '') {
									$("#firstNameError").html(
											"Enter <b>First Name</b>");
									$("#firstNameError").css("color", "red");
									$("#firstNameError").show();
									firstNameError = false;
								} else if (!exp.test(val)) {
									$("#firstNameError").html(
											"Enter <b>Valid First Name</b>");
									$("#firstNameError").css("color", "red");
									$("#firstNameError").show();
									firstNameError = false;
								} else {
									$("#firstNameError").hide();
									firstNameError = true;
								}
								return firstNameError;
							}

							//lastName validation
							function validate_lastName() {
								var val = $("#lastName").val();
								//only upper/lower case chars atleast 3 char and at max 8 chars
								var exp = /^[A-Z]{3,8}$/;

								if (val == '') {
									$("#lastNameError").html(
											"Enter <b>last Name</b>");
									$("#lastNameError").css("color", "red");
									$("#lastNameError").show();
									lastNameError = false;
								} else if (!exp.test(val)) {
									$("#lastNameError").html(
											"Enter <b>Valid Name</b>");
									$("#lastNameError").css("color", "red");
									$("#lastNameError").show();
									lastNameError = false;
								} else {
									$("#lastNameError").hide();
									lastNameError = true;
								}
								return lastNameError;
							}

							//mobile validation
							function validate_mobile() {
								var val = $("#mobile").val();
								//only digits starts with 1-9 later any digit is OK
								var exp = /^[1-9][0-9]*$/;
								if (val == '') {
									$("#mobileError").html(
											"Enter <b>Mobile Number</b>");
									$("#mobileError").css("color", "red");
									$("#mobileError").show();
									mobileError = false;
								} else if (val.length != 10) {
									$("#mobileError")
											.html(
													" Mobile Number must be 10 digits only");
									$("#mobileError").css("color", "red");
									$("#mobileError").show();
									mobileError = false;
								} else if (!exp.test(val)) {
									//value not matched with expression
									$("#mobileError").html(
											"Enter <b>Valid Mobile Number</b>");
									$("#mobileError").css("color", "red");
									$("#mobileError").show();
									mobileError = false;
								} else {
									$("#mobileError").hide();
									mobileError = true;
								}
								return mobileError;
							}

							//Email Validation
							function validate_email() {
								var val = $("#email").val();
								var exp = /^[A-Za-z0-9\.\-]+\@[a-z]+\.[a-z\.]{2,10}$/;
								if (val == '') {
									$("#emailError").html(
											"Enter <b>EMail ID</b>");
									$("#emailError").css("color", "red");
									$("#emailError").show();
									emailError = false;
								} else if (!exp.test(val)) {
									$("#emailError").html(
											"Enter <b>Valid Mail</b>");
									$("#emailError").css("color", "red");
									$("#emailError").show();
									emailError = false;
								} else {
									$("#emailError").hide();
									emailError = true;
								}
								return emailError;
							}

							//----------city-----------//

							function validate_city() {
								var val = $("#city").val();
								if (val == '') {
									$("#cityError").html("Select <b>City</b>");
									$("#cityError").css("color", "red");
									$("#cityError").show();
									cityError = false;
								} else {
									$("#cityError").hide();
									cityError = true;
								}
							}

							//----------location-----------//

							function validate_location() {
								var val = $("#location").val();
								if (val == '') {
									$("#locationError").html(
											"Select <b>Location</b>");
									$("#locationError").css("color", "red");
									$("#locationError").show();
									locationError = false;
								} else {
									$("#locationError").hide();
									locationError = true;
								}
							}

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
										validate_firstName();
										validate_lastName();
										validate_mobile();
										validate_email();
										validate_city();
										validate_location();
										validate_txtNewPassword();
										validate_txtConfirmPassword();

										if (firstNameError && lastNameError
												&& mobileError && emailError
												&& cityError && passwordError
												&& txtConfirmPasswordError)
											return true;
										else
											return false;
									});

						});
	</script>
</body>

</html>