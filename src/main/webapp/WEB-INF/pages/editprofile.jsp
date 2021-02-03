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
 
<title>Online Vegetable And Milk Shopping in India-VeggieFridge</title> 
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
.contain{
background-color:#EEE; 
height:600px;
margin-bottom:15px;
margin-top:30px;

}


 </style>
 </head>
 
 <body>
 
	 <%-- <jsp:include page="userheader.jsp"/> --%>
	 
	<jsp:include page="mainheader.jsp" /> 
	
	<div class="contain">
 
  <div class="center" style="margin-left: 200px;
  padding: 1px 16px;
  height: 700px;
  margin-left:40%; background-color: white;margin-right:7%;">
  
  <h3>Edit Profile Details </h3>
  <hr>
   <div style="border:1px solid #ddd;padding: 50px 50px;">
   <form:form action="${pageContext.request.contextPath}/cart/saveEditProfile" method="post" modelAttribute="customer">
        <table>
          <form:hidden path="customerid"/>
            <tr>
                 <td>First Name: <span style="color: red;">*</span> </td>
                 <td><form:input path="firstName"/><form:errors path="firstName" cssClass="error"/></td>
            </tr>
             <tr>
                <td>Last Name: <span style="color: red;">*</span>  </td>
                <td><form:input path="lastName"  /><form:errors path="lastName" cssClass="error"/></td>
            </tr>
            <tr>
                <td>Mobile: <span style="color: red;">*</span></td>
                <td><form:input path="mobile" /></td>
                <td><form:errors path="mobile" cssClass="error" /></td> 
            </tr>
            
            <tr>
                <td>City: <span style="color: red;">*</span>  </td>
                <td><form:input path="cities" /></td>
                <td><form:errors path="cities"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>KIOSK Location: <span style="color: red;">*</span>  </td>
                <td><form:input path="location" /></td>
                <td><form:errors path="location"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Email: <span style="color: red;">*</span>  </td>
                <td><form:input path="email" /></td>
                <td><form:errors path="email" cssClass="error"/></td> 
            </tr>
           
           </table><br>
       <div class="row" style="margin-top:%;">
      <input type="submit" value="SAVE CHANGES">
      <input type="reset" value="CANCEL" style=" background-color: #4CAF50;
  color: white;
  padding: 10px 14px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top:10px;">
    </div>
          
        </form:form>
        </div>
    </div>
	

	
	<jsp:include page="footer.jsp"></jsp:include>
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