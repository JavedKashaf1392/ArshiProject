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
	<title>VeggieFridge</title>
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
  
  
/* calendar */

[type="date"] {
  background:#fff url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)  97% 50% no-repeat ;
}
[type="date"]::-webkit-inner-spin-button {
  display: none;
}
[type="date"]::-webkit-calendar-picker-indicator {
  opacity: 0;
}
label {
  display: block;
}
input {
  border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 3px 5px;
 /*  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1); */
  width: 190px;
}
  
</style>
    
</head>
<body>

<jsp:include page="mainheader.jsp"></jsp:include>
<form method="post" action="${pageContext.request.contextPath }/showDeliveredOrdersByDate${customerModel.customerid}" modelAttribute="orders">
<div style="max-width:1200px;margin:17px auto;">
<span style="border:1 px green;background-color:white;font-weight: bold;color: green;font-size:25px;font-weight:500px;">My Orders</span>
<table style="float:right;cellSpacing:20px);"> 
<th>   
<label for="dateofbirth">From</label>
</th>
<th>
<input type="date" name="fromDate" id="dateofbirth" style="box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);">
</th> 
<th>   
<label for="dateofbirth">To</label></th>
<th>

<input type="date" name="toDate" id="dateofbirth" style="box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);">
    </th> 
  <th>   
<label for="dateofbirth"></label></th>
<th>
    <th>
    <button type="submit" style="border: 1px solid #c4c4c4;
  border-radius: 5px;
  background-color: #fff;
  padding: 5px 5px;
  box-shadow: inset 0 3px 6px rgba(0,0,0,0.1);
  width:70px;">Filter</button>
    </th>
    </table>
</div>
</form>
<c:forEach var="orders" items="${requestScope.deliveredOrders}">
<div class="wrapper">
	  <div class="view_main">
	 
	   <div style="margin-left:10px;line-height:28px;">
	<a href="${pageContext.request.contextPath}/order/orderinfo/${orders.orderid}"><span style="color: green;float:right;margin-right:10px;text-decoration:underline;">Order Detail</span></a><a href="${pageContext.request.contextPath}/order/repeatOrder${orders.orderid}"><span href="${pageContext.request.contextPath}/order/repeatOrder${orders.orderid}" style="color: green;float:right;margin-right:10px;text-decoration:underline;">Re-Order</span></a>
	   <p style="font-weight:600">${orders.pickupStatus}</p>
	   <p><fmt:formatDate value="${orders.orderDate}" pattern="${dateformatter}"/></p>
	   <p style="font-weight:600">Total: ${repee_sign}<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${orders.orderTotal}"/></p>
       </div>
       
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
					<p class="content">${repee_sign}${orderitem.product.price}</p>
					<a href="#" style="color: green;">Review</a>
					<!-- <div class="btn">Review</div> -->
				</div>
			</div>
			</c:forEach>
			<table>
	<th>
	<div class="btn" style="width: 125px;
	background: #4abd3e;
	padding: 8px 5px;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	font-weight:400;
	cursor: pointer;margin-left:10px;">ShowAll</div>
	</th>
	
	<%-- <th>
	 <a href="${pageContext.request.contextPath}/order/repeatOrder${orders.orderid}" style="display: inline-block;
        padding: 8px 5px;
        text-align: center;
        text-decoration: none;
        color: #fff;
        background: #4abd3e;
        border-radius: 3px;
        font-weight:400;
        width: 125px;
        margin-left:2px;">Re-Order</a>
	</th> --%>
	
	
	</table>
		
		
		
		
		</div>
		
	</div>
	
</div>
</c:forEach>

<jsp:include page="footer.jsp"></jsp:include>
	


</body>
</html>