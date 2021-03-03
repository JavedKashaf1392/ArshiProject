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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
<!-- <link rel="icon" type="image/jpg" href="images/logo.jpg"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

body {
  font-family: 'Quicksand', sans-serif;

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
	    <li class="active" id="account"><strong>Payment</strong></li>
		<li id="confirm"><strong>Confirm</strong></li>
		</ul>
	   </form>
	   </div>
	
	 <div class="row">
  <div class="col-75">
    <div class="container">
     
      
        <div class="row">
          <div class="col-50">
            <h3>Paymnet Option</h3> 
            <table
						style="cellspacing: 2%; border-spacing: 10px; margin-top: 1%;margin-left:8%;">
						<!-- #DCDCDC -->
						
						<th
							style="background-color:white; padding: px px; border-radius: px; border: 1px solid #ddd; height: 20px; width: 180px;">
							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayByWallet"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class='fas fa-wallet' style="font-size: 50px; color: black;"></span></a>
							<!--   Balance:5000.00 -->
						</th>

						<th
							style="background-color:white; padding: px px; width: %; border-radius: px; border: 1px solid #ddd; height: 20px; width: 180px;">
							<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayOnline"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class="fa fa-bank" style="font-size: 50px; color: black"></span></a>
							<!--   Card:11 -->
						</th>
					
						<th
							style="background-color:white; padding: px px; width: %; border-radipx; border: 1px solid #ddd; height: 100px; width: 180px;">
							<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderUPI"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class="fa fa-shopping-cart"
								style="font-size: 50px; color: black"></span></a> <!--  Transaction:0 -->
						</th>
						<th
							style="background-color:white; padding: px px; border-radius: px; text-align: center; border: 1px solid #ddd; font-size: 15px; height: 20px; width: 180px;">

							<a
							href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayATKiosk"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class='far fa-credit-card' style="font-size: 50px; color: black"></span></a>
							<!--  Membership Id:3 -->
						</th>
						<tr>
							<td style="text-align:center;">Wallet</td>
							<td style="text-align:center;">Pay Online</td>
							<td style="text-align:center;">UPI</td>
							<td style="text-align:center;">Pay AT Kiosk</td>
						</tr>
					</table>
            	
            
          </div>
<!-- 
          <div class="col-50" style="margin-top:65px;">
          </div>
           -->
        </div>
        
     <!--    <input type="button" value="Go back" style=" background-color: white;
  color: black;
  padding: 10px 14px;
   border: 1px solid green;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  " onclick="history.back()"> -->
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
