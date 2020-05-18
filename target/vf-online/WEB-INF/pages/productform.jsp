<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>New/Edit Product</title>
</head>
<body>
    <div align="center">
        <h1>New/Edit Employee</h1>
        <form:form action="saveProduct" method="post" modelAttribute="product">
        <table>
            <form:hidden path="productid"/>
            <tr>
                <td>ProductName:</td>
                <td><form:input path="productName" /></td>
            </tr>
            <tr>
                <td>ProductPrice:</td>
                <td><form:input path="productPrice" /></td>
            </tr>
            <tr>
                <td>Quantity:</td>
                <td><form:input path="quantity" /></td>
            </tr>
            <tr>
                <td>Discount:</td>
                <td><form:input path="discount" /></td>
            </tr>
            
            <tr>
                <td>IsAvailable:</td>
                <td><form:input path="isAvailable" /></td>
            </tr>
            
            <tr>
                <td>Category:</td>
                <td><form:input path="category" /></td>
            </tr>
            
            <tr>
                <td>Description:</td>
                <td><form:input path="description" /></td>
            </tr>
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>