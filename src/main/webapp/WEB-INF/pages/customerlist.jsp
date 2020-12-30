<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
   
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%> 
 
 
<html>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg">
<style type="text/css">
div {
  border: 1px solid #ffffff;
  text-align: center;
  width: 50%;
  margin: 0 auto;
  margin-top:1px;
  padding: 10px;
 
}

h1 {
  text-align: center;
}

table, td, th {  
  border: 1px solid #008000;
  text-align: center;
  
}

table {
   margin-left:auto; 
    margin-right:auto;
  border-collapse: collapse;
  width: 80%;

}

th {
 background-color: #4CAF50;
  color: white;
  
}

th, td,tr {
  padding: 15px;
}

.button {
  border-radius: 5px;
  background-color: #4CAF50; /* Add */
  border: none;
  color: white;
  padding: 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px 5px;
  margin-top: 30px;
  cursor: pointer;
  width: 100px;
}

div.a {
  text-align: center;
  height: 30px;
  margin-top: 30px;
}
.button1 {background-color: #4CAF50;
          border-radius: 12px;} /* Add */
.button2 {background-color: #4CAF50;
          border-radius: 12px;} /* Delete */
.button3 {background-color: #4CAF50;
          border-radius: 12px;} /* Edit */ 
.button4 {background-color: #4CAF50;
          border-radius: 12px;} /* Search */ 
</head>
</style>
<body>

<script type="text/javascript" language="JavaScript">

function checkCheckBoxes(theForm) {
    if (
    theForm.customerid.checked == false) 
    {
        alert ('You didn\'t choose any of the checkboxes!');
        return false;
    } else {    
        return true;
    }
}

  </script> 

  <div><h2><p style="color:green;">Customer Details</p></h2></div>

    <form method="get" <%-- onsubmit="return checkCheckBoxes(this);" --%>>
  
   <table id="Table1"  border="1" align="center" cellspacing="0">
   <tr>     
		            <th></th>
		            <th>First Name</th>
		            <th>Last Name</th>
					<th>Mobile</th>
					<th>City</th>
					<th>KIOSK Location</th>
					<th>Email</th>
					<!--  <th>password</th> -->
					<!--  <th>confirmPassword</th> -->
					
   
   </tr>
   
   <c:forEach var="customer" items="${listCustomer}">
                    <tr>
                    <td align="center"><input type="checkbox" class="checkboxId" name="customerid" value="${customer.customerid}"></td>
                    <td>${customer.firstName}</td>
                    <td>${customer.lastName}</td>
                    <td>${customer.mobile}</td>
					<td>${customer.cities}</td>
					<td>${customer.location}</td>
				    <td>${customer.email}</td>
                    </tr>
                   </c:forEach>
                   </table>
  
     <div><input class="button button1" type="submit" value="Add" formaction="${pageContext.request.contextPath}/customer/newCustomer" />
     <input class="button button1" type="submit" value="Delete" 
                       formaction="${pageContext.request.contextPath}/customer/deleteCustomer" onclick="return confirm('Are you sure to delete?')" />
     <input class="button button1" type="submit" value="Update" formaction="${pageContext.request.contextPath}/customer/editCustomer" />
     <input class="button button1" type="submit" value="Search" formaction="${pageContext.request.contextPath}/customer/searchCustomer" />
     </div>
   </form>
 
  
   
</body>
</html>
 








   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
   
