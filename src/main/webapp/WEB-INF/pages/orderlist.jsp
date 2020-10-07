  
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %> 

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table id="myTable">
    <tr class="header">
    <th style="width:%;color:white;">Product Id</th>
    <th style="color: white;">Product Image</th>
    <th style="width:%;color:white;">Product Name</th>
    <th style="width:%;color:white;">Quantity</th>
    <th style="width:%;color:white;">Total Amount </th>    
    </tr>
    
    <c:forEach var="orderitem" items="${listorderitem}">
    <tr>
    <td>${orderitem.product.productid}</td>
    <td><spring:url value="/images" var="images" />
    <img src="${images}/${orderitem.product.imageName}" width="70" height="70"/></td>
    <td>${orderitem.product.productName}</td>
   
    <td>${orderitem.product.quantity}</td>
    <td>${orderitem.totalAmount}</td>
    </tr>
    </c:forEach>
 
    
</body>
</html>