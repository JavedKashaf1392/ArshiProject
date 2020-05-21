<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
      
<html>
   <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 120%;
  padding: 12px;
  margin-left:40px;
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  margin-top:20px;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
  align:center;
  margin-left:20px;
}



input[type=submit]:hover {
  background-color: #45a049;
}

.error {
   color:red; 
 }

.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
/* .container {
  border-radius: 10px;
  border: 1px solid #008000;
  max-width: 600px;
  padding: 50px;
}

.col-25 {
  float: left;
  width: 20%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 50%;
  margin-top: 6px;
}


/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
 */
h2 {
  color: green;
}
</style>
<title>New/Edit Product</title>
</head>
<body>
    <div align="center">
    <div><h2><p style="color:green;">New/Edit Product</p></h2></div>
       <!--  <h2>New/Edit Product</h2> -->
        <form:form action="saveProduct" method="post" modelAttribute="product">
        <table>
            <form:hidden path="productid"/>
            <tr>
                <td>ProductName </td>
                <td><form:input path="productName"  /><form:errors path="productName" cssClass="error"/></td>
            </tr>
            <tr>
                <td>ProductPrice </td>
                <td><form:input path="productPrice" /></td>
                <td><form:errors path="productPrice" cssClass="error" /></td> 
            </tr>
            <tr>
                <td>Quantity </td>
                <td><form:input path="quantity" /></td>
                <td><form:errors path="quantity"  cssClass="error"/></td> 
            </tr>
            <tr>
                <td>Discount </td>
                <td><form:input path="discount" /></td>
                <td><form:errors path="discount"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>IsAvailable </td>
                <td><form:input path="isAvailable" /></td>
                <td><form:errors path="isAvailable" cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Category </td>
                <td><form:input path="category" /></td>
                <td><form:errors path="category" cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Description </td>
                <td><form:input path="description" /></td>
                <td><form:errors path="description" cssClass="error"/></td> 
            </tr>
           
            <tr> 
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
               
                 <td colspan="2" align="center"><input type="submit" value="Back" onclick="history.back()"></td>
               
            </tr>
            
        </table>
        </form:form>
    </div>
</body>
</html> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
