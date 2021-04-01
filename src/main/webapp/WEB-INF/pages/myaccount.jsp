<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VeggieFridge</title>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
	integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	charset="utf-8"></script>

<style>

@import
url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap');

*{
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.side-bar {
	width: 290px;
	height:100vh;
	/*position:absolute;*/
	top:0;
	transition: 0.6s ease;
	transition-property: left;
	background-color: white;
	left: 0;
	margin-top:30px;
	margin-left:40px;
	margin-bottom:30px;
}

/*.side-bar.active{
  left: 0;
}*/
.side-bar .menuprofile {
	width: 100%;
	background-color: white;
	padding: 10px 10px;
	
}

.side-bar .menu {
	width: 100%;
	margin-top: 20px;
}

.side-bar .menu .item {
	position: relative;
	cursor: pointer;
}

.side-bar .menu .item a {
	/* color: #fff;*/
	font-size: 16px;
	text-decoration: none;
	display: block;
	padding: 5px 30px;
	line-height: 60px;
	color: black;
}

.side-bar .menu .item a:hover {
	/*background: #8621F8;*/
	transition: 0.3s ease;
	background: gray;
}

.side-bar .menu .item i {
	margin-right: 15px;
}

.side-bar .menu .item i {
	color: #4CAF50;
}

.side-bar .menu .item a .dropdown {
	position: absolute;
	right: 0;
	margin: 20px;
	transition: 0.3s ease;
}

.side-bar .menu .item .sub-menu {
	/* background: rgba(255, 255, 255, 0.1);*/
	display: none;
	background-color: gainsboro;
}

.side-bar .menu .item .sub-menu a {
	padding-left: 80px;
}

.rotate {
	transform: rotate(90deg);
}

.close-btn {
	position: absolute;
	font-size: 20px;
	right: 0;
	margin: 25px;
	cursor: pointer;
	color: black;
}

.menu-btn {
	position: absolute;
	font-size: 20px;
	margin: 25px;
	cursor: pointer;
	color: black;
}

.main {
	height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 50px;
}

.main h1 {
	color: rgba(255, 255, 255, 0.8);
	font-size: 60px;
	text-align: center;
	line-height: 80px;
}

@media ( max-width : 900px) {
	.main h1 {
		font-size: 40px;
		line-height: 60px;
	}
}

.wrapper {
	max-width: 1000px;
	width: 100%;
	/* background: #fff; */
	margin: 20px auto;
	/*  box-shadow: 1px 1px 2px rgba(0,0,0,0.125); */
	padding: 30px;
	background-color: white;
	height:727px;
}

.wrapper .title {
	font-size: 20px;
	font-weight: 700;
	margin-bottom: 25px;
	color: green;
	text-transform: uppercase;
	text-align: center;
}

.wrapper .form {
	width: 62%;
}

.wrapper .form .inputfield {
	margin-bottom: 15px;
	display: flex;
	align-items: center;
}

.wrapper .form .inputfield label {
	width: 200px;
	color: #757575;
	margin-right: 10px;
	font-size: 14px;
}

.wrapper .form .inputfield .input, .wrapper .form .inputfield .textarea
	{
	width: 100%;
	outline: none;
	border: 1px solid #d5dbd9;
	font-size: 15px;
	padding: 8px 10px;
	border-radius: 3px;
	transition: all 0.3s ease;
	/* background-color: #f5f5f5; */
}

.wrapper .form .inputfield .textarea {
	width: 100%;
	height: 125px;
	resize: none;
}

.wrapper .form .inputfield .custom_select {
	position: relative;
	width: 100%;
	height: 37px;
	background-color: #f5f5f5;
}

.wrapper .form .inputfield .custom_select:before {
	content: "";
	position: absolute;
	top: 12px;
	right: 10px;
	border: 8px solid;
	border-color: #d5dbd9 transparent transparent transparent;
	pointer-events: none;
}

.wrapper .form .inputfield .custom_select select {
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
	outline: none;
	width: 100%;
	height: 100%;
	border: 0px;
	padding: 8px 10px;
	font-size: 15px;
	border: 1px solid #d5dbd9;
	border-radius: 3px;
}

.wrapper .form .inputfield .input:focus, .wrapper .form .inputfield .textarea:focus,
	.wrapper .form .inputfield .custom_select select:focus {
	border: 1px solid #fec107;
}

.wrapper .form .inputfield p {
	font-size: 14px;
	color: #757575;
}

.wrapper .form .inputfield .check {
	width: 15px;
	height: 15px;
	position: relative;
	display: block;
	cursor: pointer;
}

.wrapper .form .inputfield .check input[type="checkbox"] {
	position: absolute;
	top: 0;
	left: 0;
	opacity: 0;
}

.wrapper .form .inputfield .check .checkmark {
	width: 15px;
	height: 15px;
	border: 1px solid #fec107;
	display: block;
	position: relative;
}

.wrapper .form .inputfield .check .checkmark:before {
	content: "";
	position: absolute;
	top: 1px;
	left: 2px;
	width: 5px;
	height: 2px;
	border: 2px solid;
	border-color: transparent transparent #fff #fff;
	transform: rotate(-45deg);
	display: none;
}

.wrapper .form .inputfield .check input[type="checkbox"]:checked ~
	.checkmark {
	background: #fec107;
}

.wrapper .form .inputfield .check input[type="checkbox"]:checked ~
	.checkmark:before {
	display: block;
}

.wrapper .form .inputfield .btn {
	width: 40%;
	padding: 8px 10px;
	font-size: 15px;
	border: 0px;
	background: green;
	color: #fff;
	cursor: pointer;
	border-radius: 3px;
	outline: none;
	margin-left: 68%;
}

.wrapper .form .inputfield .btn:hover {
	background: green;
}

.wrapper .form .inputfield:last-child {
	margin-bottom: 0;
}

@media ( max-width :420px) {
	.wrapper .form .inputfield {
		flex-direction: column;
		align-items: flex-start;
	}
	.wrapper .form .inputfield label {
		margin-bottom: 5px;
	}
	.wrapper .form .inputfield.terms {
		flex-direction: row;
	}
}
</style>
</head>
    
    <body>

	<jsp:include page="header.jsp"></jsp:include>
	
	<div style="max-width:1200px; margin:220px auto 0px;">
	<span
			style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">
			My Account</span>
	</div>
	
	
	<div
		style="background: #f5f5f5;padding: 30px 30px;width:1200px;margin:20px auto;border: 1px solid #e2efe1;border-radius:3px;">
		
		<div class="row">
		<div class="side-bar col-3">
			<div class="menuprofile">
				<spring:url value="/images" var="images" />
				<img src="${images}/profile.jpg" width="60" height="60" alt="" /> <a
					href="#" class="dropbtn"
					style="color: black; text-decoration: none;">Hello, <span
					style="font-size:20px;">${customerModel.firstName}
						${customerModel.lastName}</span></a>
			</div>

			<div class="menu">

				<div class="item">
					<a
						href="${pageContext.request.contextPath }/cart/listCustomerCartItem"><i
						class="fas fa-desktop"></i>My Cart</a>
				</div>
				<div class="item">
					<a class="sub-btn"><i class="fas fa-table"></i>Orders<i
						class="fas fa-angle-right dropdown"
						style="background-color: gainsboro; border-radius: 50%;; padding: 10px 10px;"></i></a>
					<div class="sub-menu">
						<a
							href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}"
							class="sub-item">Current</a> <a
							href="${pageContext.request.contextPath }/order/showDeliveredOrders${customerModel.customerid}"
							class="sub-item">Delivered</a> <a
							href="${pageContext.request.contextPath }/order/showCancelOrders${customerModel.customerid}"
							class="sub-item">Cancel</a>
					</div>
				</div>
				<div class="item">
					<a href="#"><i class="fas fa-th"></i>Wallet</a>
				</div>
				<div class="item">
				<a class="sub-btn"><i class="fas fa-cogs"></i>My Profile<i
						class="fas fa-angle-right dropdown"
						style="background-color:gainsboro; border-radius: 50%;; padding: 10px 10px;"></i></a>
					<div class="sub-menu">
						<a
							href="${pageContext.request.contextPath }/myaccount/editPassword/${customerModel.email}"
							class="sub-item">Change Password</a> <a
							href="${pageContext.request.contextPath }/myaccount/editProfile"
							class="sub-item">Edit Profile</a>
					</div>
				</div>
				<div class="item">
					<a href="${pageContext.request.contextPath}/logout"><i
						class="fas fa-info-circle"></i>LogOut</a>
				</div>
			</div>
		</div>
		
         
         
		<section class="main col-8" style="margin-left:310px; margin-top:-762px;margin-bottom:45px">
		
			<!--  <h1>Sidebar Menu With<br>Sub-Menus</h1>-->
			<div class="wrapper">
				
				<div class="title">Edit Profile</div>
				
				<div class="form">
					<form:form
						action="${pageContext.request.contextPath}/myaccount/saveEditProfile"
						method="post" modelAttribute="customer" id="myStudentForm">
						
						<form:hidden path="customerid" />
						<form:hidden path="password" />
						
						<div class="inputfield">
							<label>First Name</label>
							<!--  <input type="text" class="input"> -->
							<form:input path="firstName" class="input" id="firstName"/>
							<p id="firstNameError"></p>
						</div>
						
						<div class="inputfield">
							<label>Last Name</label>
							<!--   <input type="text" class="input"> -->
							<form:input path="lastName" class="input" id="lastName"/>
							<span id="lastNameError"></span>
						</div>
						
		<div class="inputfield">
		<label for="city">City</label>
        <form:select path="cities"  id="city" class="input">  
        <form:option value="Nagpur" label="Nagpur"/>  
        <form:option value="Hyderabad" label="Hyderabad"/>  
        <form:option value="Bhopal" label="Bhopal"/>  
        </form:select>  
        <span id="cityError"></span>
		</div>
						
		 
		 <div class="inputfield">
		<label for="expmonth">Kiosk Location</label>
        <form:select path="location" id="location" class="input">  
        <form:option value="Mihan" label="Mihan"/>  
        <form:option value="Ameerpet" label="Ameerpet"/>  
        <form:option value="Koh-E-Fiza" label="Koh-E-Fiza"/>  
        </form:select>
        <span id="locationError"></span>  
		</div>
						
						<div class="inputfield">
							<label>Gender</label>
							<div class="custom_select">
								<select>
									<option value="">Select</option>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
						</div>
						<div class="inputfield">
							<label>Email Address</label>
							<form:input path="email" class="input" id="email"/>
							 <span id="emailError"></span>
							<!--  <input type="text" class="input"> -->
						</div>
						<div class="inputfield">

							<label>Phone Number</label>
							<form:input path="mobile" class="input"  id="mobile" />
							 <span id="mobileError"></span>
							<!--  <input type="text" class="input"> -->
						</div>
						<div class="inputfield">
							<label>state</label> <input type="text" class="input">
							<!-- <textarea class="textarea"></textarea> -->
						</div>
						<div class="inputfield">
							<label>zip</label> <input type="text" class="input">
						</div>

						<!--   <div class="inputfield">
          <label>zip</label>
          <input type="text" class="input">
       </div>  -->
						<!--  <div class="inputfield terms">
          <label class="check">
            <input type="checkbox">
            <span class="checkmark"></span>
          </label>
          <p>Agreed to terms and conditions</p>
       </div>  -->
						<div class="inputfield">
						<button style="width:40%; padding: 10px 10px; font-size: 15px; border: 0px; background:#4CAF50; color: #fff; cursor: pointer; border-radius:50px; outline: none; margin-left: 65%;">Save Changes</button>
							<!-- <input type="submit" value="Save Changes" class="btn"
								> -->
						</div>
					</form:form>
				</div>
			</div>
		</section>
		</div>
	</div>



	<div style="margin-top: 50px;">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

	
	
	
	
	<!-- ............Script Code.......... -->
	
	<script type="text/javascript">
		$(document).ready(function() {
			//jquery for toggle sub menus
			$('.sub-btn').click(function() {
				$(this).next('.sub-menu').slideToggle();
				$(this).find('.dropdown').toggleClass('rotate');
			});

			/* //jquery for expand and collapse the sidebar
			 $('.menu-btn').click(function(){
			   $('.side-bar').addClass('active');
			   $('.menu-btn').css("visibility", "hidden");
			 });

			 $('.close-btn').click(function(){
			   $('.side-bar').removeClass('active');
			   $('.menu-btn').css("visibility", "visible");
			 });*/
		});
	</script>
	

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
						

							var firstNameError = false;
							var lastNameError = false;
							var mobileError = false;
							var emailError = false;
							var cityError = false;
							var locationError = false;
							
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

							

							//---------ON SUBMIT--------------//
							$("#myStudentForm").submit(
									function() {
										validate_firstName();
										validate_lastName();
										validate_mobile();
										validate_email();
										validate_city();
										validate_location();
										

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
