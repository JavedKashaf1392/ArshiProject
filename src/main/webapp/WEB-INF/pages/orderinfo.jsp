
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

 <!DOCTYPE HTML>
 <html lang="en" dir="ltr">
        
        <head> 
        
        <link rel="icon" type="image/jpg" href="images/logo.jpg">
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home screen of VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
        <style>
        
body {font-family: Arial, Helvetica, sans-serif;}

hr{
border:1px solid #f1f1f1;
}

.row:after {
  content: "";
  display: table;
  clear: both;
}
.col-75 {
  width: 100%;
  margin-top: 11px;
  color: black;
}
input[type=text], select, textarea {
  width: 90%;
  padding: 8px;
 
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
  padding: 10px 14px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top:10px;
}
input[type=submit]:hover {
  background-color: #45a049;
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 135px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 130%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
}
/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 22%;
  margin-left: 68%;
  border-radius: 4px; 
}
/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
 .popUpMain{ 
  outline: #4CAF50 solid 10px;
  display: none;   /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1001; /* Sit on top */
  padding-top: 75px;  /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
 /*  overflow: auto; /* Enable scroll if needed */ */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  box-shadow: 1px 2px 5px 3px white;
  } 
.popup {/* 
   /* background-color:#f1f1f1; */
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  margin-left: 34%;
  
}
</style>
        </head>
        <style>
    
    body{
    font-family: Arial;
    margin: 0;
    padding: 0;
    font-family: "Roboto", sans-serif;
   .mySlides {display: none}
/* img {vertical-align: middle;} */
   
    {
    box-sizing: border-box;
}
}


    /* ........................................... */

  </style>  
  <body >
 
   <!--  header -->
  <jsp:include page = "mainheader.jsp"/>
  
  <div class="centercontent" style="background-color:;margin-top:10px;">
   
 <%-- <div class="sidemenu" style="margin: 0;
  padding: 0;
  width: 250px;
  background-color:#f1f1f1;
  position: absolute;
  height:700px;
  /*overflow: auto;*/
  margin-left:15%;border:1px solid #ddd;">
  
  <a class="active" href="#home" style=" display: block;
  color: white;
  padding: 16px;
  text-decoration: none;background-color:#4CAF50; ">My Account</a>
  
  <a href="${pageContext.request.contextPath }/order/editProfile"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Edit Profile</a> 
  
  <a href="${pageContext.request.contextPath }/cart/listCustomerCartItem"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - MY Cart</a>
  
  <a href="${pageContext.request.contextPath }/order/pendingorders"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - MY Order</a>
  
  <a href="${pageContext.request.contextPath }/home/wallet" style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "-> - My Wallet</a>
  
  <a href="#home"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none;"> - Membership</a>
  
  <a href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Pending Orders</a>
  
  <a href="${pageContext.request.contextPath }/order/showDeliveredOrders${customerModel.customerid}"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Deliverd Orders</a>
  
  <a href="#news"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Customer Service</a>
  
  <input type="button" style="width:140px;cursor:pointer;margin: 4px 4px;font-size:14px;text-decoration:none;border-radius:8px;text-align: center;color:white;background-color:#4CAF50;padding:10px;border:none;margin-left:8%;" value="Back" onclick="history.back()">
  </div> --%>
  
  <div class="center" style=" margin-left: 200px;
  padding: 1px 16px;
  height: 700px;
  margin-left:32%; background-color: ;margin-right:13%;margin-top:30px;">
  
  <h3>Order Detail</h3>
  <hr>
<%--   <table style="width:5%;position: fixed;">
  
  <th style="background-color:white;padding:10px 40px; width:5%;border-radius:8px;">     

<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->
 
  
<a href="${pageContext.request.contextPath}/order/pendingorders" style="display: inline-block;
        padding: 10px 30px;
        text-align:center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius:6px;
        outline: none;margin-top:6px">Pendings</a>
        </th>

 <th style="background-color:white;padding:10px 40px; width:%;border-radius:8px;">     
 <a href="${pageContext.request.contextPath}/order/deliveredorder" style="display: inline-block;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Delivered</a>
       </th> 
       </table> --%>
 
 <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for order.." title="Type in a name" style="background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 45%;
  font-size: 16px;
  padding: 10px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 5px;
  margin-left:47%; 
  margin-right:auto;
  margin-top: 5px;">      
       
<table id="myTable" style=" margin-left:auto; 
  margin-right:auto;
  text-align: center;
  border-collapse: collapse;
  width: 100%;
  border: 1px solid #ddd;
  font-size: 18px;
  align-content: center;
  background-color:white; margin-bottom: 50px;">
    
  <tr class="header" style=" border-bottom: 1px solid #ddd;
  text-align: center; border-bottom: 1px solid #ddd;
  text-align: center;background-color: #4CAF50">
  
    <th style="width:%;color:white;text-align: center;
  padding: 12px;">Product Id</th>
    <th style="width:%;color:white;text-align: center;
  padding: 12px;"></th>
     <th style="width:%;color:white;text-align: center;
  padding: 12px;">Product Name</th>
    <th style="width:%;color:white;text-align: center;
  padding: 12px;">Quantity</th>
  <th style="width:%;color:white;text-align: center;
  padding: 12px;">Price</th>
    <th style="width:%;color:white;text-align: center;
  padding: 12px;">Total Amount</th>
    </tr>
    
  <c:forEach var="orderitem" items="${listorderitem}">
  <tr style=" border-bottom: 1px solid #ddd;">
    <td style=" text-align: center;
  padding: 16px;">${orderitem.product.productid}</td>
  
    <td style=" text-align: center;
  padding: 16px;"><spring:url value="/images" var="images" />
    <img src="${images}/${orderitem.product.imageName}" width="70" height="70"/></td>
    <!-- <i class="fa fa-check-circle" style="color:green"></i> -->
    
    <td style=" text-align: center;
  padding: 16px;">${orderitem.product.productName}</td>
  
  <td style=" text-align: center;
  padding: 16px;">${orderitem.product.quantity}</td>
  
  <td style=" text-align: center;
  padding: 16px;">${orderitem.product.price}</td>
  
  <td style=" text-align: center;
  padding: 16px;">${orderitem.product.price}</td>
  </tr>
  </c:forEach>
  </table>

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
  
  </div>

 <!--  ...........  footer.................  -->
  
   <jsp:include page = "footer.jsp"/>   
  </body>
  </html>
  