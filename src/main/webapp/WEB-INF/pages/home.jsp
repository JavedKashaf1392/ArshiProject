<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>VeggieFridge</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/VeggieFridge.ico" type="image/x-icon">
<!-- <link href="./static/css/main.css" rel="stylesheet" type="text/css"> -->

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<!-- <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script> -->
<spring:url var="css" value="/resources/css"></spring:url>

<link href="${css}/main.css" rel="stylesheet">

<!-- <script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
	
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>	 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;

.product-col-left {
	background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3)),
		url("images/milk image.jpg") center/cover no-repeat;
}

.product-col-r-top {
	background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3)),
	url("images/vegetables.jpg") center/cover no-repeat;
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
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 80%;
}
</style>
</head>
<body>

  <div id="myModal" class="modal">
  Modal content
  <div class="modal-content">
  <p id="response"></p>
  </div>
  </div>

	<!-- ............ Header.......... -->
	<jsp:include page="header.jsp"></jsp:include>


	<!-- ..........Advertisement image.............. -->
	<header class="${classvalue}" style="background-image:${blurimage};"
		id="div1">
		<div class="container">
			<div class="welcome flex items-center">
				<span>Welcome to</span>
				<spring:url value="/images" var="images" />
				<img src="${images}/logo2.jpg" width="200" height="50" alt="" />
			</div>
			<h1>
				Identify The True <span>Taste of</span> Nutritions
			</h1>
			<p>VeggieFridge, enhances you with deep nourishing thoughts of
				not only being healthy but keeping you contracted against hygienic
				nutritional values. . . . . . .</p>
			<div>
				<button class="btn btn-primary"
					onclick="window.location.href='${pageContext.request.contextPath}/VFAbout'">Read
					More</button>
				<button class="btn btn-secondary"
					onclick="window.location.href='${pageContext.request.contextPath}/shopNow'">Shop
					Now</button>
			</div>
			<div class="hero-image">
				<spring:url value="/images" var="images" />
				<img src="${images}/${animateimage}" alt="" />
			</div>
		</div>
	</header>


	<!-- Product Section -->
	<security:authorize access="isAnonymous() or hasRole('USER')">
		<div class="products">
			<div class="container" style="margin: 0 auto; max-width: 1388px;">
				<h1 class="lg-title">Fresh Vegetables And Milk</h1>
				<p class="text-light">Deliver to Your doorstep. All the products
					at an affordable price, Freshly harvested from local organic farmer
					, Take Expereince the freshness of healthy vegetables and milk and
					keep Yourself healthy.</p>

				<div class="product-items">
					<!--1. single product -->
					<c:forEach var="product" items="${listProduct}">
						<div class="product">
							<div class="product-content">
								<div class="product-img">
									<spring:url value="/images" var="images" />
									<img src="${images}/${product.imageName}" / width="100%"
										style="border-radius: 50%;">
								</div>
								<div class="product-btns">

				<%-- <form method="post" id="form">
				<input type="hidden" value="${product.productid}" name="productid" id="productid">
				<button type="submit" class="btn-cart" id="cart">
				add to cart <span><i class="fas fa-shopping-cart"></i></span>
				</button>
				</form> --%>
				
<button onClick="ShowModal(this)" data-id="${product.productid}" class="btn-cart">add to cart <span><i class="fas fa-shopping-cart"></i></span></button>		
				
							</div>
							</div>
							<div class="product-info" id="myTable" style="line-height: 28px;">
								<div class="product-info-top">
									<h2 class="product-title" style="color: black;">${product.productName}</h2>
									<div class="rating" style="color: orange;">
										<span><spring:url value="/images" var="images" /> <img
											src="${images}/star.png" alt="" height="15px" width="15px" /></span>
										<span><spring:url value="/images" var="images" /> <img
											src="${images}/star.png" alt="" height="15px" width="15px" /></span>
										<span><spring:url value="/images" var="images" /> <img
											src="${images}/star.png" alt="" height="15px" width="15px" /></span>
										<span><spring:url value="/images" var="images" /> <img
											src="${images}/star.png" alt="" height="15px" width="15px" /></span>
										<span><spring:url value="/images" var="images" /> <img
											src="${images}/star.png" alt="" height="15px" width="15px" /></span>
									</div>
								</div>
								<a href="#" class="product-name">${product.description}</a>
								<h4 class="size" style="color: black;">Size :
									${product.size} ${product.unit}</h4>
								MRP :
								<p class="product-price">${repee_sign}<fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${product.price}" />
								</p>
								
								
								
								<p class="product-price">${repee_sign}<fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${product.price-product.discount * product.price/100}" />
								</p>
						    <!-- <p id="response"></p> -->
							</div>

							<div class="off-info" style="background-color: #4CAF50;">
								<h2 class="sm-title">${product.discount}%off</h2>
							</div>
						</div>
					</c:forEach>
					<!--  end of single product -->
				</div>
			</div>
		</div>
		<div>
     </div>
	</security:authorize>


	<!--  ............... Shop By Category.............. -->
	<security:authorize access="isAnonymous() or hasRole('USER')">
		<div class="product-collection">
			<div class="container" style="margin: 0 auto; max-width: 1388px;">
				<h1 class="show-ad-title">Shop By Catogary</h1>
				<div class="product-collection-wrapper">
					<!-- product col left -->
					<div class="product-col-left flexx">
						<div class="product-col-content">
							<h2 class="sm-title">Fresh Milk</h2>
							<h2 class="md-title">Fresh Milk</h2>
							<p class="text-light">Lorem ipsum dolor sit, amet consectetur
								adipisicing elit. Molestiae consequatur facilis eligendi
								quibusdam voluptatibus exercitationem autem voluptatum, beatae
								architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
							<button type="button" class="btn-dark">Shop now</button>
						</div>
					</div>

					<!-- product col right -->
					<div class="product-col-right">
						<div class="product-col-r-top flexx">
							<div class="product-col-content">
								<h2 class="sm-title">Fruit Vegetables</h2>
								<h2 class="md-title">Fruit Vegetables</h2>
								<p class="text-light">Lorem ipsum dolor sit, amet
									consectetur adipisicing elit. Molestiae consequatur facilis
									eligendi quibusdam voluptatibus exercitationem autem
									voluptatum, beatae architecto odit, quisquam repellat.
									Deleniti, architecto ab.</p>
								<button type="button" class="btn-dark">Shop now</button>
							</div>
						</div>

						<div class="product-col-r-bottom">
							<!-- left -->
							<div class="flexx">
								<div class="product-col-content">
									<h2 class="sm-title">OFFERS</h2>
									<h2 class="md-title">Leafy Vegetables</h2>
									<p class="text-light">Lorem ipsum dolor sit, amet
										consectetur adipisicing elit. Molestiae consequatur facilis
										eligendi quibusdam voluptatibus exercitationem autem
										voluptatum, beatae architecto odit, quisquam repellat.
										Deleniti, architecto ab.</p>
									<button type="button" class="btn-dark">Shop now</button>
								</div>
							</div>
							<!-- right -->
							<div class="flexx">
								<div class="product-col-content">
									<h2 class="sm-title">Milk</h2>
									<h2 class="md-title">Milk</h2>
									<p class="text-light">Lorem ipsum dolor sit, amet
										consectetur adipisicing elit. Molestiae consequatur facilis
										eligendi quibusdam voluptatibus exercitationem autem
										voluptatum, beatae architecto odit, quisquam repellat.
										Deleniti, architecto ab.</p>
									<button type="button" class="btn-dark">Shop now</button>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</security:authorize>

	<!--  SLIDERCODE -->
	<security:authorize access="isAnonymous() or hasRole('USER')">
		<div class="galleryContainer">
			<div class="slideShowContainer">
				<div id="playPause" onclick="playPauseSlides()"></div>
				<div onclick="plusSlides(-1)" class="nextPrevBtn leftArrow">
					<span class="arrow arrowLeft"></span>
				</div>
				<div onclick="plusSlides(1)" class="nextPrevBtn rightArrow">
					<span class="arrow arrowRight"></span>
				</div>
				<div class="captionTextHolder">
					<p class="captionText slideTextFromTop"></p>
				</div>

				<c:forEach var="image" items="${headerImages}">
					<div class="imageHolder">
						<spring:url value="/images" var="images" />
						<img src="${images}/${image.imageUrl}" />1366X768
						<p class="captionText">${image.captionText}</p>
					</div>
				</c:forEach>
			</div>
			<div id="dotsContainer"></div>
		</div>
	</security:authorize>


	<!-- MANAGE  PRODUCT TABLE -->
	<security:authorize access="hasRole('ADMIN')">
		<div>
			<h2>
				<p style="color: green; text-align: center;">Manage Product</p>
			</h2>
		</div>

		<form metod="get" onsubmit="return checkCheckBoxes(this);">
			<table id="Table1" border="1" align="center" cellspacing="0"
				style="border: 1px solid #008000; text-align: center; margin-left: auto; margin-right: auto; border-collapse: collapse; width: 80%;">
				<tr>
					<th></th>
					<!--  <th>ProductId</th> -->
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;"></th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">ProductName</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Description</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Size</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Price</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Quantity</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Availability</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Category</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Discount</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Tax</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">FinalPrice</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">ImageName</th>
				</tr>
				<c:forEach var="product" items="${listProduct}">
					<tr>
						<td align="center" style="padding: 15px;"><input
							type="checkbox" class="checkboxId" name="productid"
							value="${product.productid}"></td>
						<td style="padding: 10px;"><spring:url value="/images"
								var="images" /> <img src="${images}/${product.imageName}"
							width="60" height="60" /></td>
						<td style="padding: 15px;">${product.productName}</td>
						<td style="padding: 15px;">${product.description}</td>
						<td style="padding: 15px;">${product.size}</td>
						<td style="padding: 15px;">${product.price}</td>
						<td style="padding: 15px;">${product.quantity}</td>
						<td style="padding: 15px;">${product.isAvailable}</td>
						<td style="padding: 15px;">${product.category}</td>
						<td style="padding: 15px;">${product.discount}</td>
						<td style="padding: 15px;">${product.tax}</td>
						<td style="padding: 15px;">${product.price-product.discount * product.price/100}</td>
						<td style="padding: 15px;">${product.imageName}</td>
					</tr>
				</c:forEach>
			</table>

			<div style="margin-top: 5px; align-content: center; margin-left: 27%">
				<input type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Add"
					formaction="${pageContext.request.contextPath}/product/newProduct"">

				<input type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Delete"
					formaction="${pageContext.request.contextPath}/product/deleteProduct"
					onclick="return confirm('Are you sure to delete?')"> <input
					type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Edit"
					formaction="${pageContext.request.contextPath}/product/editProduct">
			</div>
		</form>
	</security:authorize>

	<!--  VeggeiFridge Services Content -->
	<security:authorize access="isAnonymous() or hasRole('USER')">

		<!--   VeggieFridge Services Section -->
		<section class="our-services">
			<div class="container">
				<h1 class="section-heading">Our services</h1>
				<div class="card-wrapper flex">
					<div class="service-card magic-shadow-sm">
						<spring:url value="/images" var="images" />
						<img src="${images}/transport.svg" alt="" />
						<h2>Free Home delivery</h2>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
						<button class="btn btn-secondary">Read More</button>
					</div>
					<div class="service-card magic-shadow-sm">
						<spring:url value="/images" var="images" />
						<img src="${images}/bag.svg" alt="" />
						<h2 class="text-primary">30 Days ReturnServices</h2>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
						<button class="btn btn-primary">Read More</button>
					</div>
					<div class="service-card magic-shadow-sm">
						<spring:url value="/images" var="images" />
						<img src="${images}/usd.svg" alt="" />
						<h2>Money Back Guaranted</h2>
						<p>Lorem Ipsum is simply dummy text of the printing and
							typesetting industry.</p>
						<button class="btn btn-secondary">Read More</button>
					</div>
				</div>
			</div>
		</section>

		<!--  VeggeiFridge Big-deal section -->
		<section class="big-deal" id="div2">
		
		<div class="container">
				<h1 class="section-heading text-pure">Big Deals of the Week</h1>
				<div class="timer">
					<div>
						<span>02</span> <span>Days</span>
					</div>
					<div>
						<span>24</span> <span>Hours</span>
					</div>
					<div>
						<span>55</span> <span>Minutes</span>
					</div>
					<div>
						<span>58</span> <span>Seconds</span>
					</div>
				</div>
			</div>
		</section>

		<!-- Lastest News from Blog section -->

		<section class="latest-news" id="div3">
			<div class="container">
				<h1 class="section-heading">Lastest News from Blog</h1>
				<div class="article-wrapper">
					<article class="card magic-shadow-sm">
						<div>
							<spring:url value="/images" var="images" />
							<img src="${images}/vegetables.jpg" alt="" />
						</div>
						<div class="card-content">
							<div class="post-meta flex items-center justify-between">
								<span>July 03, 2017</span>
								<div>
									<span>Posted by <strong>FreshMeal</strong></span> <span
										class="comment-count">12 Comments</span>
								</div>
							</div>

							<h2>Lorem Ipsum is simply dummy text of the printing</h2>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum is that it has a more
								letters.</p>
						</div>
					</article>
					<article class="card magic-shadow-sm">
						<div>
							<spring:url value="/images" var="images" />
							<img src="${images}/veggieimage6.png" alt="" />
						</div>
						<div class="card-content">
							<div class="post-meta flex items-center justify-between">
								<span>July 03, 2017</span>
								<div>
									<span>Posted by <strong>FreshMeal</strong></span> <span
										class="comment-count">12 Comments</span>
								</div>
							</div>

							<h2>Lorem Ipsum is simply dummy text of the printing</h2>
							<p>It is a long established fact that a reader will be
								distracted by the readable content of a page when looking at its
								layout. The point of using Lorem Ipsum is that it has a more
								letters.</p>
						</div>
					</article>
				</div>
				<div class="text-center btn-wrapper">
					<button class="btn btn-secondary">View All</button>
				</div>
			</div>
		</section>

		<!-- subscribe newsletter -->

		<section class="subscribe">
			<div class="container flex items-center">
				<div>
					<spring:url value="/images" var="images" />
					<img src="${images}/veggieimage5.png" alt="" height="220"
						width="150" />
				</div>
				<div>
					<h1 style="color: white">Subscribe to your newsletter</h1>
					<p style="color: white">Lorem Ipsum as their default model
						text, and a search for 'lorem ipsum' will uncover many web sites
						still in their infancy.</p>
					<div class="input-wrap">
						<input type="email" placeholder="support@veggiefridge.com">
						<button>Subscribe</button>
					</div>
				</div>
			</div>
		</section>
	</security:authorize>


	<!--  .................. footer............-->
	<jsp:include page="footer.jsp"></jsp:include>


	<!-- .............Java Script..............-->
	
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

<script>
// Get the modal
var modal = document.getElementById("aModal");

// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("aclose")[0];

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

<script type="text/javascript">

function ShowModal(elem) {
	
    var dataId = $(elem).data("id");
    alert(dataId);
    $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "${pageContext.request.contextPath }/cart/addToCart?productid="+dataId,
    dataType: 'html',
    success: function(data) {
    $('#response').addClass("alert alert-success").html(''+data);
    $('#dataId').trigger("reset");
    setTimeout(function() {
			/*$('#mydiv').fadeOut('fast'); */
			$('#response').delay(300).show().fadeOut(3000);
		}, 500); 
        alert(data);
                    
},
    error: function (e) {
     $('#response').addClass("alert alert-success").html('Error:::::'+data);
                $('#dataId').trigger("reset");
    },
});  
}

function ShowModal1(elem){
  
    var dataId = $(elem).data("id");
    alert(dataId); 
    $.ajax({
    type: "DELETE",
    contentType: "application/json",
    
    url: "deletebatchs?ids="+dataId,
    dataType: 'html',
    success: function(data) {
     $('#response').addClass("alert alert-success").html('Your '+data);
                $('#dataId').trigger("reset");
                 window.location.reload();
                    alert(data);
 },
    error: function (e) {
     $('#response').addClass("alert alert-success").html('Error:::::'+data);
                $('#dataId').trigger("reset");
    },
     
});  

}
</script>
 
<script type="text/javascript" src="./static/css/main.js"></script>
</body>
</html>