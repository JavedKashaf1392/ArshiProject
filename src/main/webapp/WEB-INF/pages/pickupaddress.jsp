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
	padding: 
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
	margin-left:10%;
}

.cancel {
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

.btn:hover {
	background-color: #45a049;
}

.cancel:hover {
	background-color: #45a049;
}
.back:hover{
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

 /* The Modal (background) */
/* .paymentoption {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
/* .payment-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 40%;
  height: 40%;
  margin-top:8%;
} */

/* The Close Button */
/* .close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
 */
/* .close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}   */
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
	    <li id="payment"><strong>Payment</strong></li>
		<li id="confirm"><strong>Confirm</strong></li>
		</ul>
	   </form>

	<hr style="border-bottom: 0px">

	<div class="row">
	<div style="border: 1px solid #ddd;padding: 45px 45px; background-color: white; width:70%;">
			
		    <div class="col-75">
			<div class="container">
			
				<form
					action="${pageContext.request.contextPath}/order/paymentMethod">

					<div class="row">
						<div class="col-50">
							<h3>Pickup Address</h3>
							<label for="fname"><i class="fa fa-user"></i> First Name</label> <input
								type="text" id="fname" name="firstname"
							value="${customerModel.firstName}"> <label for="email"><i
								class="fa fa-envelope"></i> Email</label> <input type="text" id="email"
								name="email" value="${customerModel.email}"> <label
								for="adr"><i class="fa fa-address-card-o"></i> Location</label>
							<input type="text" id="adr" name="address"
						value="${customerModel.location}"> <!-- <label for="city"><i
								class="fa fa-institution"></i> City</label> <input type="text" id="city"
								name="city" placeholder="New York"> -->
								<label for="city"><i
								class="fa fa-institution"></i> State</label> <input type="text" id="city"
								name="city" value="${customerModel.cities}">

							<!-- <div class="row">
								<div class="col-50">
									<label for="state">State</label> <input type="text" id="state"
										name="state" placeholder="NY">
								</div>
								<div class="col-50">
									<label for="zip">Zip</label> <input type="text" id="zip"
										name="zip" placeholder="10001">
								</div>
							</div>   -->
						</div>

						  <div class="col-50" style="margin-top:62px;">
							<!-- <h3>Payment Cards</h3> -->
							<!-- <label for="fname">Accepted Cards</label> -->
							<!-- <div class="icon-container">
								<i class="fa fa-cc-visa" style="color: navy;"></i> <i
									class="fa fa-cc-amex" style="color: blue;"></i> <i
									class="fa fa-cc-mastercard" style="color: red;"></i> <i
									class="fa fa-cc-discover" style="color: orange;"></i>
							</div> -->
							<label for="cname"><i class="fa fa-user"></i> Last Name</label> <input
								type="text" id="cname" name="cardname" value="${customerModel.lastName}">
							<label for="ccnum"><i class="fa fa-phone"></i> Contact Number</label> <input type="text" id="ccnum"
								name="cardnumber" value="${customerModel.mobile}">
								<label for="city"><i
								class="fa fa-institution"></i> City</label> <input type="text" id="city"
								name="city" value="${customerModel.cities}">
								<label for="city"><i
								class="fa fa-institution"></i> Zip</label> <input type="text" id="city"
								name="city" value="${customerModel.cities}">
								
								<!--  <label
								for="expmonth"><i
						class="fa fa-shopping-cart"></i> Cart Id</label> <input type="text" id="expmonth"
								name="expmonth" placeholder="1111"> -->
								 
								<!-- <label
								for="expmonth">Transaction Id</label> <input type="text"
								id="expmonth" name="expmonth" placeholder="0000"> -->
									</div>

					</div>
					 <!-- id="myBtn" -->
					 <input type="submit" value="COUNTINUE" class="btn" > <!-- <input
						type="submit" value="CANCEL" class="cancel"> --> <input
						type="button"
						style="background-color: #4CAF50;
	color: white;
	padding: 6px;
	margin: 10px 0;
	border: none;
	width: 18%;
	border-radius: 3px;
	cursor: pointer;
	font-size: 17px;"
						value="BACK" onclick="history.back()" class="back">
				</form>
			</div>
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
	
	<%-- <!-- The Modal -->
<div id="myModal" class="paymentoption">

  <!-- Modal content -->
  <div class="payment-content">
    <span class="close">&times;</span>
      <h3 style="text-align: center;color: green;">Payment Option</h3>
      <div style="margin-left:4%;">
       <a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrder" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">PAY AT KIOSK</a>
          
      
      <a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderpayonline" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">PAY ONLINE</a>
          
      
      <a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderpayonline" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">WALLET</a>
      
      </div>
      
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
</script> --%>
	

</body>
</html>
