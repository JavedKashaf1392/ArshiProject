
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<title>Online Vegetable And Milk Shopping in India-VeggieFridge</title>
<meta charset="utf-8">
<link rel="icon"
	href="https://webdevtrick.com/wp-content/uploads/2019/02/webdevtrick-favicon-1.png"
	type="image/png" sizes="16x16">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script async
	src="https://www.googletagmanager.com/gtag/js?id=UA-77741880-4"></script>
<script>
	window.dataLayer = window.dataLayer || [];
	function gtag() {
		dataLayer.push(arguments);
	}
	gtag('js', new Date());

	gtag('config', 'UA-77741880-4');
</script>
<script async
	src=//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js></script>
<script>
	(adsbygoogle = window.adsbygoogle || []).push({
		google_ad_client : "ca-pub-1438670738267328",
		enable_page_level_ads : true
	});
</script>
<script async
	src=//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js></script>
<script>
	(adsbygoogle = window.adsbygoogle || []).push({
		google_ad_client : "ca-pub-1438670738267328",
		enable_page_level_ads : true
	});
</script>
<title>Responsive Shopping Cart | Webdevtrick.com</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="canonical"
	href="https://webdevtrick.com/responsive-shopping-cart-page/" />
<link rel="stylesheet" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title></title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/dbed6b6114.js"
	crossorigin="anonymous"></script>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700;900&display=swap')
	;

:root { -
	-white-light: rgba(255, 255, 255, 0.5); -
	-alice-blue: #f8f9fa; -
	-carribean-green: #40c9a2; -
	-gray: #ededed;
}

* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}

body {
	font-family: 'Quicksand', sans-serif;
}
/* Code By Webdevtrick ( https://webdevtrick.com ) */
.product-image {
	float: left;
	width: 20%;
}

.product-details {
	float: left;
	width: 25%;
}

.product-price {
	float: left;
	width: 16%;
}

.product-quantity {
	float: left;
	width: 19%;
}

.product-removal {
	float: left;
	width: 2%;
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
	content: 'Rs';
}

h1 {
	font-weight: 100;
}

label {
	color: #aaa;
}

.shopping-cart {
	margin-top: 10px;
}

/* Column headers */
.column-labels label {
	padding-bottom: 15px;
	margin-bottom: 15px;
	border-bottom: 1px solid #eee;
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
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}

.product .product-details .product-description {
	margin: 5px 20px 5px 0;
	line-height: 1.4em;
}

.product .product-quantity input {
	width: 40px;
}

.product .remove-product {
	border: 0;
	padding: 4px 8px;
	background-color: #ff4242;
	color: #fff;
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
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
}

.totals .totals-item label {
	float: left;
	clear: both;
	width: 79%;
	text-align: right;
}

.totals .totals-item .totals-value {
	float: right;
	width: 21%;
	text-align: right;
}

.totals .totals-item-total {
	font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium";
}

.checkout {
	float: right;
	border: 0;
	margin-top: 20px;
	padding: 6px 25px;
	background-color: #5cb85c;
	color: #fff;
	font-size: 25px;
	border-radius: 3px;
}

.checkout:hover {
	background-color: #019701;
}

/* Make adjustments for tablet */
@media screen and (max-width: 650px) {
	.shopping-cart {
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
		content: 'Item Total: $';
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
</style>
</head>
<body>
	<jsp:include page="userheader.jsp" />
	<c:choose>
	<c:when test="${not empty listcustomercartitem}">
		<div class="shopping-cart">
			<div class="column-labels">
				<label class="product-image">Image</label> <label
					class="product-details">Product</label> <label
					class="product-price">Price</label> <label class="product-quantity">Quantity</label>
				<label class="product-removal">Remove</label> <label
					class="product-line-price">SubTotal</label>
			</div>
			
				<c:set var="s" value="0"></c:set>
				<c:forEach var="cartitem" items="${listcustomercartitem}">
					<c:set var="s"
						value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>

					<div class="product">
						<div class="product-image">
							<spring:url value="/images" var="images"/> <img
								src="${images}/${cartitem.product.imageName}" width="100%" ;/>
						</div>
						<div class="product-details">
							<div class="product-title">${cartitem.product.productName}</div>
							<p class="product-description">${cartitem.product.description}.</p>
						</div>
						<div class="product-price">${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</div>
						<div class="product-quantity">
							<input type="number" value="2" min="1">
						</div>
						<div class="product-removal">
							<button class="remove-product" onclick="window.location.href='${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}'"><i class="fa fa-trash"></i></button>
						</div>
						<div class="product-line-price">${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</div>
					</div>
				</c:forEach>

				<div class="totals">
					<div class="totals-item totals-item-total">
						<label>Total</label>
						<div class="totals-value" id="cart-total">${s}</div>
					</div>
				</div>
				
				<a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">Continue Shopping</a>

				<button class="checkout">Checkout</button>
		</div>
		</c:when>
		<c:otherwise>

		<div class="jumbotron">
			<h3 class="text-center">Your Cart is Empty!</h3>
		</div>

	</c:otherwise>
	</c:choose>
	
	<script
		src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
	<script src="function.js"></script>

	<script>
		// Code By Webdevtrick ( https://webdevtrick.com )
		/* Set rates + misc */
		var taxRate = 0.05;
		var shippingRate = 15.00;
		var fadeTime = 300;

		/* Assign actions */
		$('.product-quantity input').change(function() {
			updateQuantity(this);
		});

		$('.product-removal button').click(function() {
			removeItem(this);
		});

		/* Recalculate cart */
		function recalculateCart() {
			var subtotal = 0;

			/* Sum up row totals */
			$('.product').each(
					function() {
						subtotal += parseFloat($(this).children(
								'.product-line-price').text());
					});

			/* Calculate totals */
			var tax = subtotal * taxRate;
			var shipping = (subtotal > 0 ? shippingRate : 0);
			var total = subtotal + tax + shipping;

			/* Update totals display */
			$('.totals-value').fadeOut(fadeTime, function() {
				$('#cart-subtotal').html(subtotal.toFixed(2));
				$('#cart-tax').html(tax.toFixed(2));
				$('#cart-shipping').html(shipping.toFixed(2));
				$('#cart-total').html(total.toFixed(2));
				if (total == 0) {
					$('.checkout').fadeOut(fadeTime);
				} else {
					$('.checkout').fadeIn(fadeTime);
				}
				$('.totals-value').fadeIn(fadeTime);
			});
		}

		/* Update quantity */
		function updateQuantity(quantityInput) {
			/* Calculate line price */
			var productRow = $(quantityInput).parent().parent();
			var price = parseFloat(productRow.children('.product-price').text());
			var quantity = $(quantityInput).val();
			var linePrice = price * quantity;

			/* Update line price display and recalc cart totals */
			productRow.children('.product-line-price').each(function() {
				$(this).fadeOut(fadeTime, function() {
					$(this).text(linePrice.toFixed(2));
					recalculateCart();
					$(this).fadeIn(fadeTime);
				});
			});
		}

		/* Remove item from cart */
		function removeItem(removeButton) {
			/* Remove row from DOM and recalc cart total */
			var productRow = $(removeButton).parent().parent();
			productRow.slideUp(fadeTime, function() {
				productRow.remove();
				recalculateCart();
			});
		}
	</script>



	<jsp:include page="footer.jsp" />
	<script>
		function myFunction() {
			var x = document.getElementById("myTopnav");
			if (x.className === "topnav") {
				x.className += " responsive";
			} else {
				x.className = "topnav";
			}
		}
	</script>

</body>
</html>