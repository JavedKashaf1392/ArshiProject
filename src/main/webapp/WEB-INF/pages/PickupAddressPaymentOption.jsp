<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">

<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<meta charset="UTF-8">
<title>VeggieFridge</title>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>

@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;

* {
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.wrapper {
	width: 1200px;
	margin: 20px auto;
}

.view_main {
	background: #f5f5f5;
	border-radius: 3px;
	padding: 15px;
	border: 1px solid #e2efe1;
	padding: 30px 30px;
}

.list-view .view_item {
	background: #fff;
	border: 1px solid #e2efe1;
	margin: 10px;
	padding: 10px 20px;
	display: flex;
	align-items: center;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
  max-width: 1200px;
  margin: 0 auto;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
  line-height:45px; 
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
  background-color: white;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
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
}
/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width:800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
.checkout {
	background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
    color: white;
    background:#4CAF50;
    border-radius:50px; 
     width:230px;
     float: right; 
     margin-top:20px;
}

.checkout:hover {
	background-color: #019701;
}
  
  </style>
  </head>

   <body>
   
   <div style="width: 1200px;
    margin: 20px auto;">
   
   <table>
   <th><a href="abc.htm"> <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="60" height="60" alt=""/>
					</a></th>
					
					<th><a href="abc.htm">  <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
					</a></th>
					
			    <p style="float:right;margin-top:20px;">(+84) 123 456 789</p>
				</table>
  				
    </div>

    <div class="wrapper">
    <div class="view_main">
				
				<div class="view_wrap list-view">
				
				<div class="view_item">
							<div class="vi_left">
							<div class="row">
  <div class="col-75" style="margin-top:25px;margin-bottom:25px;">
    <div class="container">
    
    <form action="/action_page.php">
      
        <div class="row">
        
          <div class="col-50">
          
            <h3 style="margin-top:10px;">Pickup Address</h3><br>
            
            <label for="fname"> First Name</label>
            <input type="text" id="fname" name="firstname" value="${customerModel.firstName}">
            
            <label for="email"> Email</label>
            <input type="text" id="email" name="email" value="${customerModel.email}">
            
            <label for="city">City</label>
             <select id="country" name="country" style="width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc; 
  border-radius: 3px;">
          <option value="australia">Nagpur</option>
          <option value="canada">Hyderabad</option>
         
          </select>

             <label for="email">State</label>
            <input type="text" id="email" name="email" value="Maharastra">
          </div>

            <div class="col-50" style="margin-top:52px">
            <label for="cname">Last name</label>
            <input type="text" id="cname" name="cardname" value="${customerModel.lastName}">
            <label for="ccnum">Mobile</label>
            <input type="text" id="ccnum" name="cardnumber" value="${customerModel.mobile}">
            <label for="expmonth">Kiosk Location</label>
           <select id="country" name="country" style="width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc; 
  border-radius: 3px;">
          <option value="australia">Mihan</option>
          <option value="canada">Ameerpet</option>
         
          </select>
          
           <label for="email">Zip</label>
            <input type="text" id="email" name="email" value="542867">
          </div>
          
          </div>
        
          <div class="col-50">
          <h3>Payment Option</h3><br>
          <div class="row">
             
               <table
						style="cellspacing:4%;border-spacing:10px;">
						<!-- #DCDCDC -->
						
						<th
							style="background-color:white; padding: px px; border-radius: px; border: 1px solid #ddd; height: 20px; width: 180px;">
							<a href="${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayByWallet"
							style="display: inline-block; padding: 10px 15px; text-align: center; text-decoration: none; color: #ffffff; background-color: white; border-radius: 6px; outline: none; margin-top: 6px"><span
								class='fas fa-wallet' style="font-size: 50px; color: black;"></span></a>
							
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
							<td style="text-align:center;"><input type="radio" name="gender" value="wallet"> Wallet</td>
							<td style="text-align:center;"><input type="radio" name="gender" value="payonline"> Pay Online</td>
							<td style="text-align:center;"><input type="radio" name="gender" value="upi"> UPI</td>
							<td style="text-align:center;"><input type="radio" name="gender" value="payAtKiosk"> 
							Pay AT Kiosk</td>
						</tr>
					</table>
            </div>
          </div>
      </form>
      
    </div>
  </div>
  
    <div class="col-25" style="margin-top:25px;">
    <div class="container">
      <h3>Order Summery</h3>
      <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>4 Item</b></span></h4>
      <p>Cart amount <span class="price">${repee_sign}1200</span></p>
     <p>Sub Total <span class="price">${repee_sign}800</span></p>
     
      <hr>
      <p style="margin-top:5px;">Total <span class="price" style="color:black;"><b>${repee_sign}800</b></span></p>
    </div>
    
    <button class="checkout"
										onclick="window.location.href='${pageContext.request.contextPath}/order/checkoutAndSaveOrderPayATKiosk'">Place Order</button>
    </div>
 
</div>
								
							</div>
							<div class="vi_right">
								
							</div>
						</div>
	
				</div>

			</div>

		</div>
	
	
	
    <div class="wrapper">

			<div class="view_main">
				
				<div class="view_wrap list-view" style="display: block;">

					
						<div class="view_item">
							
								
							
							<div style="margin: 0 auto;">
								<p style="text-align: center;font-size:12px;">Created By VeggieFridge Copyright © 2021 All Rights
								Reserved.</p>
							</div>
						
						</div>

				</div>

			</div>

		</div>
	
	



</body>
</html>

