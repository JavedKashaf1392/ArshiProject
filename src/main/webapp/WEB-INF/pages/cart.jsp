
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
       <link rel="icon" type="image/x-icon" href="favicon.png">

<style>
body {
font-family: Arial, Helvetica, sans-serif;
background-color: white;
}

hr{
border:1px solid #f1f1f1;
}
/* .............cartcode.......... */
a {
  border: 0 none;
  outline: 0;
  text-decoration: none;
}

/* strong {
  font-weight: bold;
}
 */
p {
  margin: 0.75rem 0 0;
}

 h1 {
  font-size: 0.95rem;
  font-weight: normal;
  margin: 0;
  padding: 0;
} 

input,
button {
  border: 0 none;
  outline: 0 none;
}

button {
  background-color:#4CAF50; 
  color: #fff;
}

button:hover,
button:focus {
 background-color:green;
}

 img,
.basket-module,
.basket-labels,
.basket-product {
 /*  width: 100%; */
}
 
input,
button,
.basket,
.basket-module,
.basket-labels,
.item,
.price,
.quantity,
.subtotal,
.basket-product,
.product-image,
.product-details {
  float: left;
}

.price:before,
.subtotal:before,
.subtotal-value:before,
.total-value:before,
.promo-value:before {
  content: ;
}

.hide {
  display: none;
}

main {
  clear: both;
  font-size: 0.75rem;
  margin: 0 auto;
  overflow: hidden;
  padding: 1rem 0;
  width: 960px;
}

.basket,
aside {
  padding: 0 1rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket {
  width: 70%;
}

.basket-module {
  color: #111;
}

label {
  display: block;
  margin-bottom: 0.3125rem;
}

 .promo-code-field {
  border: 1px solid #ccc;
 /*  padding: 0.5rem; */
  text-transform: uppercase;
  transition: all 0.2s linear;
  width:20%;
  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  -o-box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
  box-shadow: inset 0 1px 1px rgba(0, 0, 0, .075);
}

.promo-code-field:hover,
.promo-code-field:focus {
  border: 1px solid #999;
}

.promo-code-cta {
  border-radius: 4px;
  font-size: 0
  .625rem;
  margin-left: 0.625rem;
  padding: 0.6875rem 1.25rem 0.625rem;
}

.basket-labels {
  border-top: 1px solid #4CAF50;
  border-bottom: 1px solid #4CAF50;
  margin-top: 1.625rem;
}

ul {
  list-style: none;
  margin: 0;
  padding: 0;
}

li {
  color: #111;
  display: inline-block;
  padding: 0.625rem 0;
}

li.price:before,
li.subtotal:before {
  content: '';
}

.item {
  width: 55%;
}

.price,
.quantity,
.subtotal {
  width: 15%;
}

.subtotal {
  text-align: right;
}

 .remove {
  margin-left:95%;
  margin-top: 10%;
  font-size:15px;
}

.remove button {
  background-color: transparent;
  color: #777;
  float: none;
  text-decoration: underline;
  text-transform: uppercase;
}

.item-heading {
  padding-left: 4.375rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.basket-product {
  border-bottom: 1px solid #4CAF50;
  padding: 1rem 0;
  position: relative;
}

.product-image {
  width: 30%;
}

.product-details {
  width: 65%;
}

.product-frame {
 /*  border: 1px solid #aaa; */
}

.product-details {
  padding: 0 1.5rem;
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}

.quantity-field {
  background-color: ;
  border: 1px solid #4CAF50; 
  border-radius: 4px;
  font-size: 0.625rem;
  padding: 2px;
  width: 3.75rem;
}


/* ................close cart code....... */

.footer{
    margin-left:15%;
    margin-right:20%; 
    position:relative;
    width:75%;
    height:500px;
    background: #4CAF50; 
    position:relative;
   /*  padding: 20px;
    padding: 20px; */
    /* border:1px solid black;  */
    margin-top:auto;
    
}
.carousel{
    padding: 20px;
    padding: 20px;
    margin-left:150px;
    /* margin-right:100px; */
    position:relative;
    width: 100%;
    margin-top:5px;
   /*  background: #4CAF50; */
    /*  border: 1px solid grey;  */
     height:550px;
     transition:1s;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex; 

}
 @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap'); 
 
 *{
    margin: 0;
    padding: 0;
   /*  color: #d9d9d9; */
   /*  color:black; */
    /* box-sizing: border-box;
    font-family: 'Poppins', sans-serif; */ 
} 
.main-content{
    display: flex;
}
.main-content .box{
    flex-basis: 50%;
    padding: 10px 20px;
}
.box h2{
    font-size: 1.125rem;
    font-weight: 600;
    text-transform: uppercase;
}
.box .content{
    margin: 20px 0 0 0;
    position: relative;
}
.box .content:before{
    position: absolute;
    content: '';
    top: -10px;
    height: 2px;
    width: 100%;
    background: #1a1a1a; 
      /*   background: #d9d9d9; */
}
.box .content:after{
    position: absolute;
    content: '';
    height: 2px;
    width: 15%;
  /*   background: #f12020; */
  background: #d9d9d9;
    top: -10px;
}
.left .content p{
    text-align: justify;
}
.center .content .social{
    margin: 20px 0 0 0;
}
.center .content .social a{
    padding: 0 2px;
}
.center .content .social a span{
    height: 40px;
    width: 40px;
    /*  background: #1a1a1a;  */
    background: white;
    line-height: 40px;
    text-align: center;
    font-size: 18px;
    border-radius: 50px;
    transition: 0.3s;
}
/* ...Left Content.... */
.center .content .social a span:hover{
    background: #f12020;
}
.center .content .fas{
    font-size: 1.4375rem;
   /*  background: #1a1a1a; */
    background: white;
    height: 45px;
    width: 45px;
    line-height: 45px;
    text-align: center;
    border-radius: 50%;
    transition: 0.3s;
    cursor: pointer;
}
.center .content .fas:hover{
    background: #4CAF50;
}
.center .content .text{
    font-size: 1.0625rem;
    font-weight: 500;
    padding-left: 10px;
}
.center .content .phone{
    margin: 15px 0;
}
.right form .text{
    font-size: 1.0625rem;
    margin-bottom: 2px; 
    color: #656565;
}
.right form .msg{
    margin-top: 10px;
}
.right form input, .right form .msgForm{
    width: 100%;
    font-size: 1.0625rem;
   /*  background: #151515; */
    padding-left: 10px;
    border: 1px solid #222222;
}
.right form input:focus,
.right form .msgForm:focus{
    outline-color: #3498db;
}
.right form input{
    height: 35px;
}
.right form .btn{
    margin-top: 10px;
}
.right form .btn button{
    height: 40px;
    width: 100%;
    border: none;
    outline: none;
    background: #125688;
    font-size: 1.0625rem;
    font-weight: 500;
    cursor: pointer;
    transition: .3s;
}
.right form .btn button:hover{
    background:  #4CAF50;
}
.bottom center{
     align-content:
 /*  background: #444; */
   /* color: #fff;  */
    padding: 20px;
    margin-top:130px;
    padding: 5px;
    font-size: 0.9375rem;
   background: white; 
    width: 80%;
}
.bottom center span{
    color: #656565;
}
.bottom center a{
    color: black;
    text-decoration: none;
}
.bottom center a:hover{
    text-decoration: underline;
}
@media screen and (max-width: 900px) {
    footer{
        position: relative;
        bottom: 0px;
    }
    .main-content{
        flex-wrap: wrap;
        flex-direction: column;
    }
    .main-content .box{
        margin: 5px 0;
    }
}

  </style> 
  </head> 
  
  <body>
 
  <!--  header -->
  <jsp:include page ="userheader.jsp"/>
            <c:choose>
		    <c:when test="${not empty listcustomercartitem}">
    <main>
    <div class="basket">
      
        <!-- <div class="basket-module" style="background-color:white;">
        <label for="promo-code"><h2 style="color:green;">Enter a promotional code</h2></label>
        <input id="promo-code" type="text" name="promo-code" maxlength="5" class="promo-code-field" style="width:35%;">
        <button class="promo-code-cta" style="background-color:#4CAF50;">Apply</button>
        </div> -->
        
          <div class="basket-labels" style="background-color:white;width:101%;padding:0px 7px;">
          <ul>
          <li class="item item-heading" style="color:black;font-size:16px;">Item</li>
          <li class="price" style="color: black;font-size:16px;">Price</li>
          <li class="quantity" style="color:black;font-size:16px;">Quantity</li>
          <li class="subtotal" style="color: black;font-size:16px;">Subtotal</li>
          </ul>
         </div>

<c:set var="s" value="0"></c:set>
<c:forEach var="cartitem" items="${listcustomercartitem}">

<c:set var="s" value="${s+ cartitem.product.price-cartitem.product.discount * cartitem.product.price/100 * cartitem.product.quantity}"></c:set>
      <div class="basket-product" style="background-color:white; width:101%;padding:15px 7px;">
      <div class="item">

<div class="product-image">
<spring:url value="/images" var="images"/>
<img src="${images}/${cartitem.product.imageName}" style="width: 100%;"/>
</div>
            <div class="product-details" style="background-color:white;">
            <h1 style="color: red;"><strong></span></strong>${cartitem.product.productName}</h1><!-- <span class="item-quantity"> -->
            <p><strong>${cartitem.product.productName},${cartitem.product.size}</strong></p>
            <p>Product Id -${cartitem.product.productid} </p>
            </div>
            </div>
        
        <!--   &#8377; -->
        <div class="price" style="ba">&#8377 ${cartitem.product.price-cartitem.product.discount*cartitem.product.price/100} /-</div>
        <div class="quantity">
        <input type="number" value="${cartitem.product.quantity}" class="quantity-field" min="1" max="15">
        </div>
        
<%-- <div class="quantity">
<input type="button" onclick="decrementValue()" value="-" />
<input type="text"  name="quantity" id="number" class="quantity-field" value="${item.product.quantity}" />
<input type="button" onclick="incrementValue()" value="+" />
</div> --%>
        
      <div class="subtotal"> &#8377 ${cartitem.product.price-cartitem.product.discount * cartitem.product.price/100} /-</div>
      <div class="remove">
      <a href="${pageContext.request.contextPath}/cart/deleteCartItem/${cartitem.cartitemid}" onclick="return confirm('Are you sure to delete?')"><i class="fa fa-trash" style="color:red;padding:15px 15 px;margin-left:10" title="remove product"></i></a>
      </div>
      </div>
      </c:forEach>
      <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        /* background-color:#4CAF50; */
        background-color:#FFA500;
        border-radius: 6px;
        outline: none;margin-top:10px;font-size:15px;margin-bottom:5%;"><i class='fas fa-angle-left' style='font-size:18px'></i>  Continue Shopping</a>
        
        
       <strong style="margin-left:30%;font-size:15px;">Total &#8377; ${s} /-</strong>
        
        <a href="${pageContext.request.contextPath}/order/PickupAddress" style="display: inline-block;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:10px;font-size:15px;float: right;">CheckOut <i class='fas fa-angle-right' style='font-size:18px'></i></a>
        </div>
        </main>
        </c:when>
       <c:otherwise>
  <div class="centercontent" style="margin-top:30px;height:20%;">
  <span style="margin-left:15%;font-size:150%;">There are no items in your cart.</span>
  <hr style="margin-left:15%;margin-right:13%">
  <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        /* background-color:#4CAF50; */
        background-color:#FFA500;
        border-radius: 6px;
        outline: none;margin-top:10px;font-size:15px;margin-bottom:5%;margin-left:15%;"><i class='fas fa-angle-left' style='font-size:18px'></i>  Continue Shopping</a>
        </div>
           </c:otherwise>
           </c:choose>
 <!--  ............................  -->
      <div class="footer">
      <div class="main-content">
      <div class="left box">

<h2>VeggieFridge</h2>
<div class="content"> 
                            <a href="#" style="color:white">About Us</a><br><br>
                            <a  href="#" style="color:white">Privacy Policy</a><br><br>
                            <a href="#"  style="color:white">Help</a><br><br>
                            <a href="#"  style="color:white">Terms And Condition</a><br><br>
                           <!--  <a href="#"  style="color:white">Carriers</a><br><br> -->
                           <!--  <a href="#"  style="color:white">Affiliate</a><br><br> -->
                            <a href="#"  style="color:white">In News</a><br><br>
                           <!--  <a href="#"  style="color:white">vf instant</a><br><br> -->
                            
</div>
</div>
<div class="center box">
                    <h2>
Address</h2>
<div class="content">
                        <div class="place">
                            <span class="fas fa-map-marker-alt"></span>
                            <span class="text">Birendranagar, Surkhet</span>
                        </div>
<div class="phone">
                            <span class="fas fa-phone-alt"></span>
                            <span class="text">+089-765432100</span>
                        </div>
<div class="email">
                            <span class="fas fa-envelope"></span>
                            <span class="text">abc@example.com</span>
                        </div>


                            <div class="social"> 
                            <h4>Social</h4><br>
                            <a href="https://facebook.com/coding.np"><span class="fab fa-facebook-f" style="background-color:#3B5998;color:white;"></span></a>
                            <a href="#"><span class="fab fa-twitter" style="background-color: #55ACEE;color:white;"></span></a>
                            <a href="https://instagram.com/coding.np" ><span class="fab fa-instagram" style="background-color: #125688;color:white;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-linkedin"  style="background-color:  #007bb5;color:white;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-pinterest"  style="background-color: #bb0000;color:white;"></span></a>
                            </div>

</div>
</div>
<div class="right box" >
                    <h2>
Contact us</h2>
<div class="content">
                        <form action="#">
                            <div class="email">
                                <div class="text">
Email *</div>
<input type="email" required>
                            </div>
<div class="msg">
                                <div class="text">
Message *</div>
<!-- NOTE: Due to more textarea tag I got an error. So I changed the textarea name to changeit. Please change that changeit name to textarea -->
<changeit id=".msgForm" rows="2" cols="25" required></changeit> <!-- replace this changeit name to textarea -->

                            <br />
<div class="btn">
<button type="submit">Send</button>
                            </div>
                            </form> <br>
       
    <h4 >Download Apps</h4><br>
     <table>
     <th> 
    <a href="abc.htm">                      
    <spring:url value="/images" var="images" />
    <img src="${images}/Apple-App-store-icon.png" width="100" height="40" style="float: right; margin-right:7%"/>
    </a> 
    </th>
    <th>
    <a href="abc.htm">                        
    <spring:url value="/images" var="images" />
    <img src="${images}/Google-App-store-icon.png" width="100" height="40" style="float: right;"/>
    </a>      
    </th>
    </table>                         
    </div>

                    <div class="bottom">
                    <center>
                    <span class="credit">Created By <a href="https://youtube.com/c/codingnepal">vf</a> | </span>
                    <span class="far fa-copyright"></span> 2020 All rights reserved.
                    </center>
                    </div>

</div>
</div>
</div>


 <script type="text/javascript">
  window.onload = function() {
    var selItem = sessionStorage.getItem("SelItem");  
    $('#sort-item').val(selItem);
    }
    $('#sort-item').change(function() { 
        var selVal = $(this).val();
        sessionStorage.setItem("SelItem", selVal);
    });
   </script>
   
  <!-- ..............slider script.................. -->
  
  </body>
  </html>
  