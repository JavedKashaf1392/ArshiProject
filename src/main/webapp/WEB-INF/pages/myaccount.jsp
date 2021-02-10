<!DOCTYPE html>

<html lang="en" dir="ltr">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>VeggieFridge</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	charset="utf-8"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap')
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.side-bar {
	/* background: rgba(255, 255, 255, 0.1);*/
	/* backdrop-filter: blur(15px); */
	width: 290px;
	height: 100vh;
	position: absolute;
	top: 0;
	left: -100%;
	/*  overflow-y: auto; */
	transition: 0.6s ease;
	transition-property: left;
	background-color: white;
	left: 0;
	margin-top: 295px;
	margin-left: 15%;
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
	height: 900px;
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

	<jsp:include page="mainheader.jsp"></jsp:include>
	
	<div style="border:1 px green;background-color:white;margin-top:10px;font-weight: bold;color: green;font-size:25px;width: 1200px;margin: 0 auto;">My profile</div>
	<div
		style="background: #f5f5f5;padding: 30px 30px;margin-top:45px;width: 1200px;margin: 0 auto;">
		<div class="side-bar">
			<div class="menuprofile">
				<spring:url value="/images" var="images" />
				<img src="${images}/profile.jpg" width="60" height="60" alt="" /> <a
					href="#" class="dropbtn"
					style="color: black; text-decoration: none;">Hello, <span
					style="font-size: 20px;">${customerModel.firstName}
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
						style="background-color: gainsboro; border-radius: 50%;; padding: 10px 10px;"></i></a>
					<div class="sub-menu">
						<a
							href="${pageContext.request.contextPath }/cart/editPassword/${customerModel.email}"
							class="sub-item">Change Password</a> <a
							href="${pageContext.request.contextPath }/cart/editProfile${customerModel.customerid}"
							class="sub-item">Edit Profile</a>
					</div>
				</div>
				<div class="item">
					<a href="${pageContext.request.contextPath}/logout"><i
						class="fas fa-info-circle"></i>LogOut</a>
				</div>
			</div>
		</div>

		<section class="main" style="margin-left:280px; margin-top:78px;">
			<!--  <h1>Sidebar Menu With<br>Sub-Menus</h1>-->
			<div class="wrapper">
				<div class="title">Edit Profile</div>
				<div class="form">
					<form:form
						action="${pageContext.request.contextPath}/cart/saveEditProfile"
						method="post" modelAttribute="customer">
						<form:hidden path="customerid" />
						<form:hidden path="password" />
						<div class="inputfield">
							<label>First Name</label>
							<!--  <input type="text" class="input"> -->
							<form:input path="firstName" class="input" />
							<form:errors path="firstName" cssClass="error" />
						</div>
						<div class="inputfield">
							<label>Last Name</label>
							<!--   <input type="text" class="input"> -->
							<form:input path="lastName" class="input" />
							<form:errors path="lastName" cssClass="error" />
						</div>
						<div class="inputfield">
							<label>City</label>
							<form:input path="cities" class="input" />
							<!--  <input type="password" class="input"> -->
						</div>
						<div class="inputfield">
							<label>Location</label>
							<form:input path="location" class="input" />
							<!--  <input type="password" class="input"> -->
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
							<form:input path="email" class="input" />
							<!--  <input type="text" class="input"> -->
						</div>
						<div class="inputfield">

							<label>Phone Number</label>
							<form:input path="mobile" class="input" />
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
							<input type="submit" value="Save Changes" class="btn"
								style="width: 40%; padding: 15px 10px; font-size: 15px; border: 0px; background: green; color: #fff; cursor: pointer; border-radius: 3px; outline: none; margin-left: 65%;">
						</div>
					</form:form>
				</div>
			</div>
		</section>
	</div>



	<div style="margin-top: 50px;">
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

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

</body>
</html>
