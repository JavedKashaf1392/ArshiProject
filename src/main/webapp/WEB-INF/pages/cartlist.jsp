  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 
  
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta charset="ISO-8859-1">
   <meta charset="utf-8">
	 <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> 
	</script> 
	
	<script src= 
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"> 
	</script> 
	<script src= 
"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.0/js/all.min.js"> 
    	</script>    
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home screen of VeggieFridge</title>
        <script>document.getElementsByTagName("html")[0].className += " js";</script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
 
<style>
 
input,
button,
.basket,
.basket-module,
.basket-labels,
.item,
.price,
.quantity,
.subtotal,
.basket-product,
.product-image,
.product-details {
  float: left;
}

.price:before,
.subtotal:before,
.subtotal-value:before,
.total-value:before,
.promo-value:before {
  content: ;
}

.hide {
   display: none;
}

main{
  clear: both;
  font-size:0.75rem;
  margin: 0 auto; */
  overflow: hidden; */
  padding: 1rem 0; */
  width:500px;
} 

.basket,
aside {
  padding: 0 1rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket {
  width:40%;
}

.basket-module {
  color: #111;
}

label {
  display: block;
  margin-bottom: 0.3125rem;
}

 .promo-code-field {
  border: 1px solid #ccc;
 /*  padding: 0.5rem; */
  text-transform: uppercase;
  transition: all 0.2s linear;
  width:20%;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -o-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.promo-code-field:hover,
.promo-code-field:focus {
  border: 1px solid #999;
}

.promo-code-cta {
  border-radius: 4px;
  font-size: 0
  .625rem;
  margin-left: 0.625rem;
  padding: 0.6875rem 1.25rem 0.625rem;
}

.basket-labels {
  border-top: 1px solid #4CAF50;
  border-bottom: 1px solid #4CAF50;
  margin-top: 1.625rem;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  color: #111;
  display: inline-block;
  padding: 0.200rem 0;
}

li.price:before,
li.subtotal:before {
  content: '';
}

.item {
  width:55%;
}

.price,
.quantity,
.subtotal {
  width: 15%;
}

.subtotal{
  text-align: right;
}

 .remove {
  margin-left:95%;
  margin-top: 10%;
  font-size:15px;
}

.remove button {
  background-color: transparent;
  color: #777;
  float: none;
  text-decoration: underline;
  text-transform: uppercase;
}

.item-heading {
  padding-left: 4.375rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket-product {
  border-bottom: 1px solid #4CAF50;
  padding: 1rem 0;
  position: relative;
}
.product-image {
  width: 30%;
}
.product-details {
  width: 65%;
}

.product-frame {
 /*  border: 1px solid #aaa; */
}
.quantity-field {
  background-color: ;
  border: 1px solid #4CAF50; 
  border-radius: 4px;
  font-size: 0.625rem;
  padding: 2px;
  width: 3.75rem;
}
/* The Modal (background) */
.pagecart{
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  /* overflow: auto; /* Enable scroll if needed */
 /*  background-color: rgb(0,0,0); */ /* Fallback color */
  /* background-color: rgba(0,0,0,0.4); */ /* Black w/ opacity */ 
  padding-top: 60px;
}

/* Modal Content/Box */
.pagecart-content{
 /*   #f1f1f1  #fefefe */
  background-color: #fefefe;
  margin: 3% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
 /*  border: 1px solid #888; */
 width:80%; /* Could be more or less, depending on screen size */
}
}

</style>
</head>
<body>
<h2></h2>
<a href="#" style="display:inline-block;
        padding: 8px 18px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px" onclick="document.getElementById('id08').style.display='block'"><i class="fa fa-shopping-cart"></i>Cart</a> 
        
  <div id="id08" class="pagecart">
  <div class="pagecart-content">
  <div class="basket">
        
          <div class="basket-labels" style="background-color:#4CAF50;width:101%;padding:0px 7px;">
          <ul>
          <li class="item item-heading" style="color:white;font-size:16px;">Item</li>
          <li class="price" style="color: white;font-size:16px;">Price</li>
      
          <li class="quantity" style="color:white;font-size:16px;">Quantity</li>
          <li class="subtotal" style="color: white;font-size:16px;">Subtotal</li>
          </ul>
         </div> 

<c:set var="s" value="0"></c:set>
<c:forEach var="cartitem" items="${listcartitem}">

<c:set var="s" value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>
      <div class="basket-product" style="background-color:white; width:101%;padding:15px 7px;">
      <div class="item">

 <div class="product-image">
<spring:url value="/images" var="images"/>
<img src="${images}/${cartitem.product.imageName}" class="product-frame" style="width:80%;"/>
</div>
            <div class="product-details" style="background-color:white;">
            <h1 style="color: red;"><strong></span></strong>${cartitem.product.productName}</h1><!-- <span class="item-quantity"> -->
            <p><strong>${cartitem.product.productName},${cartitem.product.size}</strong></p>
            </div>
            </div>
        
      <!--   &#8377; -->
        <div class="price" style="ba">${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</div>
        <div class="quantity">
        <input type="number" value="${cartitem.product.quantity}" class="quantity-field">
        </div>
        
<%-- <div class="quantity">
<input type="button" onclick="decrementValue()" value="-" />
<input type="text"  name="quantity" id="number" class="quantity-field" value="${item.product.quantity}" />
<input type="button" onclick="incrementValue()" value="+" />
</div> --%>
        
      <div class="subtotal">${cartitem.product.price-cartitem.product.discount * cartitem.product.price/100}</div>
      
      <div class="remove">
      <a href="${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}" onclick="return confirm('Are you sure to delete?')"><i class="fa fa-trash" style="color:green;padding:15px 15 px;margin-left:10" title="remove product"></i></a>
      </div>
      </div>
      </c:forEach>
      <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoratio
        n: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">Continue Shopping</a>
         
         <a href="${pageContext.request.contextPath}/cart/listCartItem" style="display: inline-block;
        padding: 15px 85px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:10px;">CheckOut</a>
     
      </div>
      </div>
      </div>
    

<script>
// Get the modal
var pagecart = document.getElementById('id08');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == pagecart) {
    	pagecart.style.display = "none";
    }
}
</script>


 <script>
 /* Set values + misc */
var promoCode;
var promoPrice;
var fadeTime = 300;

/* Assign actions */
$('.quantity input').change(function() {
  updateQuantity(this);
});

$('.remove button').click(function() {
  removeItem(this);
});

$(document).ready(function() {
  updateSumItems();
});

$('.promo-code-cta').click(function() {

  promoCode = $('#promo-code').val();

  if (promoCode == '10off' || promoCode == '10OFF') {
    //If promoPrice has no value, set it as 10 for the 10OFF promocode
    if (!promoPrice) {
      promoPrice = 10;
    } else if (promoCode) {
      promoPrice = promoPrice * 1;
    }
  } else if (promoCode != '') {
    alert("Invalid Promo Code");
    promoPrice = 0;
  }
  //If there is a promoPrice that has been set (it means there is a valid promoCode input) show promo
  if (promoPrice) {
    $('.summary-promo').removeClass('hide');
    $('.promo-value').text(promoPrice.toFixed(2));
    recalculateCart(true);
  }
});

/* Recalculate cart */
function recalculateCart(onlyTotal) {
  var subtotal = 0;

  /* Sum up row totals */
  $('.basket-product').each(function() {
    subtotal += parseFloat($(this).children('.subtotal').text());
  });

  /* Calculate totals */
  var total = subtotal;

  //If there is a valid promoCode, and subtotal < 10 subtract from total
  var promoPrice = parseFloat($('.promo-value').text());
  if (promoPrice) {
    if (subtotal >= 10) {
      total -= promoPrice;
    } else {
      alert('Order must be more than £10 for Promo code to apply.');
      $('.summary-promo').addClass('hide');
    }
  }

  /*If switch for update only total, update only total display*/
  if (onlyTotal) {
    /* Update total display */
    $('.total-value').fadeOut(fadeTime, function() {
      $('#basket-total').html(total.toFixed(2));
      $('.total-value').fadeIn(fadeTime);
    });
  } else {
    /* Update summary display. */
    $('.final-value').fadeOut(fadeTime, function() {
      $('#basket-subtotal').html(subtotal.toFixed(2));
      $('#basket-total').html(total.toFixed(2));
      if (total == 0) {
        $('.checkout-cta').fadeOut(fadeTime);
      } else {
        $('.checkout-cta').fadeIn(fadeTime);
      }
      $('.final-value').fadeIn(fadeTime);
    });
  }
}


/* Update quantity */
function updateQuantity(quantityInput) {
  /* Calculate line price */
  var productRow = $(quantityInput).parent().parent();
  var price = parseFloat(productRow.children('.price').text());
  var quantity = $(quantityInput).val();
  var linePrice =price*quantity;
  
  /* Update line price display and recalc cart totals */
  productRow.children('.subtotal').each(function() {
    $(this).fadeOut(fadeTime, function() {
      $(this).text(linePrice.toFixed(2));
      recalculateCart();
      $(this).fadeIn(fadeTime);
    });
  });
  productRow.find('.item-quantity').text(quantity);
  updateSumItems();
}
function updateSumItems() {
  var sumItems = 0;
  $('.quantity input').each(function() {
    sumItems += parseInt($(this).val());
  });
  $('.total-items').text(sumItems);
}

/* Remove item from cart */
function removeItem(removeButton) {
  /* Remove row from DOM and recalc cart total */
  var productRow = $(removeButton).parent().parent();
  productRow.slideUp(fadeTime, function() {
    productRow.remove();
    recalculateCart();
    updateSumItems();
  });
}
    </script>
    
    
<script type="text/javascript">
function incrementValue()
{
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    if(value<10){
        value++;
            document.getElementById('number').value = value;
    }
}
function decrementValue()
{
    var value = parseInt(document.getElementById('number').value, 10);
    value = isNaN(value) ? 0 : value;
    if(value>1){
        value--;
            document.getElementById('number').value = value;
    }

}
</script>
</body>
</html>