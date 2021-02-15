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
	margin-right:85px;
}

.totals .totals-item label {
	float: left;
	clear: both;
	width: 79%;
	text-align: right;
}

.totals .totals-item .totals-value {
	float:left;
	width: 21%;
	text-align:right;
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
</style>
</head>

<body>

	<jsp:include page="mainheader.jsp"></jsp:include>

	<div style="max-width: 1200px; margin: 17px auto;">
		<span
			style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">Cancel
			Order</span>
	</div>

	<div class="wrapper">

		<div class="view_main">
			<div class="view_wrap list-view" style="display: block;">
				<div style="margin-left: 10px; line-height: 30px;">
					<p style="font-weight: 600">Dear ${customerModel.firstName},</p>
					<p>Your order has been canceled. The items listed below were
						part of the canceled</p>
				</div>

				<div class="view_item">
					<div class="vi_left" style="line-height: 30px;">
										<table
						style="max-width:500px;border-spacing:10px 2px;">
								
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<tr>
								<td>
								<p style="font-weight:500;">OrderId</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;">${order.orderid}</p>
								</td>
								</tr>
								
								<tr>
								<td>
								<p style="font-weight:500;">OrderDate</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;"><fmt:formatDate value="${order.orderDate}" pattern="${dateformatter}" /></p>
								</td>
								</tr>
								<tr>
								<td>
								<p style="font-weight: 500;">OrderStatus</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;">${order.pickupStatus}</p>
								</td>
								</tr>
						
									
</table>
						
					</div>
					<div class="vi_right" style="line-height: 30px;">
					<table
						style="max-width:500px;border-spacing:10px 2px;">
								
								<th></th>
								<th></th>
								<th></th>
								<th></th>
								<tr>
								<td>
								<p style="font-weight:500;">City</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;">${customerModel.cities}</p>
								</td>
								</tr>
								
								<tr>
								<td>
								<p style="font-weight:500;">Location</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;">${customerModel.location}</p>
								</td>
								</tr>
								<tr>
								<td>
								<p style="font-weight: 500;">State</p>
								</td>
								<td style="font-weight: 500;"> : </td>
								<td>
								<p style="font-weight: 200;">Maharstra, 342759</p>
								</td>
								</tr>
						
									
</table>
						

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
										<p class="product-description" style="margin-left:20px;">${orderitem.productQuantity}</p>
										<!--  <input type="text" value="2" min="1"> -->
									</div>
									<div class="product-line-price" style="margin-left:10px;">
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
											maxFractionDigits="2" value="${order.orderTotal}" />
									</div>
								</div>

								<div class="totals-item totals-item-total">
									<label>Grand Total</label>
									<div class="totals-value" id="cart-total">
										${repee_sign}
										<fmt:formatNumber type="number" minFractionDigits="2"
											maxFractionDigits="2" value="${order.totalBillAmount}" />
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
								<%-- <p style="font-weight: 200;">
									<span style="font-weight: 500;">Location</span> :
									${customerModel.location}
								</p> --%>
								<!-- <p style="font-weight: 200;">
									<span style="font-weight: 500;">State</span> :
									Maharastra 231589
								</p> -->

							</div>
						</th>
					</table>
				</div>

			<span colspan="2"
										style="width: 100%;font-style: italic; font-size: 13px; font-weight: 600; color: #666666; padding: 15px 0;margin-left:170px;">
										<b style="font-size: 14px;"></b>If you have any questions
										about your order, please contact us toll free at (+91) 982 357
										6042. For Refund Money <a href="#" id="myBtn">click here</a>

									</span>
									<!-- border-top: 1px solid #eeeeee; -->
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




	<jsp:include page="footer.jsp"></jsp:include>




	<!-- <div id="myModal" class="modal"> -->

	<!-- Modal content -->
	<%-- <div class="modal-content">
			<span class="close">&times;</span>
			<h1
				style="color: #4CAF50; font-size: 200%; margin-top: 2%; text-align: center;">Do
				You Want to Refund Money</h1>
			<h2 style="color: #4CAF50; font-size: 200%; text-align: center;">
				<i class='fas fa-wallet' style="font-size: 50px; color: #4CAF50;"></i>
				In Your Wallet
			</h2>
			<div style="text-align: center;">
				<a href="${pageContext.request.contextPath}/wallet/addRefundMoneyInWallet/${customerModel.customerid}"
					style="display: inline-block; padding: 10px 30px; text-align: center; text-decoration: none; color: black; background-color: white; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid green;">Yes</a>
				<a href="#"
					style="display: inline-block; padding: 10px 30px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid green;">No</a>

			</div>
		    </div>
		    </div> --%>


	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<p
				style="margin-top:10%; text-align: center;">Do
				You Want to Refund Money</p>
			<h2 style="margin-top:8%; text-align: center;">
				
				In Your Wallet
			</h2>
			
			<table style="max-width:80px; margin:20px auto; border-spacing:20px 2px;">
			<th>
				<a
					href="${pageContext.request.contextPath}/wallet/addRefudMoneyInWallet/${order.orderid}"
					style="display: inline-block; padding: 15px 45px; text-align: center; text-decoration: none; color: black; background-color:#f4f0ec; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid black;">Yes</a>
					</th>
					<th>
				<a href="#"
					style="display: inline-block; padding: 15px 45px; text-align: center; text-decoration: none; color:black; background-color:white;outline: none; margin-top: 6px; font-size: 15px; border: 1px solid black;">No</a>
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