
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

 <!DOCTYPE HTML>
 <html lang="en" dir="ltr">
        
        <head> 
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
  </style>  
  </head>
  <body >
 
     <!--  header -->
    <div class="logo" style="margin-left:15%;">
    <spring:url value="/images" var="images" />
    <img src="${images}/logo.jpg" width="160" height="110"/>
    </div>
    <hr style="border-bottom: 0px">   
   
  <h3 style="color: green;text-align: center;margin-top:2%;font-size:24px;">Select Payment Method</h3>
  
  <div style="border: 1px solid #ddd;margin-right:30%;margin-left:25%;padding:50px 50px;">
  
  <table style="cellspacing:2%; border-spacing:10px;margin-top:1%;">
  <!-- #DCDCDC -->
  <th style="background-color:#DCDCDC;padding:px px;border-radius:px; 
  text-align: center;
  border: 1px solid #ddd;
  font-size:15px;height:20px;width:180px;">
     
  <a href="${pageContext.request.contextPath}/payment" style="display: inline-block;
        padding:10px 15px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:white;
        border-radius:6px;
        outline: none;margin-top:6px"><span  class='far fa-credit-card' style="font-size:50px;color:black"></span></a>
       <!--  Membership Id:3 -->
       </th>

<th style="background-color:#DCDCDC;padding:px px;border-radius:px; border: 1px solid #ddd;height:20px;width:180px;">     
<a href="${pageContext.request.contextPath}/payment" style="display: inline-block;
        padding: 10px 15px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:white;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class='fas fa-wallet'style="font-size:50px;color:black;"></span></a>
      <!--   Balance:5000.00 -->
       </th>
           
       <th style="background-color:#DCDCDC;padding:px px; width:%;border-radius:px;border: 1px solid #ddd;height:20px;width:180px;">     
<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

<a href="${pageContext.request.contextPath}/payment" style="display: inline-block;
        padding: 10px 15px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:white;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class="fa fa-bank" style="font-size:50px;color:black"></span></a>
      <!--   Card:11 -->
       </th>
       
<th style="background-color:#DCDCDC;padding:px px; width:%;border-radipx;border: 1px solid #ddd;height:100px;width:180px;">     
<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

<a href="${pageContext.request.contextPath}/payment" style="display: inline-block;
        padding: 10px 15px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:white;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class="fa fa-shopping-cart" style="font-size:50px;color:black"></span></a>
       <!--  Transaction:0 -->
       </th>
       </table>
       </div>
       
  
  </body>
  </html>
  