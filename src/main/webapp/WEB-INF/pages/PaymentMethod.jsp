<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html>
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
			<li id="confirm"><strong>Confirm</strong></li>
		</ul>
	</form>

	<hr style="border-bottom: 0px">

	<div class="row">
		<div class="col-75">
			<div class="container">
				<h3
					style="color: green; text-align: center; margin-top: 2%; font-size: 24px;">Select
					Payment Method</h3>

				<div
					style="border: 1px solid #ddd; margin-right: 10%; margin-left: 10%; padding: 50px 50px; background-color: white;">

					<table
						style="cellspacing: 2%; border-spacing: 10px; margin-top: 1%;">
						<!-- #DCDCDC -->
						
						<th
							style="background-color: #DCDCDC; padding: px px; border-radius: px; border: 1px solid #ddd; height: 20px; width: 180px;">
							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayByWallet"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class='fas fa-wallet' style="font-size: 50px; color: black;"></span></a>
							<!--   Balance:5000.00 -->
						</th>

						<th
							style="background-color: #DCDCDC; padding: px px; width: %; border-radius: px; border: 1px solid #ddd; height: 20px; width: 180px;">
							<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayOnline"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class="fa fa-bank" style="font-size: 50px; color: black"></span></a>
							<!--   Card:11 -->
						</th>
					
						<th
							style="background-color: #DCDCDC; padding: px px; width: %; border-radipx; border: 1px solid #ddd; height: 100px; width: 180px;">
							<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderUPI"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class="fa fa-shopping-cart"
								style="font-size: 50px; color: black"></span></a> <!--  Transaction:0 -->
						</th>
						<th
							style="background-color: #DCDCDC; padding: px px; border-radius: px; text-align: center; border: 1px solid #ddd; font-size: 15px; height: 20px; width: 180px;">

							<a
							href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayATKiosk"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class='far fa-credit-card' style="font-size: 50px; color: black"></span></a>
							<!--  Membership Id:3 -->
						</th>
						<tr>
							<td style="text-align:center;">Wallet</td>
							<td style="text-align:center;">Pay Online</td>
							<td style="text-align:center;">UPI</td>
							<td style="text-align:center;">Pay AT Kiosk</td>
						</tr>
					</table>
				</div>
	<input
						type="button"
						style="background-color: #4CAF50;
	color: white;
	padding: 6px;
	margin: 10px 0;
	border: none;
	width: 18%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;
	margin-left:10%;"
    value="BACK" onclick="history.back()" class="back">


			</div>
			
		</div>

	 <div class="col-25">
			<div class="container">
			<h4>
					Cart <span class="price" style="color: black"><i
						class="fa fa-shopping-cart"></i> <b>${customerModel.cartpage.cartitem}</b></span>
				</h4>
			
			<c:choose>
		    <c:when test="${not empty listcustomercartitem}">
		    
<c:set var="s" value="0"></c:set>
<c:forEach var="cartitem" items="${listcustomercartitem}">
<c:set var="s" value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>
				
				<p>
					<a href="#">${cartitem.product.productName}</a> <span class="price">${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</span>
				</p>
				<!-- <p>
					<a href="#">Product 2</a> <span class="price">Rs5</span>
				</p>
				<p>
					<a href="#">Product 3</a> <span class="price">Rs8</span>
				</p>
				<p>
					<a href="#">Product 4</a> <span class="price">Rs2</span>
				</p> -->
				</c:forEach>
				<hr>
				<p>
					Total <span class="price" style="color: black"><b>${s}</b></span>
				</p>
				</c:when>
				 <c:otherwise>
			
			<div class="jumbotron">
			<h3 class="text-center">Your Cart is Empty!</h3>
			</div>
		
		</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

</body>
</html>
