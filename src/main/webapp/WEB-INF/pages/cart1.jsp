<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<meta charset="utf-8">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
 
<title>VeggieFridge</title> 
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
<link rel="canonical"
	href="https://webdevtrick.com/responsive-shopping-cart-page/" />
<link rel="stylesheet" href="style.css">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="main.css">
<!-- font awesome -->
<script src="https://kit.fontawesome.com/dbed6b6114.js"
	crossorigin="anonymous"></script>
	
<style>

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
	width: 10%;
}

.product-quantity {
	float: left;
	width: 25%;
}

.product-removal {
	/* float: left;
	width: 2%; */
	float:left;
	width: 16%;
	text-align: right;
	margin-top:40px;
}

.product-line-price {

	/* float: left;
	width: 18%;
	text-align: right; */
	float: left;
	width: 4%;
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
	margin-top:500px;
	max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;
}

/* Column headers */
.column-labels label {
	padding-bottom: 20px;
	margin-bottom: 20px;
	border-bottom: 1px solid #eee;
	max-width:1388px;
	margin: 0 auto;
}

.column-labels .product-image, .column-labels .product-details,
	.column-labels .product-removal {
	text-indent: -9999px;
}

/* Product entries */
.product {
	/* margin-bottom:10px;
	padding-bottom: 10px; */
	border-bottom: 1px solid #eee;
}

.product .product-image {
	text-align: center;
}

.product .product-image img {
	width: 100px;
	height:100px;
}

.product .product-details .product-title {
	margin-right: 20px;
	font-family: 'Quicksand', sans-serif;
	margin-top:20px;
}

.product .product-details .product-description {
    margin: 5px 20px 5px 0; 
	line-height: 1.4em;
}

.product .product-quantity input {
	width: 40px;
	margin-top:20px;
}

.product .remove-product {
	border: 0;
	padding: 4px 8px;
	background-color: #ff4242;
	color: #fff;
	/* font-family: "HelveticaNeue-Medium", "Helvetica Neue Medium"; */
	font-size: 14px;
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
    width: 77%; 
	text-align: right;
}

.totals .totals-item .totals-value {
	float: left;
  /*   width:%; */
	text-align:right;
}

.totals .totals-item-total {
	font-family: 'Quicksand', sans-serif;
}

.checkout {
	float: right;
	border: 0;
	/* margin-top: 20px; */
	/* padding: 6px 25px; */
	background-color:#4CAF50;
	color: #fff;
	font-size:15px;
	border-radius: 3px;
	 padding:10px 35px;
}
.checkout:hover {
	background-color: #019701;
}

/* Make adjustments for tablet */
@media screen and (max-width: 700px) {
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
		/* margin-bottom: 10px; */
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
		/* margin-left: 10px; */
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
@media screen and (max-width: 300px) {
	.product-removal {
		float: right;
	}
	.product-line-price {
		float: right;
		clear: left;
		width: auto;
		/* margin-top: 10px; */
	}
	.product .product-line-price:before {
		content: 'Item Total: $';
	}
	.totals .totals-item label {
		width: 50%;
	}
	.totals .totals-item .totals-value {
		width: 50%;
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
.alert {
  padding:15px;
  background-color: #f44336;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
   text-align: center;
     letter-spacing:2px;
    cursor: pointer;
    font-weight: bold;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
.mycart {

    font-size: 1.0rem; 
    font-weight: 100;
    text-align: center; 
    padding: 1.3rem 0;
    opacity: 0.9; 
}
.jumbotron{
max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;

}
.qty{
width:35px;
height:30px
}
 </style>
 </head>
 
 <body>
 
	 <%-- <jsp:include page="userheader.jsp"/> --%>
	 
	<jsp:include page="mainheader.jsp" /> 
	
	<c:choose>
	<c:when test="${not empty listcustomercartitem}">

    <div class="shopping-cart" style="margin-top:25px;">
    
    <span style="font-size:1.5rem; 
    font-weight: 200;
    text-align: center; 
    padding: 1.3rem 0;
    opacity: 0.9;"> My Cart </span>
		
	<%-- <c:if test="${not empty message}">
	<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong></strong> ${message}.
  </div>
	</c:if> --%>
			    <div class="column-labels">
				<label class="product-image">Image</label> 
			    <label class="product-details">Product</label> 
				<label class="product-price">Price</label> 	
				<label class="product-quantity">Quantity</label>	
				<label class="product-line-price">SubTotal</label>  
			    <label class="product-removal">Remove</label> 
			    </div>
			
				<c:set var="s" value="0"></c:set>
				<c:forEach var="cartitem" items="${listcustomercartitem}">
					<%-- <c:set var="s"
						value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>
 --%>
<c:set var="s"><fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}" /></c:set>

					<div class="product">
						<div class="product-image">
							<spring:url value="/images" var="images"/> <img
								src="${images}/${cartitem.product.imageName}" width="100" height="100"/>
						</div>
						<div class="product-details">
							<div class="product-title">${cartitem.product.productName}</div>
							<p class="product-description">Size: ${cartitem.product.size} ${cartitem.product.unit}</p>
						</div>
				   <div class="product-price" style="margin-top:40px;">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}"/></div>
				   
				   
				   <div class="product-quantity" style="margin-top:20px;">
<a href="${pageContext.request.contextPath}/cart/increase/${cartitem.cartitemid}">			   
<button class ="qty">+</button></a>
<input id=demoInput type=text min=1 max=9 class = "number" value="${cartitem.productCount}" style="text-align: center;width:35px;height:30px;">
<a href="${pageContext.request.contextPath}/cart/decrease/${cartitem.cartitemid}">
<button onclick="decrement()" class = "qty">-</button>
</a>
							<%-- <input type="number" value="${cartitem.productCount}" min="1"> --%>
						</div>
						<%--  <div class="product-removal">
							<button class="remove-product" onclick="window.location.href='${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}'"><i class="fa fa-trash"></i></button>
						</div> --%>
						<%-- <div class="product-line-price">${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</div> --%>
	             <%--  <div class="product-line-price"><fmt:formatNumber type="number" maxFractionDigits="2" value="${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}"/></div> --%>
					
				<div class="product-line-price" style="margin-top:40px;">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${cartitem.productCount*cartitem.total}"/></div>
				
				<div class="product-removal">
							<button class="remove-product" onclick="window.location.href='${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}'"><i class="fa fa-trash"></i></button>
						</div>	
					</div>
				</c:forEach>

		<div style="margin-bottom:20px;margin-top:20px;">
			
	    <a href="${pageContext.request.contextPath}/cart/home" style="display: inline-block;
        padding: 8px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:orange;
        border-radius: 6px;
        outline: none;font-size:15px;">Continue Shopping</a>
        
        <span style="margin-left:63%;">Total: &#8377;${s}</span>
        
        <button class="checkout" onclick="window.location.href='${pageContext.request.contextPath}/order/PickupAddress'">Checkout</button>
        </div>	
		</div>
		
		</c:when>
		
		<c:otherwise>

		<div class="jumbotron">
			<h3 class="text-center" style="margin-top:35px;">Your Cart is Empty!</h3>
			<hr>
			<a href="${pageContext.request.contextPath}/home" style="display: inline-block;
        padding:8px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:orange;
        border-radius: 6px;
        outline: none;font-size:15px;margin-top:30px;margin-bottom:20px;">Continue Shopping</a>
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
	
	
	
	
<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>

<script>
   function increment() {
      document.getElementById('demoInput').stepUp();
   }
   function decrement() {
      document.getElementById('demoInput').stepDown();
   }
</script>


<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/app.js"></script>
   <script>
    $(document).ready(function(){
   $('.food-slider').slick({
      autoplay:true,
     slidesToShow:3,
     slidesToScroll:1,
     prevArrow:".prev-btn",
     nextArrow:".next-btn",
     responsive:[
        {
           breakpoint:992,
           settings:{
            slidesToShow:2,
           }
        },
        {
         breakpoint:768,
         settings:{
          slidesToShow:1,
         }
      }
     ]

   });

   $('.nav-trigger').click(function(){
      $('.site-content-wrapper').toggleClass('scaled');
   })
});
       </script>
       
      <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable ").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script> 

<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/app.js"></script>
   <script>
    $(document).ready(function(){
   $('.food-slider').slick({
      autoplay:true,
     slidesToShow:3,
     slidesToScroll:1,
     prevArrow:".prev-btn",
     nextArrow:".next-btn",
     responsive:[
        {
           breakpoint:992,
           settings:{
            slidesToShow:2,
           }
        },
        {
         breakpoint:768,
         settings:{
          slidesToShow:1,
         }
      }
     ]

   });

   $('.nav-trigger').click(function(){
      $('.site-content-wrapper').toggleClass('scaled');
   })
});
       </script>
	

</body>
</html>