
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML>
<html lang="en" dir="ltr">

<head>

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

.cancelorder {
	display: inline-block;
	padding: 8px 10px;
	font-size: 12px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #DC143C;
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px #999;
}

.cancelorder:hover {
	background-color: #B22222
}

.cancelorder:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}

body {
	font-family: Arial, Helvetica, sans-serif;
}

hr {
	border: 1px solid #f1f1f1;
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

input[type=text], select, textarea {
	width: 90%;
	padding: 8px;
	border: 1px solid #008000;
	border-radius: 4px;
	resize: vertical;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
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
	background-color: #45a049;
}

.footer {
	margin-left: 15%;
	margin-right: 13%;
	position: relative;
	width: 75%;
	/*   height:500px; */
	background: #4CAF50;
	position: relative;
	/*padding: 20px;
    padding: 20px; */
	margin-top: auto;
	/* border:1px solid black;  */
}

.carousel {
	padding: 20px;
	padding: 20px;
	margin-left: 150px;
	/* margin-right:100px; */
	position: relative;
	width: 100%;
	margin-top: 5px;
	/*  background: #4CAF50; */
	/*  border: 1px solid grey;  */
	height: 1000px;
	transition: 1s;
	display: -webkit-box;
	display: -ms-flexbox;
	display: flex;
}
    @import
	url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap')
	;
* {
	margin: 0;
	padding: 0;
	/*  color: #d9d9d9; */
	/*  color:black; */
	/* box-sizing: border-box;
    font-family: 'Poppins', sans-serif; */
}

.main-content {
	display: flex;
}

.main-content .box {
	flex-basis: 50%;
	padding: 10px 80px;
}

.box h2 {
	font-size: 1.125rem;
	font-weight: 600;
	text-transform: uppercase;
}

.box .content {
	margin: 20px 0 0 0;
	position: relative;
}

.box .content:before {
	position: absolute;
	content: '';
	top: -10px;
	height: 2px;
	width: 100%;
	background: #1a1a1a;
	/*   background: #d9d9d9; */
}

.box .content:after {
	position: absolute;
	content: '';
	height: 2px;
	width: 15%;
	/*   background: #f12020; */
	background: #d9d9d9;
	top: -10px;
}

.left .content p {
	text-align: justify;
}

.center .content .social {
	margin: 20px 0 0 0;
}

.center .content .social a {
	padding: 0 2px;
}

.center .content .social a span {
	height: 40px;
	width: 40px;
	/*  background: #1a1a1a;  */
	background: white;
	line-height: 40px;
	text-align: center;
	font-size: 18px;
	border-radius: 50px;
	transition: 0.3s;
}
/* ...Left Content.... */
.center .content .social a span:hover {
	background: #f12020;
}

.center .content .fas {
	font-size: 1.4375rem;
	/*  background: #1a1a1a; */
	background: white;
	height: 45px;
	width: 45px;
	line-height: 45px;
	text-align: center;
	border-radius: 50%;
	transition: 0.3s;
	cursor: pointer;
}

.center .content .fas:hover {
	background: #4CAF50;
}

.center .content .text {
	font-size: 1.0625rem;
	font-weight: 500;
	padding-left: 10px;
}

.center .content .phone {
	margin: 15px 0;
}

.right form .text {
	font-size: 1.0625rem;
	margin-bottom: 2px;
	color: #656565;
}

.right form .msg {
	margin-top: 10px;
}

.right form input, .right form .msgForm {
	width: 100%;
	font-size: 1.0625rem;
	/*  background: #151515; */
	padding-left: 10px;
	border: 1px solid #222222;
}

.right form input:focus, .right form .msgForm:focus {
	outline-color: #3498db;
}

.right form input {
	height: 35px;
}

.right form .btn {
	margin-top: 10px;
}

.right form .btn button {
	height: 40px;
	width: 100%;
	border: none;
	outline: none;
	background: #125688;
	font-size: 1.0625rem;
	font-weight: 500;
	cursor: pointer;
	transition: .3s;
}

.right form .btn button:hover {
	background: #4CAF50;
}

.bottom center {
	align-content: /*  background: #444; */
		/* color: #fff;  */ padding : 20px;
	margin-top: 130px;
	padding: 5px;
	font-size: 0.9375rem;
	background: white;
	width: 80%;
}

.bottom center span {
	color: #656565;
}

.bottom center a {
	color: black;
	text-decoration: none;
}

.bottom center a:hover {
	text-decoration: underline;
}

@media screen and (max-width: 900px) {
	footer {
		position: relative;
		bottom: 0px;
	}
	.main-content {
		flex-wrap: wrap;
		flex-direction: column;
	}
	.main-content .box {
		margin: 5px 0;
	}
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
  opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Float cancel and delete buttons and add an equal width */
.cancelbtn, .deletebtn {
  float: left;
  width: 50%;
}

/* Add a color to the cancel button */
.cancelbtn {
  background-color: #ccc;
  color: black;
}

/* Add a color to the delete button */
.deletebtn {
  background-color: #f44336;
}

/* Add padding and center-align text to the container */
.container {
  padding: 16px;
  text-align: center;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: #474e5d;
  padding-top: 50px;
}

/* Modal Content/Box */
.modal-content {
  
  background-color: #fefefe;
  border: 1px solid #888;
  width: 80%; /* Could be more or less, depending on screen size */
}

/* Style the horizontal ruler */
hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Modal Close Button (x) */
.close {
  position: absolute;
  right: 35px;
  top: 15px;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.close:hover,
.close:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and delete button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtn, .deletebtn {
     width: 100%;
  }
}
}
</style>
</head>
<body>

	<!--  header -->
	<jsp:include page="userheader.jsp" />

	<div class="centercontent"
		style="background-color:; margin-top: 15px; margin-bottom:;">

		<div class="sidemenu"
			style="margin: 0; padding: 0; width: 250px; background-color: #f1f1f1; position: absolute; height: 700px;
	/*overflow: auto;*/ margin-left: 15%; border: 1px solid #ddd;">

			<a class="active" href="#home"
				style="display: block; color: white; padding: 16px; text-decoration: none; background-color: #4CAF50;">My
				Account</a> <a
				href="${pageContext.request.contextPath }/order/editProfile"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- Edit Profile</a> <a
				href="${pageContext.request.contextPath }/cart/listCustomerCartItem"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- MY Cart</a> <a
				href="${pageContext.request.contextPath }/order/pendingorders"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- MY Order</a> <a href="${pageContext.request.contextPath }/home/wallet"
				style="display: block; color: black; padding: 16px; text-decoration: none;"->
				- My Wallet</a> <a href="#home"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- Membership</a> <a
				href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- Pending Orders</a> <a
				href="${pageContext.request.contextPath }/order/showDeliveredOrders${customerModel.customerid}"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- Deliverd Orders</a> <a href="#news"
				style="display: block; color: black; padding: 16px; text-decoration: none;">
				- Customer Service</a> <input type="button"
				style="width: 140px; cursor: pointer; margin: 4px 4px; font-size: 14px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 10px; border: none; margin-left: 8%;"
				value="Back" onclick="history.back()">
		</div>

		<div class="center"
			style="margin-left: 200px; padding: 1px 16px; height: 700px; margin-left: 32%; background-color:; margin-right: 13%;">

			<h3>Pendings</h3>
			<hr>
			<input type="text" id="myInput" onkeyup="myFunction()"
				placeholder="Search for order.." title="Type in a name"
				style="background-image: url('/css/searchicon.png'); background-position: 10px 10px; background-repeat: no-repeat; width: 45%; font-size: 16px; padding: 10px 20px 12px 40px; border: 1px solid #ddd; margin-bottom: 5px; margin-left: 47%; margin-right: auto; margin-top: 5px;">

			<table id="myTable"
				style="margin-left: auto; margin-right: auto; text-align: center; border-collapse: collapse; width: 100%; border: 1px solid #ddd; font-size: 18px; align-content: center; background-color: white; margin-bottom: 50px; margin-top: %;">

				<tr class="header"
					style="border-bottom: 1px solid #ddd; text-align: center; border-bottom: 1px solid #ddd; text-align: center; background-color: #4CAF50">
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Id</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Date</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Status</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Total
						Amount</th>
					<th></th>
				</tr>

				<c:forEach var="orders" items="${pendingOrders}">
					<tr style="border-bottom: 1px solid #ddd;">
						<td style="text-align: center; padding: 16px;"><a
							href="${pageContext.request.contextPath }/order/listOrderItems/${orders.orderid}"
							style="font-size: 100%; color: dodgerblue;">${orders.orderid}</a></td>
						<td style="text-align: center; padding: 16px;">${orders.orderDate}</td>
						<td style="text-align: center; padding: 16px;">${orders.pickupStatus}</td>
						<!-- <i class="fa fa-check-circle" style="color:green"></i> -->
						<td style="text-align: center; padding: 16px;">${orders.orderTotal}</td>
						<td><a href="${pageContext.request.contextPath }/order/cancelOrder/${orders.orderid}"
							style="display: inline-block; padding: 8px 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;"
						onclick="return confirm('Are you sure to cancel order?')"	>cancel</a><%-- <button class="cancelorder" id="myBtn" onclick="${pageContext.request.contextPath }/order/cancelOrder/${orders.orderid}">CANCEL</button>                 --%>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>

			<!--  ............................  -->
			<div class="footer" style="margin-top: auto;">
				<div class="main-content">
					<div class="left box">

						<h2>VeggieFridge</h2>
						<div class="content">
							<a href="#" style="color: white">About Us</a><br>
							<br> <a href="#" style="color: white">Privacy Policy</a><br>
							<br> <a href="#" style="color: white">Help</a><br>
							<br> <a href="#" style="color: white">Terms And
								Condition</a><br>
							<br> <a href="#" style="color: white">Carriers</a><br>
							<br> <a href="#" style="color: white">Affiliate</a><br>
							<br> <a href="#" style="color: white">In News</a><br>
							<br> <a href="#" style="color: white">vf instant</a><br>
							<br> <a href="#" style="color: white">vf daily</a><br>
							<br>
						</div>
					</div>
					<div class="center box">
						<h2>Address</h2>
						<div class="content">
							<div class="place">
								<span class="fas fa-map-marker-alt"></span> <span class="text">Birendranagar,
									Surkhet</span>
							</div>
							<div class="phone">
								<span class="fas fa-phone-alt"></span> <span class="text">+089-765432100</span>
							</div>
							<div class="email">
								<span class="fas fa-envelope"></span> <span class="text">abc@example.com</span>
							</div>


							<div class="social">
								<h4>Social</h4>
								<br> <a href="https://facebook.com/coding.np"><span
									class="fab fa-facebook-f"
									style="background-color: #3B5998; color: white;"></span></a> <a
									href="#"><span class="fab fa-twitter"
									style="background-color: #55ACEE; color: white;"></span></a> <a
									href="https://instagram.com/coding.np"><span
									class="fab fa-instagram"
									style="background-color: #125688; color: white;"></span></a> <a
									href="https://youtube.com/c/codingnepal"><span
									class="fab fa-linkedin"
									style="background-color: #007bb5; color: white;"></span></a> <a
									href="https://youtube.com/c/codingnepal"><span
									class="fab fa-pinterest"
									style="background-color: #bb0000; color: white;"></span></a>
							</div>

						</div>
					</div>
					<div class="right box">
						<h2>Contact us</h2>
						<div class="content">
							<form action="#">
								<div class="email">
									<div class="text">Email *</div>
									<input type="email" required>
								</div>
								<div class="msg">
									<div class="text">Message *</div>
									<!-- NOTE: Due to more textarea tag I got an error. So I changed the textarea name to changeit. Please change that changeit name to textarea -->
									<changeit id=".msgForm" rows="2" cols="25" required></changeit>
									<!-- replace this changeit name to textarea -->

									<br />
									<div class="btn">
										<button type="submit">Send</button>
									</div>
							</form>
							<br>

							<h4>Download Apps</h4>
							<br>
							<table>
								<th><a href="abc.htm"> <spring:url value="/images"
											var="images" /> <img
										src="${images}/Apple-App-store-icon.png" width="100"
										height="40" style="float: right; margin-right: 7%" />
								</a></th>
								<th><a href="abc.htm"> <spring:url value="/images"
											var="images" /> <img
										src="${images}/Google-App-store-icon.png" width="100"
										height="40" style="float: right;" />
								</a></th>
							</table>
						</div>

						<div class="bottom">
							<center>
								<span class="credit">Created By <a
									href="https://youtube.com/c/codingnepal">vf</a> |
								</span> <span class="far fa-copyright"></span> 2020 All rights
								reserved.
							</center>
						</div>

					</div>
				</div>
			</div>
			
  <div id="id01" class="modal">
  <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">×</span>
  <form class="modal-content" action="/action_page.php">
    <div class="container">
      <p style="color: green;">Are you sure you want to cancel your order?</p>
    
      <div class="clearfix">
        <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Keep Order</button>
        <button type="button" onclick="window.location.href='${pageContext.request.contextPath }/order/cancelOrder/${orders.orderid}'" class="deletebtn">Cancel Order</button>
      </div> 

    </div>
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
