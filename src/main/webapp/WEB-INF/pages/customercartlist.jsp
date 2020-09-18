<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  
  
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
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
<title>Insert title here</title>
</head>
<body style="height:50%;width:50%;">
<c:set var="availableCount" value="${customer.cartpage.cartitem}" />
<div class="container">
	
	        <c:choose>
		    <c:when test="${not empty listcustomercartitem}">
	       <table border="2" >
<tr>
<th>Options</th>
<th >Id</th>
<th>Photo</th>
<th >Name</th>
<th >Price</th>
<th >Quantity</th>
<th >Sub Total</th>
</tr>
<c:set var="s" value="0"></c:set>
<c:forEach var="cartitem" items="${listcustomercartitem}">
<c:set var="s" value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>
<tr>
<td><a href="${pageContext.request.contextPath}/cart/deleteCartItems/${cartitem.cartitemid}">Remove</a></td>
<td>${cartitem.cartitemid }</td>

<td>
<spring:url value="/images" var="images"/>
<img src="${images}/${cartitem.product.imageName}" class="product-frame" style="width:40%;"/>
</td>

<td>${cartitem.product.productName }</td>
<td>${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100}</td>
<td>${cartitem.product.quantity}</td>
<td>${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100*cartitem.product.quantity}</td>
</tr>
</c:forEach>
<tr><td colspan="6" align="right">Total</td>
<td>${s}</td>
GrandTotal:${userModel.cart.grandTotal}

</tr>
</table>
 <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">Continue Shopping</a>
        <div class="summary-checkout">
         <a href="${pageContext.request.contextPath }/cart/listCartItem" style="display: inline-block;
        padding: 15px 85px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:10px;">CheckOut</a>
		</c:when>
		<c:otherwise>
			
			<div class="jumbotron">
				
				<h3 class="text-center">Your Cart is Empty!</h3>
			
			</div>
		
		</c:otherwise>
	</c:choose>




</div>

</body>
</html>