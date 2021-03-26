<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"
	import="com.veggiefridge.online.constants.VFOnlineConstants"%>

<!DOCTYPE html>
<html lang="en">
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<link href="./static/css/header.css" rel="stylesheet" type="text/css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>VeggieFridge</title>
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
	box-sizing:border-box;
}

.view_item img {
	width: 75px;
}

.wrapper {
	width: 1200px;
	margin: 200px auto 20px;
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
	color: black;
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
	font-size: 14px;
	font-weight: 200;
}

.product .product-quantity input {
	width: 40px;
}

.product .remove-product {
	border: 0;
	color:black;
	font-size: 12px;
	border-radius: 3px;
}

.product .remove-product:hover {
	color: #e60023;
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
	width:80%;
	text-align: right; 
}

.totals .totals-item .totals-value {
	float: right;
	margin-right:90px;
}

.totals .totals-item-total {
	
}

.checkout {
	float: right;
	background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    width:250px;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
    color: white;
    background:#4CAF50;
    border-radius:50px;
    margin-top:10px;
    margin-bottom: 10px;
    margin-right:28px;
   
}

.checkout:hover {
	 opacity: 0.8;
}

.keepshop {

	float:left;
	background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    width:250px;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
    color: white;
    background:#4CAF50;
    border-radius:50px; 
    margin-top:10px;
    margin-bottom: 10px; 
   
}

.keepshop:hover  {
	 opacity: 0.8;
}

/* Make adjustments for tablet */

@media screen an (max-width: 650px) {
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
.magic-shadow{
    position: relative;
    background:var(--heaven);
}
.magic-shadow:after{
    content:'';
    display:block;
    width:100%;
    height:69px;
    /* background-image:url(../images/shadow.svg); */
    background-image:url("images/shadow.svg");
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    bottom:-22px;
    z-index:-1;
   /*  box-shadow: 0px 0px 8px 1px #00000078; */
    
}
.magic-shadow-sm{
    position: relative;
    background:var(--heaven);
}
.magic-shadow-sm:after{
    content:'';
    display:block;
    width:100%;
    height:69px;
    background-image:url("/images/shadow-sm.svg");
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    bottom:-20px;
    left:50%;
    transform:translateX(-50%);
    z-index:-1;
    -webkit-transform:translateX(-50%);
    -moz-transform:translateX(-50%);
    -ms-transform:translateX(-50%);
    -o-transform:translateX(-50%);
   /*  box-shadow: 0px 0px 8px 1px #00000078; */
}
</style>
</head>
<body>
        <c:if test="${not empty message}">
		<div class="alert alert-info">
		<h3 class="text-center">${msg}</h3>
		</div>		
	    </c:if>

	
    <c:set var="availableCount" value="${customerModel.cartpage.cartitem}"/>
	
    <jsp:include page="header.jsp"></jsp:include>
   
	<div class="wrapper">
    <div style="margin-top:25px;margin-bottom:20px;">
    <span
	style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">My
	Cart</span>
	</div>
	
		<div class="view_main">
			<div class="view_wrap list-view" style="display: block;">
				<div class="view_item">
					<div class="vi_left">
						<!-- <img src="tomato.png" alt="tomato"> -->
					</div>
					<div class="vi_right">
						<c:choose>
							<c:when test="${not empty listcustomercartitem}">
								<div class="shopping-cart">
									<div class="column-labels" style="margin-top: 47px;">
										<label class="product-image">Image</label> <label
											class="product-details">Product</label> <label
											class="product-price">Price</label> <label
											class="product-quantity">Quantity</label> <label
											class="product-line-price">Total</label> <label
											class="product-removal">Remove</label>
									</div>

									<c:set var="s" value="0"></c:set>
									<c:forEach var="cartitem" items="${listcustomercartitem}">
						
						<%-- <c:if test="${cartitem.available == false}">
						<c:set var="availableCount" value="${availableCount - 1}"/>
					    </c:if>
								 --%>	
										<div class="product">
											<div class="product-image">
												<spring:url value="/images" var="images" />
												<img src="${images}/${cartitem.product.imageName}"
													width="100" height="100"/>
											</div>
											<div class="product-details" style="line-height:20px;">
												<div class="product-title">${cartitem.product.productName}</div>
												<p class="product-description">The best dog bones of all
													time. Holy crap. Your dog will be begging for these things!
													I got curious once and ate one myself. I'm a fan.</p>
											<h4 class = "size" style="color: black;font-weight:300"><span style="color: black;font-weight:400">Size : </span>${cartitem.product.size} ${cartitem.product.unit}</h4>	
													
											</div>

											<div class="product-price">${repee_sign}<fmt:formatNumber
													type="number" minFractionDigits="2" maxFractionDigits="2"
													value="${cartitem.buyingPrice}" />
											</div>
											<div class="product-quantity">
												<button 
												 style="height: 25px; width: 25px;" onclick="window.location.href='${pageContext.request.contextPath}/cart/increase/${cartitem.cartitemid}'">+</button>
												<span> ${cartitem.productCount} </span>
													
													<button 
														style="height: 25px; width: 25px;"  onclick="window.location.href='${pageContext.request.contextPath}/cart/decrease/${cartitem.cartitemid}'">-</button>
											
											</div>

											<div class="product-line-price">${repee_sign}<fmt:formatNumber
													type="number" minFractionDigits="2" maxFractionDigits="2"
													value="${cartitem.total}" />
											</div>
											<div class="product-removal">
				 							<a href="${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}">
											<i class="fa fa-trash-o " style="color: black;font-size:20px;margin-left:15px;" title="Remov Product"></i></a>
											
												<%--  <button class="remove-product"
													onclick="window.location.href='${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}'" title="remove item">
													Remove</button>  --%> 
											</div>
										</div>
									</c:forEach>
									<div class="totals" style="line-height:45px;">
										<div class="totals-item">
											<label>Subtotal : </label>
											<div class="totals-value" id="cart-subtotal">${repee_sign}<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/></div>
										</div>
										<div class="totals-item totals-item-total">
											<label>Grand Total : </label>
											<div class="totals-value" id="cart-total">${repee_sign}<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/></div>
										</div>
									</div>

									<%--  <button class="checkout"
										onclick="window.location.href='${pageContext.request.contextPath}/order/PickupAddressPaymrntOption'">Checkout</button> --%>
							  <button class="keepshop"
										onclick="window.location.href='${pageContext.request.contextPath}/home'">Keep Shopping</button> 							
							 <button class="checkout"
										onclick="window.location.href='${pageContext.request.contextPath}/order/PickupAddressPaymentOption'">Checkout</button>
	                       
	                       
							</div>
							</c:when>
							<c:otherwise>

								<div class="jumbotron">
									<h3 class="text-center" style="font-size:30px;font-weight:300;margin-top:50px;margin-left:380px;">Your
										Cart is Empty !!!</h3>
									<button class="keepshop"
										onclick="window.location.href='${pageContext.request.contextPath}/home'" style="margin-bottom:32px;margin-left:400px;margin-top:20px;">Keep Shopping</button> 
                           

								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>


















..........................









<!--  Slider code js -->
	
	<script src="myScript.js">
		var slideIndex, slides, dots, captionText;
		function initGallery() {
			slideIndex = 0;
			slides = document.getElementsByClassName("imageHolder");
			slides[slideIndex].style.opacity = 1;

			captionText = document
					.querySelector(".captionTextHolder .captionText");
			captionText.innerText = slides[slideIndex]
					.querySelector(".captionText").innerText;

			//disable nextPrevBtn if slide count is one
			if (slides.length < 2) {
				var nextPrevBtns = document
						.querySelector(".leftArrow,.rightArrow");
				nextPrevBtns.style.display = "none";
				for (i = 0; i < nextPrevBtn.length; i++) {
					nextPrevBtn[i].style.display = "none";
				}
			}

			//add dots
			dots = [];
			var dotsContainer = document.getElementById("dotsContainer"), i;
			for (i = 0; i < slides.length; i++) {
				var dot = document.createElement("span");
				dot.classList.add("dots");
				dotsContainer.append(dot);
				dot.setAttribute("onclick", "moveSlide(" + i + ")");
				dots.push(dot);
			}
			dots[slideIndex].classList.add("active");
		}
		initGallery();
		function plusSlides(n) {
			moveSlide(slideIndex + n);
		}
		function moveSlide(n) {
			var i;
			var current, next;
			var moveSlideAnimClass = {
				forCurrent : "",
				forNext : ""
			};
			var slideTextAnimClass;
			if (n > slideIndex) {
				if (n >= slides.length) {
					n = 0;
				}
				moveSlideAnimClass.forCurrent = "moveLeftCurrentSlide";
				moveSlideAnimClass.forNext = "moveLeftNextSlide";
				slideTextAnimClass = "slideTextFromTop";
			} else if (n < slideIndex) {
				if (n < 0) {
					n = slides.length - 1;
				}
				moveSlideAnimClass.forCurrent = "moveRightCurrentSlide";
				moveSlideAnimClass.forNext = "moveRightPrevSlide";
				slideTextAnimClass = "slideTextFromBottom";
			}

			if (n != slideIndex) {
				next = slides[n];
				current = slides[slideIndex];
				for (i = 0; i < slides.length; i++) {
					slides[i].className = "imageHolder";
					slides[i].style.opacity = 0;
					dots[i].classList.remove("active");
				}
				current.classList.add(moveSlideAnimClass.forCurrent);
				next.classList.add(moveSlideAnimClass.forNext);
				dots[n].classList.add("active");
				slideIndex = n;
				captionText.style.display = "none";
				captionText.className = "captionText " + slideTextAnimClass;
				captionText.innerText = slides[n].querySelector(".captionText").innerText;
				captionText.style.display = "block";
			}

		}
		var timer = null;
		function setTimer() {
			timer = setInterval(function() {
				plusSlides(1);
			}, 3000);
		}
		setTimer();
		function playPauseSlides() {
			var playPauseBtn = document.getElementById("playPause");
			if (timer == null) {
				setTimer();
				playPauseBtn.style.backgroundPositionY = "0px"
			} else {
				clearInterval(timer);
				timer = null;
				playPauseBtn.style.backgroundPositionY = "-33px"
			}
		}
	</script>
</body>
</html>
<script>
	var slideIndex, slides, dots, captionText;
	function initGallery() {
		slideIndex = 0;
		slides = document.getElementsByClassName("imageHolder");
		slides[slideIndex].style.opacity = 1;

		captionText = document.querySelector(".captionTextHolder .captionText");
		captionText.innerText = slides[slideIndex]
				.querySelector(".captionText").innerText;

		//disable nextPrevBtn if slide count is one
		if (slides.length < 2) {
			var nextPrevBtns = document.querySelector(".leftArrow,.rightArrow");
			nextPrevBtns.style.display = "none";
			for (i = 0; i < nextPrevBtn.length; i++) {
				nextPrevBtn[i].style.display = "none";
			}
		}

		//add dots
		dots = [];
		var dotsContainer = document.getElementById("dotsContainer"), i;
		for (i = 0; i < slides.length; i++) {
			var dot = document.createElement("span");
			dot.classList.add("dots");
			dotsContainer.append(dot);
			dot.setAttribute("onclick", "moveSlide(" + i + ")");
			dots.push(dot);
		}
		dots[slideIndex].classList.add("active");
	}
	initGallery();
	function plusSlides(n) {
		moveSlide(slideIndex + n);
	}
	function moveSlide(n) {
		var i;
		var current, next;
		var moveSlideAnimClass = {
			forCurrent : "",
			forNext : ""
		};
		var slideTextAnimClass;
		if (n > slideIndex) {
			if (n >= slides.length) {
				n = 0;
			}
			moveSlideAnimClass.forCurrent = "moveLeftCurrentSlide";
			moveSlideAnimClass.forNext = "moveLeftNextSlide";
			slideTextAnimClass = "slideTextFromTop";
		} else if (n < slideIndex) {
			if (n < 0) {
				n = slides.length - 1;
			}
			moveSlideAnimClass.forCurrent = "moveRightCurrentSlide";
			moveSlideAnimClass.forNext = "moveRightPrevSlide";
			slideTextAnimClass = "slideTextFromBottom";
		}

		if (n != slideIndex) {
			next = slides[n];
			current = slides[slideIndex];
			for (i = 0; i < slides.length; i++) {
				slides[i].className = "imageHolder";
				slides[i].style.opacity = 0;
				dots[i].classList.remove("active");
			}
			current.classList.add(moveSlideAnimClass.forCurrent);
			next.classList.add(moveSlideAnimClass.forNext);
			dots[n].classList.add("active");
			slideIndex = n;
			captionText.style.display = "none";
			captionText.className = "captionText " + slideTextAnimClass;
			captionText.innerText = slides[n].querySelector(".captionText").innerText;
			captionText.style.display = "block";
		}

	}
	var timer = null;
	function setTimer() {
		timer = setInterval(function() {
			plusSlides(1);
		}, 3000);
	}
	setTimer();
	function playPauseSlides() {
		var playPauseBtn = document.getElementById("playPause");
		if (timer == null) {
			setTimer();
			playPauseBtn.style.backgroundPositionY = "0px"
		} else {
			clearInterval(timer);
			timer = null;
			playPauseBtn.style.backgroundPositionY = "-33px"
		}
	}
</script>