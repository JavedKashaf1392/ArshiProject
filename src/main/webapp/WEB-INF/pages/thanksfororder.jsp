<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>VeggieFridge</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

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

.view_item img {
	width: 75px;
}

.wrapper {
	width: 1200px;
	margin: 20px auto;
}

.links {
	margin-bottom: 25px;
	background: #fff;
	padding: 15px;
	border-radius: 3px;
}

.links ul {
	display: flex;
	justify-content: center;
}

.links ul li {
	margin: 0 15px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-size: 20px;
	cursor: pointer;
}

.links ul li:hover, .links ul li.active {
	color: #4abd3e;
}

.view_main {
	background: #f5f5f5;
	border-radius: 3px;
	padding: 15px;
	border: 1px solid #e2efe1;
	padding: 30px 30px;
}

.list-view .view_item {
	background: #fff;
	border: 1px solid #e2efe1;
	margin: 10px;
	padding: 10px 20px;
	display: flex;
	align-items: center;
}

.list-view .view_item:last-child {
	margin-bottom: 0;
}

.list-view .view_item .vi_left {
	margin-right: 25px;
}

.view_item .title {
	font-weight: 600;
}

.view_item .content {
	margin: 5px 0;
	font-size: 14px;
	line-height: 22px;
	font-weight: 200;
}

.view_item .btn {
	width: 125px;
	background: #4abd3e;
	padding: 8px 5px;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	font-weight: 200;
	cursor: pointer;
}

.view_item .btn:hover {
	background: #3bd62b;
}

.grid-view {
	width: 100%;
}

.grid-view .view_item {
	display: inline-block;
	border: 1px solid #e2efe1;
	width: 230px;
	padding: 25px;
	text-align: center;
	margin: 10px;
}

.grid-view .view_item .vi_left {
	margin-bottom: 10px;
}

.grid-view .view_item .btn {
	margin: 0 auto;
}

.product-image {
	float: left;
	width: 20%;
}

.product-details {
	float: left;
	width: 37%;
}

.product-price {
	float: left;
	width: 12%;
}

.product-quantity {
	float: left;
	width: 10%;
}

.product-removal {
	float: left;
	width: 3%;
	margin-left: 3%;
}

.product-line-price {
	float: left;
	width: 12%;
	text-align: right;
}

/* This is used as the traditional .clearfix class */
.group:before, .shopping-cart:before, .column-labels:before, .product:before,
	.totals-item:before, .group:after, .shopping-cart:after, .column-labels:after,
	.product:after, .totals-item:after {
	content: '';
	display: table;
}

.group:after, .shopping-cart:after, .column-labels:after, .product:after,
	.totals-item:after {
	clear: both;
}

.group, .shopping-cart, .column-labels, .product, .totals-item {
	zoom: 1;
}

/* Apply clearfix in a few places */
/* Apply dollar signs */
.product .product-price:before, .product .product-line-price:before,
	.totals-value:before {
	content: '';
}

h1 {
	font-weight: 100;
}

label {
	color: #aaa;
}

.shopping-cart {
	margin-top: -45px;
}

/* Column headers */
.column-labels label {
	padding-bottom: 15px;
	margin-bottom: 15px;
	border-bottom: 1px solid #eee;
	color: Green;
	font-weight: 300;
}

.column-labels .product-image, .column-labels .product-details,
	.column-labels .product-removal {
	text-indent: -9999px;
}

/* Product entries */
.product {
	margin-bottom: 20px;
	padding-bottom: 10px;
	border-bottom: 1px solid #eee;
}

.product .product-image {
	text-align: center;
}

.product .product-image img {
	width: 100px;
}

.product .product-details .product-title {
	margin-right: 20px;
	font-weight: 600;
	/*  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium"; */
}

.product .product-details .product-description {
	margin: 5px 20px 5px 0;
	line-height: 1.4em;
	/*  margin: 5px 0; */
	font-size: 14px;
	/* line-height: 22px; */
	font-weight: 200;
}

.product .product-quantity input {
	width: 40px;
}

.product .remove-product {
	border: 0;
	padding: 4px 8px;
	background-color: #ff4242;
	color: #fff;
	/*  font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium"; */
	font-size: 12px;
	border-radius: 3px;
}

.product .remove-product:hover {
	background-color: #e60023;
}

/* Totals section */
.totals .totals-item {
	float: right;
	clear: both;
	width: 100%;
	margin-bottom: 10px;
	margin-right: 85px;
}

.totals .totals-item label {
	float: left;
	clear: both;
	width: 79%;
	text-align: right;
}

.totals .totals-item .totals-value {
	float: left;
	width: 21%;
	text-align: right;
}

.totals .totals-item-total {
	/* font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium"; */
	
}

.checkout {
	float: right;
	border: 0;
	margin-top: 20px;
	padding: 8px 30px;
	background-color: green;
	color: #fff;
	font-size: 20px;
	border-radius: 3px;
}

.checkout:hover {
	background-color: #019701;
}

.BackToShop {
	float: left;
	border: 0;
	margin-top: 20px;
	padding: 8px 30px;
	background-color: green;
	color: #fff;
	font-size: 20px;
	border-radius: 3px;
}

.BackToShop:hover {
	background-color: #019701;
}

/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
	.wrapper.shopping-cart {
		margin: 0;
		padding-top: 20px;
		border-top: 1px solid #eee;
	}
	.column-labels {
		display: none;
	}
	.product-image {
		float: right;
		width: auto;
	}
	.product-image img {
		margin: 0 0 10px 10px;
	}
	.product-details {
		float: none;
		margin-bottom: 10px;
		width: auto;
	}
	.product-price {
		clear: both;
		width: 70px;
	}
	.product-quantity {
		width: 100px;
	}
	.product-quantity input {
		margin-left: 20px;
	}
	.product-quantity:before {
		content: 'x';
	}
	.product-removal {
		width: auto;
	}
	.product-line-price {
		float: right;
		width: 70px;
	}
}
/* Make more adjustments for phone */
@media screen and (max-width: 350px) {
	.product-removal {
		float: right;
	}
	.product-line-price {
		float: right;
		clear: left;
		width: auto;
		margin-top: 10px;
	}
	.product .product-line-price:before {
		content: 'Item Total: ';
	}
	.totals .totals-item label {
		width: 60%;
	}
	.totals .totals-item .totals-value {
		width: 40%;
	}
}

.codes {
	bottom: 5%;
	left: 5%;
	position: fixed;
}

.codes div {
	border: 2px solid black;
	font-size: 20px;
	padding: 10px;
	background-color: red;
}

.codes div a {
	text-decoration: none;
	color: white;
	font-weight: 800;
}

}
.alert {
	padding: 10px;
	background-color: red;
	color: white;
	opacity: 1;
	transition: opacity 0.6s;
	margin-bottom: 15px;
	text-align: center;
	letter-spacing: 2px;
	cursor: pointer;
	font-weight: bold;
	max-width: 1200px;
	margin: 10px auto;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 15px;
	border: 1px solid #888;
	width: 20%;
	height: 32%;
	margin-top: 9%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
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
	/* background-color: #f2f2f2; */
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

.splash {
	text-align: center;
	margin-left: 32%;
	margin-top: 5%;
	font-family: 'Montserrat', sans-serif;
	border-radius: 10px;
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

</style>

</head>
<body>

	<div style="width: 1200px; margin: 20px auto;">
		<table>

			<th><a href="abc.htm"> <spring:url value="/images"
						var="images" /> <img src="${images}/vf-leaf.png" width="60"
					height="60" alt="" />
			</a></th>

			<th><a href="abc.htm"> <spring:url value="/images"
						var="images" /> <img src="${images}/logo2.jpg" width="200"
					height="50" alt="" />
			</a></th>
			<p style="float: right; margin-top: 20px;">(+84) 123 456 789</p>
		</table>

	</div>

	<div class="wrapper">

		<div class="view_main">
			<div class="view_wrap list-view">

				<div class="view_item">
					<div class="vi_left"></div>
					<div class="vi_right">

						
						<div class="splash" style="line-height:30px;">
							<div class="row">
								<div class="col-75">
									 
									<h1><i class="fa fa-check-circle"
									 style="font-size:40px; color: green"></i>  Thank You For Order !!!</h1>
									<h4
										style="color: #4CAF50; font-size: 85%; margin-top: 2%; text-align: center;">Your
										Order Number is<span style="color:black;font-size:20px;"> ${orders.orderid}</span></h4>
									<h5 style="color: #4CAF50;">Recieve your order to your
										pickup location</h5>
									
									<h3><i class="fas fa-map-marker-alt"
									 style="font-size:40px; color: green"></i>${customerModel.cities}, ${customerModel.location}</h3>	
									
									   <a href="${pageContext.request.contextPath}/home"
										style="display: inline-block; padding: 5px 70px; text-align: center; text-decoration: none; color: #ffffff; background-color:#4CAF50; border-radius:50px; outline: none; font-size: 15px;margin-top:15px;margin-bottom:35px;">Continue
										Shopping</a>
										
								</div>
							</div>

						</div>
						
					</div>
				</div>

				<div class="view_item">
					<div class="vi_left">
						<!-- <img src="tomato.png" alt="tomato"> -->
					</div>
					<div class="vi_right">

						<div class="shopping-cart">
							<div class="column-labels" style="margin-top: 47px;">
								<label class="product-image">Image</label> <label
									class="product-details">Product</label> <label
									class="product-price">Price</label> <label
									class="product-quantity">Quantity</label> <label
									class="product-line-price">Total</label> <label
									class="product-removal">Remove</label>
							</div>
							<c:forEach var="orderitem" items="${listorderitem}">
								<div class="product">
									<div class="product-image">
										<spring:url value="/images" var="images" />
										<img src="${images}/${orderitem.product.imageName}"
											alt="tomato" width="100" height="100" />
									</div>
									<div class="product-details">
										<div class="product-title">${orderitem.product.productName}</div>
										<p class="product-description">The best dog bones of all
											time. Holy crap. Your dog will be begging for these things! I
											got curious once and ate one myself. I'm a fan.</p>
									</div>
									<div class="product-price">
										${repee_sign}
										<fmt:formatNumber type="number" minFractionDigits="2"
											maxFractionDigits="2" value="${orderitem.product.price}" />
									</div>
									<div class="product-quantity">
										<p class="product-description" style="margin-left: 20px;">${orderitem.productQuantity}</p>
										<!--  <input type="text" value="2" min="1"> -->
									</div>
									<div class="product-line-price" style="margin-left: 10px;">
										${repee_sign}
										<fmt:formatNumber type="number" minFractionDigits="2"
											maxFractionDigits="2" value="${orderitem.totalAmount}" />
									</div>

									<div class="product-removal"></div>
								</div>
							</c:forEach>



							<div class="totals">
								<div class="totals-item">
									<label>Subtotal</label>
									<div class="totals-value" id="cart-subtotal">
										${repee_sign}
										<fmt:formatNumber type="number" minFractionDigits="2"
											maxFractionDigits="2" value="${orders.totalBillAmount}" />
									</div>
								</div>

								<div class="totals-item totals-item-total">
									<label>Grand Total</label>
									<div class="totals-value" id="cart-total">
										${repee_sign}
										<fmt:formatNumber type="number" minFractionDigits="2"
											maxFractionDigits="2" value="${orders.totalBillAmount}" />
									</div>
								</div>
							</div>

						</div>

					</div>
				</div>

				<div class="view_item">
					<table
						style=border-spacing: 70px 2px;">

						<th>
							<div class="vi_left" style="line-height: 30px;">


								<p style="font-weight: 200;">
									<span style="font-weight: 500;">Mode Of Payment</span> :
									Pay Online
								</p>
								<!-- <p style="font-weight: 200;">
									<span style="font-weight: 500;">Date</span> :
									January, 13 2021
								</p> -->
								<%-- <p style="font-weight: 200;">
									<span style="font-weight: 500;">OrderStatus</span> :
									${order.pickupStatus}
								</p> --%>
							</div>
						</th>

						<th>
							<div class="vi_right" style="line-height: 30px;">
								<p style="font-weight: 200;">
									<span style="font-weight: 500;">Payment Method</span> :
									Net Banking
								</p>

							</div>
						</th>
					</table>
				</div>
				
				
				

			</div>
		</div>
	</div>



<div class="wrapper">

		<div class="view_main">
			<div class="view_wrap list-view">

				<div class="view_item">
					
					<div style="margin: 0 auto;">
					<p style="font-size:12px;">Created By VeggieFridge Copyright © 2021 All Rights
								Reserved.</p>

						
					</div>
				</div>

			
				

			</div>
		</div>
	</div>



	<script>
		var close = document.getElementsByClassName("closebtn");
		var i;

		for (i = 0; i < close.length; i++) {
			close[i].onclick = function() {
				var div = this.parentElement;
				div.style.opacity = "0";
				setTimeout(function() {
					div.style.display = "none";
				}, 600);
			}
		}
	</script>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p style="margin-top: 10%; text-align: center;">Do You Want to
				Refund Money</p>
			<h2 style="margin-top: 8%; text-align: center;">In Your Wallet</h2>

			<table
				style="max-width: 80px; margin: 20px auto; border-spacing: 20px 2px;">
				<th><a
					href="${pageContext.request.contextPath}/wallet/addRefudMoneyInWallet/${order.orderid}"
					style="display: inline-block; padding: 15px 45px; text-align: center; text-decoration: none; color: black; background-color: #f4f0ec; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid black;">Yes</a>
				</th>
				<th><a href="#"
					style="display: inline-block; padding: 15px 45px; text-align: center; text-decoration: none; color: black; background-color: white; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid black;">No</a>
				</th>
			</table>
		</div>

	</div>
	<script>
		// Get the modal
		var modal = document.getElementById("myModal");

		// Get the button that opens the modal
		var btn = document.getElementById("myBtn");

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks the button, open the modal 
		btn.onclick = function() {
			modal.style.display = "block";
		}

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}

		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
			if (event.target == modal) {
				modal.style.display = "none";
			}
		}
	</script>


</body>
</html>