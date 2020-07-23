<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
  
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
</head>
<body>

<div align="center">
<h1>Spring MVC And Hibernate Shopping Cart</h1>
<table border="2" >
<tr>
<!-- <th>Options</th>
<th>Photo</th> -->
<th>Name</th>
<th>Price</th>
<th>Quantity</th>
<th>Sub Total</th>

 
</tr>

<c:set var="s" value="0"></c:set>
<c:forEach var="item" items="${sessionScope.cart}">
<c:set var="s" value="${s+ item.product.price * item.product.quantity}"></c:set>
<tr>
<td><a href="${pageContext.request.contextPath}/cart/delete/${item.product.productid}" >Remove</a></td>
<%-- <td>${pr.product.id }</td> --%>

<%-- <td>
<img alt="" src="${pageContext.request.contextPath}/images/${pr.product.photo}" height="100px" width="100px">

</td> --%>

<td>${item.product.productName}</td>
<td>${item.product.price }</td>
<td>${item.product.quantity}</td>
<td>${item.product.price * pr.product.quantity}</td>
</tr>  
</c:forEach>

<tr><td colspan="6" align="right">Sum</td>
<td>${s}</td>

</tr>
</table>
<a href="${pageContext.request.contextPath}/cart/registerdhome">Shoping</a><br>

</div>



</body>
</html>