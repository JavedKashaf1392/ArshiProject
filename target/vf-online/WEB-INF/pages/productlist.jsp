<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Employee Management Screen</title>
</head>
<body>
	<div align="center">
		<h1>Product List</h1>
		
		<table border="1">

			<th>ProductName</th>
			<th>ProductPrice</th>
			<th>Quantity</th>
			<th>Discount</th>
			<th>Availability</th>
			<th>Category</th>
			<th>Description</th>
			<th>Action</th>
			

			<c:forEach var="product" items="${listProduct}">
				<tr>

					<td>${product.productName}</td>
					<td>${product.productPrice}</td>
					<td>${product.quantity}</td>
					<td>${product.discount}</td>
					<td>${product.isAvailable}</td>
					<td>${product.category}</td>
					<td>${product.description}</td>
					
					<td><a href="editProduct?productid=${product.productid}">Edit</a>
						&nbsp;&nbsp;&nbsp;&nbsp; <a
						href="deleteProduct?productid=${product.productid}">Delete</a></td>

				</tr>
			</c:forEach>
		</table>
		<h4>
			New Product Register <a href="newProduct">here</a>
		</h4>
	</div>
</body>
</html>