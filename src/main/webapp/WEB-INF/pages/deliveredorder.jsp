<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
	<meta charset="UTF-8">
	<title>List and Gird view using Javascript</title>
	<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
	<style>
    @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap');

*{
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.view_item img{
	width: 75px;
}

.wrapper{
	width: 1200px;
	margin: 20px auto;
	
}

.links{
	margin-bottom: 25px;
	background: #fff;
	padding: 15px;
	border-radius: 3px;
}

.links ul{
	display: flex;
	justify-content: center;
}

.links ul li{
	margin: 0 15px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-size: 20px;
	cursor: pointer;
}

.links ul li:hover,
.links ul li.active{
	color: #4abd3e;
}

.view_main{
	background:#f5f5f5;
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

.list-view .view_item:last-child{
	margin-bottom: 0;
}

.list-view .view_item .vi_left{
	margin-right: 25px;
}

.view_item .title{
	font-weight: 600;
}

.view_item .content{
	margin: 5px 0;
	font-size: 14px;
	line-height: 22px;
	font-weight: 200;
}

.view_item .btn{
	width: 125px;
	background: #4abd3e;
	padding: 8px 5px;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	font-weight: 200;
	cursor: pointer;
}

.view_item .btn:hover{
	background: #3bd62b;
}

.grid-view{
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

.grid-view .view_item .vi_left{
	margin-bottom: 10px;
}

.grid-view .view_item .btn{
	margin: 0 auto;
}
    
    
    </style>
    
</head>
<body>
<jsp:include page="mainheader.jsp"></jsp:include>
<div style="border:1 px green;background-color:white;margin-top:20px;font-weight: bold;color: green;font-size:25px;width: 1200px;margin: 0 auto;font-weight:500px;">My Order</div>

<c:forEach var="orders" items="${requestScope.deliveredOrders}">
<div class="wrapper">
	  <div class="view_main">
	   <h4>${orders.pickupStatus}</h4>${orders.orderDate}
	<h4>Total: &#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${orders.orderTotal}"/></h4>
		<div class="view_wrap list-view" style="display: block;">
			
			
			<c:forEach var="orderitem" items="${requestScope.orderitems[orders.orderid]}">
			<div class="view_item">
				<div class="vi_left">
				  <spring:url value="/images" var="images" />
   <img src="${images}/${orderitem.product.imageName}"  alt="tomato"/>
					<!-- <img src="tomato.png" alt="tomato"> -->
				</div>
				<div class="vi_right">
					<p class="title">${orderitem.product.productName}</p>
					<p class="content">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aperiam impedit, veniam! Voluptate a impedit animi!</p>
					<p class="content">${orderitem.product.price}</p>
					<a href="#" style="color: green;">Review</a>
					<!-- <div class="btn">Review</div> -->
				</div>
			</div>
			</c:forEach>
			
			<div class="btn" style="width: 125px;
	background: #4abd3e;
	padding: 8px 5px;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	font-weight: 200;
	cursor: pointer;margin-left:20px;">ShowAll</div>
		</div>
		
	</div>
	
</div>
</c:forEach>

<jsp:include page="footer.jsp"></jsp:include>
	


</body>
</html>