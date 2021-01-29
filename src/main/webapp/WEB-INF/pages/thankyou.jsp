<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
<head>
<!-- <link rel="icon" type="image/jpg" href="images/logo.jpg">  -->
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Home screen of VeggieFridge</title>
<link rel="stylesheet" href="style.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">

<style>
body {
	font-family: Arial;
	font-size: 17px;
	padding: 8px;
}

* {
	box-sizing: border-box;
}

.row {
	display: -ms-flexbox; /* IE10 */
	display: flex;
	-ms-flex-wrap: wrap; /* IE10 */
	flex-wrap: wrap;
	margin: 0 -16px;
	margin-left: 8%;
	margin-right: 10%;
}

.col-25 {
	-ms-flex: 25%; /* IE10 */
	flex: 25%;
}

.col-50 {
	-ms-flex: 50%; /* IE10 */
	flex: 50%;
}

.col-75 {
	-ms-flex: 75%; /* IE10 */
	flex: 75%;
}

.col-25, .col-50, .col-75 {
	padding: 0 16px;
}

.container {
	background-color: #f2f2f2;
	padding: 5px 20px 15px 20px;
	border: 1px solid lightgrey;
	border-radius: 3px;
}

input[type=text] {
	width: 100%;
	margin-bottom: 20px;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

label {
	margin-bottom: 10px;
	display: block;
}

.icon-container {
	margin-bottom: 20px;
	padding: 7px 0;
	font-size: 24px;
}

.btn {
	background-color: #4CAF50;
	color: white;
	padding: 6px;
	margin: 10px 0;
	border: none;
	width: 18%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.cancel {
	background-color: #4CAF50;
	color: white;
	padding: 6px;
	margin: 10px 0;
	border: none;
	width: 13%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
}

.btn:hover {
	background-color: #45a049;
}

.cancel:hover {
	background-color: #45a049;
}

a {
	color: #2196F3;
}

hr {
	border: 1px solid lightgrey;
}

span.price {
	float: right;
	color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media ( max-width : 800px) {
	.row {
		flex-direction: column-reverse;
	}
	.col-25 {
		margin-bottom: 20px;
	}
}
/* .................Progrees bar................ */
#msform {
	text-align: center;
	position: relative;
	margin-top: 20px;
	margin-left: 20%;
}

#msform .action-button:hover, #msform .action-button:focus {
	background-color: #311B92
}

#msform .action-button-previous {
	width: 100px;
	background: #616161;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 0px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px 10px 0px;
	float: right
}

#msform .action-button-previous:hover, #msform .action-button-previous:focus
	{
	background-color: #000000
}

#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	color: lightgrey
}

#progressbar .active {
	color: seagreen;
}

#progressbar li {
	list-style-type: none;
	font-size: 15px;
	width: 25%;
	float: left;
	position: relative;
	font-weight: 400
}

#progressbar #account:before {
	font-family: FontAwesome;
	content: "\f007"
}

#progressbar #personal:before {
	font-family: FontAwesome;
	content: "\f007"
}

#progressbar #payment:before {
	font-family: FontAwesome;
	content: "\f030"
}

#progressbar #confirm:before {
	font-family: FontAwesome;
	content: "\f00c"
}

#progressbar li:before {
	width: 50px;
	height: 50px;
	line-height: 45px;
	display: block;
	font-size: 20px;
	color: #ffffff;
	background: lightgray;
	border-radius: 50%;
	margin: 0 auto 10px auto;
	padding: 2px
}

#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: lightgray;
	position: absolute;
	left: 0;
	top: 25px;
	z-index: -1
}

#progressbar li.active:before, #progressbar li.active:after {
	background: green;
}

.progress {
	height: 20px
}

.progress-bar {
	background-color: green;
}

.splash {
	text-align: center;
	margin-left: 32%;
	margin-top: 5%;
	font-family: 'Montserrat', sans-serif;
	border-radius: 10px;
	/*  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22); */
	position: relative;
	overflow: hidden;
	width: 550px;
	max-width: 100%;
	min-height: 100px;
}

.row:after {
	content: "";
	display: table;
	clear: both;
}

.col-75 {
	width: 100%;
	margin-top: 11px;
	color: black;
}

input[type=submit] {
	background-color: #4CAF50;
	color: white;
	padding: 10px 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: center;
	margin-top: 10px;
}

input[type=submit]:hover {
	background-color: green;
}

@
keyframes show { 0%, 49.99% {
	opacity: 0;
	z-index: 1;
}
50
%
,
100
%
{
opacity
:
1;
z-index
:
5;
}
</style>
</head>
<body>
	<div class="logo" style="margin-left: 10%;">
		<spring:url value="/images" var="images" />
		<img src="${images}/logo.jpg" width="160" height="110"
			style="position: absolute;" />
	</div>
	<form id="msform">
		<!-- progressbar -->
		<ul id="progressbar">
			<li class="active" id="account"><strong>Confirm Address</strong></li>
			<li class="active" id="account"><strong>Payment</strong></li>
			<li class="active" id="confirm"><strong>Confirm</strong></li>
		</ul>
	</form>

	<hr style="border-bottom: 0px">

	<div
		style="background-color: #f1f1f1; padding: 10px 20px; margin-top:;">
		<div class="splash"
			style="background-color: white; padding: 70px 70px; border: 1px solid #ddd;">
			<div class="row">
				<div class="col-75">
					<form method="post"
						action="${pageContext.request.contextPath}/login/generateLink"
						modelAttribute="kioskLocation">
						<i class="fa fa-check-circle"
							style="font-size: 80px; color: green"></i>
						<h1>Thank You !</h1>
						<h4
							style="color: #4CAF50; font-size: 85%; margin-top: 2%; text-align: center;">For
							Shopping with Us</h4>
						<h5 style="color: #4CAF50;">Recieve your order to your pickup
							location</h5>
						<span class="fas fa-map-marker-alt"
							style="color: green; font-size: 25px;"></span> <span
							style="color: black;">${customerModel.cities},${customerModel.location}</span><br>
						<br> <a
							href="${pageContext.request.contextPath}/home"
							style="display: inline-block; padding: 10px 70px; text-align: center; text-decoration: none; color: #ffffff; background-color: green; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;">Continue
							Shopping</a>
				</div>
			</div>
			</form>
		</div>
	</div>

</body>
</html>

