<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
     <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
  box-sizing: border-box;
}
body{
background-color:#f1f1f1;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 70%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
  margin-left:15%; 
  
}

#myTable {
  border-collapse: collapse;
  width: 70%;
  border: 1px solid #ddd;
  font-size: 18px;
  margin-left:auto; 
   margin-right:auto;
   background-color: white;
}

#myTable th, #myTable td {
  text-align: left;
  padding: 12px;
}

#myTable tr {
  border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
  background-color: forestgreen;
}
</style>
</head>
<body>

<div style="background-color:white;margin-left:15%;margin-right:15%;"><h2 style="color: green; text-align: center;style="background-color:white;">Order Info</h2></div><br>

    <div style="text-align: center;background-color: white;margin-right:70%;margin-left:15%;">
    <h2 style="color: green;">Order Summery</h2>
    <h4>OrderId: 101<h4>
   <h4 style="color: red;">Total:Rs 1200</h4></div>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for order.." title="Type in a name">

<table id="myTable">
  <tr class="header">
    <th style="width:%;color:white;">Product Id</th>
     <th style="color: white;">Product Image</th>
    <th style="width:%;color:white;">Product Name</th>
    <th style="width:%;color:white;">Quantity</th>
    <th style="width:%;color:white;">Price</th> 
    <th style="width:%;color:white;">Total Amount </th>    
  </tr>

<tr>
    <td>1001</td>
     <td><spring:url value="/images" var="images" />
    <img src="${images}/carrot.jpg" width="70" height="70"/></td>
    <td>Potato</td>
   
    <td>2</td>
    <td>25</td>
    <td>50</td>
  </tr>
    
    <tr>
    <td>1002</td>
    <td><spring:url value="/images" var="images" />
    <img src="${images}/bringal.jpg" width="70" height="70"/></td>
    <td>Onion</td>
    <td>2</td>
    <td>25</td>
    <td>50</td>
  </tr>
    <tr>
    <td>1003</td>
    <td><spring:url value="/images" var="images" />
    <img src="${images}/potato.jpg" width="70" height="70"/></td>
    <td>Ginger</td>
    <td>2</td>
    <td>25</td>
    <td>50</td>
  </tr>
   
</table><br>
       <a href="${pageContext.request.contextPath}/home/cart" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: green;
        border-radius: 6px;
        outline: none;margin-top:6px;
        margin-left:15%;">Repeat Order</a>
        
        <a href="${pageContext.request.contextPath}/home/registeredhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: green;
        border-radius: 6px;
        outline: none;margin-top:6px;
        ">Cancel</a>
        </div>
 
    

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[0];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>

</body>
</html>
