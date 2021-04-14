<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<!-- <link rel="icon" type="image/jpg" href="images/logo.jpg"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<style>
body {
  font-family: 'Quicksand', sans-serif;
 /*  font-size: 17px;
  padding: 8px; */
}

* {
  box-sizing: border-box;
}

.row {
 font-size: 17px;
  padding: 8px;
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  /* margin: 0 -16px; */
  max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;
   
    
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  /* background-color: #f2f2f2; */
  padding: 5px 20px 15px 20px;
 /*  border: 1px solid lightgrey; */
  /* border-radius: 3px; */
   background-color: #F7F7F7;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc; 
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  /* padding: 12px; */
  /* margin: 20px 0; */
  border: none;
 /*  width: 100%; */
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
       padding: 10px 14px;
        text-align: center;
        text-decoration: none;
        /* color: #ffffff;
        background-color:orange; */
       /*  border-radius: 6px; */
        outline: none;font-size:15px;
        margin: 0 auto;
        margin-left:30px;
  
}

.btn:hover {
  background-color: #45a049;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}
span.lg-title{
    font-size: 2.0rem;
    font-weight: 500;
    text-align: center;
    padding: 1.3rem 0;
    opacity: 0.9;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
  #msform{
  flex-direction: column-reverse;
  
  }
}
/* .................Progrees bar................ */
#msform {
	text-align: center;
	position: relative;
	margin-top: 20px;
	margin-left: 20%;
}

#msform .action-button:hover, #msform .action-button:focus {
	background-color: #311B92
}

#msform .action-button-previous {
	width: 100px;
	background: #616161;
	font-weight: bold;
	color: white;
	border: 0 none;
	border-radius: 0px;
	cursor: pointer;
	padding: 10px 5px;
	margin: 10px 5px 10px 0px;
	float: right
}

#msform .action-button-previous:hover, #msform .action-button-previous:focus
	{
	background-color: #000000
}

#progressbar {
	margin-bottom: 30px;
	overflow: hidden;
	color: lightgrey
}

#progressbar .active {
	color: seagreen;
}

#progressbar li {
	list-style-type: none;
	font-size: 15px;
	width: 25%;
	float: left;
	position: relative;
	font-weight: 400
}

#progressbar #account:before {
	font-family: FontAwesome;
	content: "\f007"
}

#progressbar #personal:before {
	font-family: FontAwesome;
	content: "\f007"
}

#progressbar #payment:before {
	font-family: FontAwesome;
	content: "\f030"
}

#progressbar #confirm:before {
	font-family: FontAwesome;
	content: "\f00c"
}

#progressbar li:before {
	width: 50px;
	height: 50px;
	line-height: 45px;
	display: block;
	font-size: 20px;
	color: #ffffff;
	background: lightgray;
	border-radius: 50%;
	margin: 0 auto 10px auto;
	padding: 2px
}

#progressbar li:after {
	content: '';
	width: 100%;
	height: 2px;
	background: lightgray;
	position: absolute;
	left: 0;
	top: 25px;
	z-index: -1
}

#progressbar li.active:before, #progressbar li.active:after {
	background: green;
}

.progress {
	height: 20px
}

.progress-bar {
	background-color: green;
}

</style>
</head>
<body>
        <div style="max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;margin-bottom:20px;">
	    
		<spring:url value="/images" var="images" />
		<img src="${images}/logo.jpg" width="160" height="110"
		 style="position: absolute;margin-left:2%;" />
	    
	    <form id="msform">
		<!-- progressbar -->
		<ul id="progressbar">
		<li class="active" id="account"><strong>Confirm Address</strong></li>
	    <li id="payment"><strong>Payment</strong></li>
		<li id="confirm"><strong>Confirm</strong></li>
		</ul>
	   </form>
	   </div>
   <!-- <hr style="border-bottom:5px;max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;"> -->
    
  <div class="row">
  <div class="col-75">
    <div class="container">
      <form action="${pageContext.request.contextPath}/order/paymentMethod" method="post">
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3> 
            <input type="checkbox" checked="checked" name="sameadr">Countinue with my default address.<br>
           
            <!-- <span class="lg-title">Confirm Address</span> -->
            <label for="fname">First Name</label>
            <input type="text" id="fname"  value="${customerModel.firstName}">
            <label for="email">Email</label>
            <input type="text" id="email"  value="${customerModel.email}">
          
          <label for="adr">City</label>
          <select id="country" name="country" style="width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc; 
  border-radius: 3px;">
          <option value="australia">Australia</option>
          <option value="canada">Canada</option>
          <option value="usa">USA</option>
          </select>
            <%-- <input type="text" id="adr" value="${customerModel.cities}"> --%>
            <label for="city">State</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <!-- <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
            </div> -->
          </div>

          <div class="col-50" style="margin-top:85px;">
          <label for="fname">Last Name</label>
            <input type="text" id="fname"  value="${customerModel.lastName}">
            <label for="email">Mobile</label>
            <input type="text" id="email"  value="${customerModel.mobile}">
            <label for="adr">Location</label>
           <select id="country" name="country" style="width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc; 
  border-radius: 3px;">
          <option value="australia">Australia</option>
          <option value="canada">Canada</option>
          <option value="usa">USA</option>
          </select>
            <label for="expmonth">Zip</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
          </div>
          
        </div>
        <input type="submit" value="Countinue To Paymnet" class="btn">
        <input type="reset" value="CANCEL" style=" background-color: white;
  color: black;
  padding: 10px 14px;
   border: 1px solid green;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  ">
      </form>
    </div>
  </div>
  
    <div class="col-25">
    <div class="container">
    	
      <h4>(${customerModel.cartpage.cartitem} Items)</h4>
      <hr>
      <p>Total <span class="price" style="color:black"><b>&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/></b></span></p>
      
       <p style="background-color:white;">Total Saving <span class="price" style="color:black"><b>&#8377;30.00</b></span></p>
    </div>
  </div>
 
  
</div>
    

</body>
</html>
