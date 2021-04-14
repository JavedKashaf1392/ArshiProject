<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg"> 
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<!-- <meta name="description" content=""/>
    <meta name="viewport" content="width=device-width"/>
    <base href="/"/>
    <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/webjars/font-awesome/css/font-awesome.min.css"></link>

<link href="https://cdn.datatables.net/1.10.21/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css">

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script
	src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"></script> -->

<!-- <link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	 <link rel="stylesheet" type="text/css" href="/webjars/bootstrap/css/bootstrap.min.css"/>
    <script type="text/javascript" src="/webjars/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="/webjars/font-awesome/css/font-awesome.min.css"></link> -->
    
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
            $('#prodId').on('change', function() {
                this.form.submit();
            });
        });
        </script>
        </head>
        
    <body align="center">
	<form action="viewAll">
	<table align="center">
	
	<tr>
	<td>
	<select name="category" id="prodId">
	<option value="">--Select--</option>
	<option value="Milk">Milk</option>
	<option value="Leafy Vegetables">Leafy Vegetables</option>
	<option value="Fruit Vegetables">Fruit Vegetables</option>
	</select>
	</td>
	</tr>
	</table>
	</form>
     <br>

<table align="center" bgcolor="yellow">
<thead>
<th> Name</th>
<th> Price</th>
	<th> Quantity</th>
	<th> Available</th>
	<th> Size</th>
	<th>Tax</th>
	<!-- <th>Product Category</th> -->
</thead>

		    <tbody>
			<c:forEach items="${productcatg}" var="product">
			<tr>	
					<td>${product.productName}</td>
					<td>${product.price}</td>
					<td>${product.quantity}</td>
					<td>${product.isAvailable}</td>
					<td>${product.size}</td>
                    <td>${product.tax}</td>
					<%-- <td>${v.productCategory}</td> --%>
					</tr>
			      </c:forEach>
		          </tbody>
	              </table>
	
</body>
</html>