
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

.footer{
    margin-left:13%;
    margin-right:13%;
    position:relative;
    width:74%;
    height:500px;
    background: #4CAF50; 
    position:relative;
   /*  padding: 20px;
    padding: 20px; */
    
   
  
    /* border:1px solid black;  */
    
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
     height:350px;
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

/* .................... */
/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;

}

/* Next & previous buttons */
 .prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  padding: 18px;
  margin-top: -22px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

 /* Caption t
.text {
 /*  color: #f2f2f2; */
  font-size: 15px;
  padding: 8px 12px;
  position:relative;
  bottom: 8px;
  width: 100%;
  text-align: center;
} 
 */
/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  -webkit-animation-name: fade;
  -webkit-animation-duration: 1.5s;
  animation-name: fade;
  animation-duration: 1.5s;
}

@-webkit-keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

@keyframes fade {
  from {opacity: .4} 
  to {opacity: 1}
}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
  .prev, .next,.text {font-size: 11px}
}
.container{
    width: 100%;
    margin: auto;
    overflow: hidden;
  /*   background: skyblue; */
    margin-top: 20px;
    margin-right: 23%;
}

.container ul{
    padding:0px;
    margin:0px;
}


.container ul li{
    float:left;
    list-style: none;
    width:20%;
    height:400px;
  /*   background: pink; */
    margin :24px 0px 24px 59px; 
   /*  border:2px solid blue; */
   border:1px solid #d9d9d9; 
   box-sizing: border-box;
   transition: 1s;
  
}
.container ul li:hover{
   /*  opacity: 0.7; */
   
     	transform: scale(1.1);
		/* background:#FFEFD5;  */
		z-index: 2;
	  /*  box-shadow: 2px 2px 2px #000; */
}

.container ul li .product-meta{
    width: 105%;
    height:100px;
    line-height: 50px;
    
   /*  background: blue;  */   
  /*  background: pink; */
    text-align: left;
    color:white;
    font-size: 18px;
   
}
.container ul li .product-meta{


}
.container ul li  .product-price-wrap {
  width: 100%;
  height:21%;
  display: -ms-grid;
  display: grid; */
 -ms-grid-columns: auto auto;
  margin-top: 90%;
}
.container ul li  .product-price-wrap .left {
  -ms-grid-column-align: start;
      justify-self: start;
}

.container ul li .product-price-wrap .left .price {
 /*  color: #111; */
  color:black;
  font-weight: 700;
}

.container ul li  .product-price-wrap .left .old-price {
  font-size: 14px;
  text-decoration: line-through; 
 /*  color: #999; */
  color:black;
  font-weight: 300;
  position: relative;
/*   display: block; */
   color:black;
}
.container ul li  .product-price-wrap .left .old-price {
  font-size: 14px;
  text-decoration: line-through; 
 /*  color: #999; */
  color:black;
  font-weight: 300;
  position: relative;
/*   display: block; */
   color:black;
}
.container ul li  .product-price-wrap .right {
 /*  -ms-grid-column-align: end;
      justify-self: end; */
}

.container ul li  .product-price-wrap .right .btn {
  float:right;
  left:50%;
  /* background-color: #1864ff; */
  background-color:#4CAF50;
  border: 0;
  color: #ffffff;
  font-size: 14px;
  font-weight:600;
  padding: 10px 20px;
  border-radius: 3px;
   -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out; 
 
}
.container ul li .product-price-wrap .right .btn:hover, .card .product-meta .product-price-wrap .right .btn:focus, .card .product-meta .product-price-wrap .right .btn:active {
  outline: none;
  cursor: pointer;
 background-color: green;
}

 .label-clip {
  background-color: #1864ff; 
  background-color: #4CAF50;
  border-radius: 0 3px 3px 3px;
  font-size: 14px;
  color: #ffffff;
  font-weight: 600;
  text-align: center;
  padding: 5px 10px;
  z-index: 1;
  top: -10px;
  left: 128px;
  position: relative;
  width:38%;
} 

.label-clip::before {
  content: '';
  /* border-right-color: #123bb4 !important; */
  border-right-color:#4CAF50 !important;
  position:absolute;
  top: 0;
  left: -10px;
  height: 0;
  width: 0;
  border-right: 10px solid transparent;
  border-top: 10px solid transparent;
  background: none !important;
} 
@media screen and (max-width:1250px){
    .container ul li{
        width:40%;
        margin-left: 40px;   
    }
    /* ........................................... */
 
 
  </style>  
  <body >
 
   <!--  header -->
   <jsp:include page = "header.jsp"/>
                
  <!--   close header  -->
 <!--  <div class="slideshow-container" style="margin-top:13px; margin-right:27%;">

  <div class="mySlides fade"> -->
  <%-- <spring:url value="/images" var="images" />
  <img src="${images}/bigimage.jpg" width="1600" height="450" style="margin-top:12%;"/>
 </div>

  <div class="mySlides fade">
 <!--  <div class="numbertext">2 / 3</div> -->
  <spring:url value="/images" var="images" />
  <img src="${images}/c4.jpg" width="1300" height="400"/>
  </div>

 <div class="mySlides fade">
 <spring:url value="/images" var="images" />
 <img src="${images}/c5.jpg" width="1300" height="400"/>
 </div>

<a class="prev" onclick="plusSlides(-1)">&#10094;</a>
<a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<script>
var slideIndex = 1;
showSlides(slideIndex);

function plusSlides(n) {
  showSlides(slideIndex += n);
}

function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  var i;
  var slides = document.getElementsByClassName("mySlides");
  var dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}    
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
      slides[i].style.display = "none";  
  }
  for (i = 0; i < dots.length; i++) {
      dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
}
  </script> --%>
<!--   
  <hr>
  <h1 style="color:gray;font-size:140%;margin-top:2%;text-align: center;">Vegetables And Milk</h1>
  <hr>
   -->
  <div class="carousel">
  <div class="container">
  
 <%--  <ul>
  <c:forEach var="product" items="${listProduct}">
 <!--  1 -->
  <li>
  <div class="product-img">
  <h4 class="label-clip">Get ${product.discount}% OFF</h4>
   
  <spring:url value="/images" var="images" />
  <img src="${images}/${product.imageName}"/ width="140" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;">
  </div>
            <div class="product-meta">
            <a href="#0" style="color: red;text-decoration: none;">${product.productName}</a>
            <h6 style="color: black;">${product.description}</h6>
            <h6 style="color: black;"> Size:${product.size} g<h6>
            </div>
       
            <div class="product-price-wrap" style="background-color:#f1f1f1; margin-top:78%">
                   <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
 
                   <span class="old-price">Rs ${product.price}</span>
                    Rs ${product.price-product.discount * product.price/100}
                    </span>
            
            <button  id="b" type="button" onclick="window.location.href='${pageContext.request.contextPath }/cart/addToCartPageItem/${product.productid}'" style="float:left;
  /* background-color: #1864ff; */
  background-color:#4CAF50;
  border: 0;
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  padding: 7px 28px;
  border-radius: 3px;
 margin-left:19%;margin-top:14%;"> 
			
			<i class="fa fa-shopping-cart"></i> 
			Add to cart
		    </button>
                    </div>
           
        
        <div class="right">
         
        "${pageContext.request.contextPath}/cart/buy/${product.productid}"
        <!-- add/{productid}/product -->
      
        <!-- class="btn btn-success" -->
           
          onclick="window.location.href='${pageContext.request.contextPath}/cart/buy/${product.productid}'"  
         
            <button  id="b" type="button" onclick="window.location.href='${pageContext.request.contextPath}/cart/buy/${product.productid}'"> 
			<i class="fa fa-shopping-cart"></i> 
			Add to cart
		    </button> 
        </div></div> 
        </li>
       </c:forEach>
        
      
  <hr>
  <h1 style="color:gray;font-size:140%;margin-top:2%;text-align: center;">Bank Offers</h1>
  <hr>
  <table style="border-spacing:30px;">
   <th>
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/icici.jpg" width="270" height="280" />
   </a>
   </th>
  
   
   
   <th>
    <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/induslandbank.jpg"  width="270" height="280"/>
    </a>
   </th>
  
   
  
   <th>
    <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/paytm.jpg"  width="270" height="280"/>
   </a>
   </th>
   
   <th>
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/standard.jpg"  width="270" height="280"/>
   </a>
   </th>
   </tr>  
  </table>
  <br>
   </ul> --%>
   </div>
   </div>

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
                            <a href="#"  style="color:white">Carriers</a><br><br>
                            <a href="#"  style="color:white">Affiliate</a><br><br>
                            <a href="#"  style="color:white">In News</a><br><br>
                            <a href="#"  style="color:white">vf instant</a><br><br>
                            <a href="#"  style="color:white">vf daily</a><br><br>
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
 
 
  
  </body>
  </html>
  