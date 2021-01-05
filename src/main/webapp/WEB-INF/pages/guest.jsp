
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>
   
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

 <!DOCTYPE HTML>
 <html lang="en" dir="ltr">
 <head>
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- <script type="text/javascript" src="scripts/jquery.cookies.2.2.0.min.js"></script> --> 
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <link rel="icon" href="./image/icon.png" />
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto+Condensed:ital,wght@0,300;0,400;0,700;1,300;1,400;1,700&display=swap" rel="stylesheet"> 
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Online Vegetable And Milk Shopping in India- VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <style>
     
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,800');   
body {font-family: Arial, Helvetica, sans-serif;}
{
box-sizing: border-box;
}
.mainsplash{
  /* background: #f6f5f7; */
  outline: #4CAF50 solid 10px;
  display: none;  /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1001; /* Sit on top */
  padding-top: 10px;  /* Location of the box */
  left: 0;
  top:  0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
 /*  overflow: auto; /* Enable scroll if needed */ */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.3); /* Black w/ opacity */
  box-shadow: 1px 2px 5px 3px white;
}
.splash{
   text-align: center;
   margin-left:32%;
   margin-top:5%;
   font-family: 'Montserrat', sans-serif;
   background-color: #fff;
  /*  border-radius: 10px; */
  /*  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22); */
	position: relative;
	overflow: hidden;
	width: 450px;
    max-width: 100%;
	min-height: 100px;
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
 select{
  width:80%;
  padding: 8px;
  /* background-color:#f1f1f1; */
  border-radius: 4px;
  resize: vertical;
  align-content: center;
} 
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 14px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top: 10px;
}

input[type=submit]:hover {
  background-color: #45a049;
}

@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
}

/* Extra styles for the cancel button */
.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}
.login {
  padding: 16px;
}
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  padding-top: 60px;
  box-shadow: 1px 2px 5px 3px white;
}
/* Modal Content/Box */
.modal-content {
  
  background-color: #fefefe;
  margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 25%;
  height: 60%; /* Could be more or less, depending on screen size */
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
  overflow: hidden;
 border-radius: 5px;
}

button:hover {
  opacity: 0.8;
}

/* The Close Button (x) */
.close {
  position: absolute;
  right: 25px;
  top: 0;
  color: #000;
  font-size: 35px;
  font-weight: bold;
}
.close:hover,
.close:focus {
  color: red;
  cursor: pointer;
}
/* Add Zoom Animation */
.animate {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}
@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
} 
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
/* ............................signup...................... */
.register{
  display: none;/* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.0); /* Black w/ opacity */
  padding-top: 60px;
  box-shadow: 1px 2px 5px 3px white;
}

/* Modal Content/Box */
.register-content {
 justify-content:center;
  background-color: #fefefe;
 /*  margin: 3% auto 15% auto; */ /* 5% from the top, 15% from the bottom and centered */
  border: 1px solid #888;
  width: 25%;
  height: 84%; /* Could be more or less, depending on screen size */
  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
  overflow: hidden;
  position: fixed;
  margin-left: 37%;
 /*  margin-top: 1%; */
  border-radius: 4px;
  font-size: 83%; 
}
hr {
  border: 1px solid #f1f1f1;
   margin-bottom: 10px;
   margin-top: 10px;
}
.account {
  padding: 16px;
}

/* Clear floats */
.clearfix::after {
  content: "";
  clear: both;
  display: table;
}
/* Slider Css */
    .galleryContainer {
    width: 100%;
    height: 500px;
    max-width: 1265px;
    margin: auto;
    user-select: none;
    /* box-shadow: 0px 0px 3px 1px #00000078; */
   /*  padding: 10px; */
    /*  box-sizing: border-box; */
    margin-left:160px;
    margin-right:145px;
    
}
.galleryContainer .slideShowContainer{
    width: 100%;
    height: 90%;
    overflow: hidden;
    background-color: gainsboro;
    position: relative;
}
.galleryContainer .slideShowContainer #playPause{
    width: 32px;
    height: 32px;
    position: absolute;
    background-image: url(${images}/playpouse.png);
    background-repeat: no-repeat;
    z-index: 5;
    background-size: cover;
    margin: 5px;
    cursor: pointer;
}
.galleryContainer .slideShowContainer #playPause:hover{
    opacity: .7;
}
.galleryContainer .slideShowContainer .imageHolder{
    width: 100%;
    height: 100%;
    position: absolute;
   /*  opacity: 0; */
}
.galleryContainer .slideShowContainer .imageHolder img{
    width: 100%;
    height: 100%;
}
.galleryContainer .slideShowContainer .imageHolder .captionText{
    display: none;
}

.galleryContainer .slideShowContainer .leftArrow,.galleryContainer .slideShowContainer .rightArrow{
    width: 50px;
    background: #00000036;
    position: absolute;
    left: 0;
    z-index: 1;
    transition: background 0.5s;
    height: 72px;
    top: 50%;
    transform: translateY(-50%);
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}

.galleryContainer .slideShowContainer .rightArrow {
    left: auto;
    right: 0;
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}
.galleryContainer .slideShowContainer .leftArrow:hover,.galleryContainer .slideShowContainer .rightArrow:hover{
    background: #000000a8;
    cursor: pointer;
}
.galleryContainer .arrow{
    display: inline-block;
    border: 3px solid white;
    width: 10px;
    height: 10px;
    border-left: none;
    border-bottom: none;
    margin: auto;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}
.galleryContainer .arrow.arrowLeft{
    transform: rotateZ(-135deg);
}
.galleryContainer .arrow.arrowRight{
    transform: rotateZ(45deg);
}

.galleryContainer .slideShowContainer>.captionTextHolder{
    position: absolute;
    bottom: 0;
    z-index: 1;
    color: white;
    font-family: sans-serif;
    font-size: 20px;
    text-align: center;
    width: 100%;
    background: #00000047;
    height: 50px;
    line-height: 50px;
    overflow: hidden;
}
.galleryContainer .slideShowContainer>.captionTextHolder>.captionText{
    margin: 0;
}

.galleryContainer #dotsContainer{
    width: 100%;
    height: 10%;
    text-align: center;
    padding-top: 20px;
    box-sizing: border-box;
}
.galleryContainer #dotsContainer .dots{
    display: inline-block;
    width: 15px;
    height: 15px;
    border-radius: 50%;
    margin-left: 5px;
    background-color: #bbb;
    cursor: pointer;
    transition:background-color 0.5s;
}
.galleryContainer #dotsContainer .dots:first-child{
    margin-left: 0;
}
.galleryContainer #dotsContainer .dots:hover,.galleryContainer #dotsContainer .dots.active{
    background-color: #717171;;
}

.galleryContainer .moveLeftCurrentSlide{
    animation-name: moveLeftCurrent;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;

}
.galleryContainer .moveLeftNextSlide{
    animation-name: moveLeftNext;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
@keyframes moveLeftCurrent {
    from {margin-left: 0;opacity: 1;}
    to {margin-left: -100%;opacity: 1;}
}
@keyframes moveLeftNext {
    from {margin-left: 100%;opacity: 1;}
    to {margin-left: 0%;opacity: 1;}
}


.galleryContainer .moveRightCurrentSlide{
    animation-name: moveRightCurrent;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
.galleryContainer .moveRightPrevSlide{
    animation-name: moveRightPrev;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
@keyframes moveRightCurrent {
    from {margin-left: 0;opacity: 1;}
    to {margin-left: 100%;opacity: 1;}
}
@keyframes moveRightPrev {
    from {margin-left: -100%;opacity: 1;}
    to {margin-left: 0%;opacity: 1;}
}
.slideTextFromBottom {
    animation-name: slideTextFromBottom;
    animation-duration: 0.7s;
    animation-timing-function: ease-out;
}
@keyframes slideTextFromBottom {
    from {opacity: 0;margin-top: 100px}
    to {opacity: 1;margin-top: 0px;}
}
.slideTextFromTop {
    animation-name: slideTextFromTop;
    animation-duration: 0.7s;
    animation-timing-function: ease-out;
}
 @keyframes slideTextFromTop {
    from {opacity: 0;margin-top: -100px}
    to {opacity: 1;margin-top: 0px;}
}

/* CLOSE SLIDER CSS */

/* PRODUCT CSS */
.container{
    width: 85%;
    margin: auto;
    overflow: hidden;
  /*   background: skyblue; */
    margin-top: 20px;
    margin-right:8%;
}

.container ul{
    padding:0px;
    margin:0px;
}

.container ul li{
    float:left;
    list-style: none;
    width:20%;
    height:410px;
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

</style>   
  <body>
  
	<!--  HEADERCODE --> 
 <jsp:include page="header.jsp" />
 
 <div class="mainsplash">
 <div class="splash">
 <div class="row">
 <div class="col-75">  
    
    <form method="post" action="${pageContext.request.contextPath}/continueLocation" modelAttribute="kioskLocation">
    <spring:url value="/images" var="images" />
    <img src="${images}/logo.jpg" width="160" height="115" style= margin-top:2%;"/>
    
       <h6 style="color:#4CAF50; font-size:85%; margin-top:2%; text-align:center;"> Select your city and location to start shopping</h6>
 
       <select id="cities" name="cities" style="padding:12px; border: 1px solid #008000; margin-top:3%;" required>
       <option value=""style="color: black;">Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select>
        
       <select id="location" name="location" style="padding:12px; border: 1px solid #008000;margin-top:2%;" required>
       <option value="" style="color: black;">Select location</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option   value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
       </c:forEach>
      </select>
      </div>
      </div>

                <div style="text-align:center;">
				<input type="submit" value="Continue"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;margin-top: 3%;"/>
			    </div></form><br>

<h5 style="text-align: center;margin-bottom:4%;">Already have an account? <a href="#"  onclick="document.getElementById('id01').style.display='block'" style="color:#4CAF50;text-decoration:none;hover:green;margin-bottom:4%;" class="submitId">Log In</a></h5>
</div>
</div>


 <!--  SLIDERCODE -->
    <div class="galleryContainer">
    <div class="slideShowContainer">
        <div id="playPause" onclick="playPauseSlides()"></div>
        <div onclick="plusSlides(-1)" class="nextPrevBtn leftArrow"><span class="arrow arrowLeft"></span></div>
        <div onclick="plusSlides(1)" class="nextPrevBtn rightArrow"><span class="arrow arrowRight"></span></div>
        <div class="captionTextHolder"><p class="captionText slideTextFromTop"></p></div>
        <div class="imageHolder">
     <spring:url value="/images" var="images" />
	<img src="${images}/organic.jpg"/>1366X768
            <p class="captionText">ORGANIC VEGETABLES</p>
        </div>
         <div class="imageHolder">
           <spring:url value="/images" var="images" />
	<img src="${images}/indian cheery.jpg" />
            <p class="captionText">INDIAN CHERRY</p>
        </div>
        <div class="imageHolder">
            <spring:url value="/images" var="images" />
	<img src="${images}/fresh mango.jpg" />
            <p class="captionText">FRESH MANGO</p>
        </div>
        <div class="imageHolder">
            <spring:url value="/images" var="images" />
	<img src="${images}/c5.jpg" />
            <p class="captionText">FRESH PINAPPLE</p>
        </div>
        <div class="imageHolder">
            <spring:url value="/images" var="images" />
	<img src="${images}/bigimage2.jpg" />
            <p class="captionText">CLEANING</p>
        </div>
        <div class="imageHolder">
           <spring:url value="/images" var="images" />
	<img src="${images}/lastimg.jpg" />
            <p class="captionText">GROCERYY</p>
        </div>
         <div class="imageHolder">
           <spring:url value="/images" var="images" />
	<img src="${images}/f4.jpg" />
            <p class="captionText">FRUITS</p>
        </div>
        </div>
    <div id="dotsContainer"></div>
</div>
<script src="myScript.js">
    var slideIndex,slides,dots,captionText;
function initGallery(){
    slideIndex = 0;
    slides=document.getElementsByClassName("imageHolder");
    slides[slideIndex].style.opacity=1;

    captionText=document.querySelector(".captionTextHolder .captionText");
    captionText.innerText=slides[slideIndex].querySelector(".captionText").innerText;

    //disable nextPrevBtn if slide count is one
    if(slides.length<2){
        var nextPrevBtns=document.querySelector(".leftArrow,.rightArrow");
        nextPrevBtns.style.display="none";
        for (i = 0; i < nextPrevBtn.length; i++) {
            nextPrevBtn[i].style.display="none";
        }
    }

    //add dots
    dots=[];
    var dotsContainer=document.getElementById("dotsContainer"),i;
    for (i = 0; i < slides.length; i++) {
        var dot=document.createElement("span");
        dot.classList.add("dots");
        dotsContainer.append(dot);
        dot.setAttribute("onclick","moveSlide("+i+")");
        dots.push(dot);
    }
    dots[slideIndex].classList.add("active");
}
initGallery();
function plusSlides(n) {
    moveSlide(slideIndex+n);
}
function moveSlide(n){
    var i;
    var current,next;
    var moveSlideAnimClass={
          forCurrent:"",
          forNext:""
    };
    var slideTextAnimClass;
    if(n>slideIndex) {
        if(n >= slides.length){n=0;}
        moveSlideAnimClass.forCurrent="moveLeftCurrentSlide";
        moveSlideAnimClass.forNext="moveLeftNextSlide";
        slideTextAnimClass="slideTextFromTop";
    }else if(n<slideIndex){
        if(n<0){n=slides.length-1;}
        moveSlideAnimClass.forCurrent="moveRightCurrentSlide";
        moveSlideAnimClass.forNext="moveRightPrevSlide";
        slideTextAnimClass="slideTextFromBottom";
    }

    if(n!=slideIndex){
        next = slides[n];
        current=slides[slideIndex];
        for (i = 0; i < slides.length; i++) {
            slides[i].className = "imageHolder";
            slides[i].style.opacity=0;
            dots[i].classList.remove("active");
        }
        current.classList.add(moveSlideAnimClass.forCurrent);
        next.classList.add(moveSlideAnimClass.forNext);
        dots[n].classList.add("active");
        slideIndex=n;
        captionText.style.display="none";
        captionText.className="captionText "+slideTextAnimClass;
        captionText.innerText=slides[n].querySelector(".captionText").innerText;
        captionText.style.display="block";
    }

}
var timer=null;
function setTimer(){
    timer=setInterval(function () {
        plusSlides(1) ;
    },3000);
}
setTimer();
function playPauseSlides() {
    var playPauseBtn=document.getElementById("playPause");
    if(timer==null){
        setTimer();
        playPauseBtn.style.backgroundPositionY="0px"
    }else{
        clearInterval(timer);
        timer=null;
        playPauseBtn.style.backgroundPositionY="-33px"
    }
}
    </script>
</body>
</html>
<script>
    
var slideIndex,slides,dots,captionText;
function initGallery(){
    slideIndex = 0;
    slides=document.getElementsByClassName("imageHolder");
    slides[slideIndex].style.opacity=1;

    captionText=document.querySelector(".captionTextHolder .captionText");
    captionText.innerText=slides[slideIndex].querySelector(".captionText").innerText;

    //disable nextPrevBtn if slide count is one
    if(slides.length<2){
        var nextPrevBtns=document.querySelector(".leftArrow,.rightArrow");
        nextPrevBtns.style.display="none";
        for (i = 0; i < nextPrevBtn.length; i++) {
            nextPrevBtn[i].style.display="none";
        }
    }

    //add dots
    dots=[];
    var dotsContainer=document.getElementById("dotsContainer"),i;
    for (i = 0; i < slides.length; i++) {
        var dot=document.createElement("span");
        dot.classList.add("dots");
        dotsContainer.append(dot);
        dot.setAttribute("onclick","moveSlide("+i+")");
        dots.push(dot);
    }
    dots[slideIndex].classList.add("active");
}
initGallery();
function plusSlides(n) {
    moveSlide(slideIndex+n);
}
function moveSlide(n){
    var i;
    var current,next;
    var moveSlideAnimClass={
          forCurrent:"",
          forNext:""
    };
    var slideTextAnimClass;
    if(n>slideIndex) {
        if(n >= slides.length){n=0;}
        moveSlideAnimClass.forCurrent="moveLeftCurrentSlide";
        moveSlideAnimClass.forNext="moveLeftNextSlide";
        slideTextAnimClass="slideTextFromTop";
    }else if(n<slideIndex){
        if(n<0){n=slides.length-1;}
        moveSlideAnimClass.forCurrent="moveRightCurrentSlide";
        moveSlideAnimClass.forNext="moveRightPrevSlide";
        slideTextAnimClass="slideTextFromBottom";
    }

    if(n!=slideIndex){
        next = slides[n];
        current=slides[slideIndex];
        for (i = 0; i < slides.length; i++) {
            slides[i].className = "imageHolder";
            slides[i].style.opacity=0;
            dots[i].classList.remove("active");
        }
        current.classList.add(moveSlideAnimClass.forCurrent);
        next.classList.add(moveSlideAnimClass.forNext);
        dots[n].classList.add("active");
        slideIndex=n;
        captionText.style.display="none";
        captionText.className="captionText "+slideTextAnimClass;
        captionText.innerText=slides[n].querySelector(".captionText").innerText;
        captionText.style.display="block";
    }

}
var timer=null;
function setTimer(){
    timer=setInterval(function () {
        plusSlides(1) ;
    },3000);
}
setTimer();
function playPauseSlides() {
    var playPauseBtn=document.getElementById("playPause");
    if(timer==null){
        setTimer();
        playPauseBtn.style.backgroundPositionY="0px"
    }else{
        clearInterval(timer);
        timer=null;
        playPauseBtn.style.backgroundPositionY="-33px"
    }
}
     </script>

<!--  ALL PRODUCT -->
<!-- <div class="carousel"> -->
<div class="container">
		  <ul>
  <c:forEach var="product" items="${listProduct}">
 <!--  1 -->
  <li>
  <div class="product-img">
  <h4 class="label-clip">Get ${product.discount}% OFF</h4>
   
  <spring:url value="/images" var="images" />
  <img src="${images}/${product.imageName}"/ width="140" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;">
  </div>
            <div class="product-meta" style="margin-left:10px;">
            <a href="#0" style="color: red;text-decoration: none;">${product.productName}</a>
            <p style="color: black;">${product.description}</p>
            <p style="color: black;"> Size:${product.size}gm</p>
            <c:choose>
		    <c:when test="${product.quantity < 1}">
		    <span style="color:red">OUT OF STOCK !</span>
				</c:when>
				<c:otherwise>				
				<%-- <h6>Qty. Available:${product.quantity}</h6> --%>
				</c:otherwise>
			
			</c:choose>
            </div>
       
            <div class="product-price-wrap" style="background-color:#f1f1f1; margin-top:72%;">
                   <div class="left">
                   <span class="price" style="margin-left:10px;margin-top:30px;">
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
  padding: 9px 30px;
  border-radius: 3px;
 margin-left:19%;margin-top:10%;"> 
			
			<i class="fa fa-shopping-cart"></i> 
			Add to cart
		    </button>
            </div>
           
        
        <div class="right">
         
        <%-- "${pageContext.request.contextPath}/cart/buy/${product.productid}"
         --%><!-- add/{productid}/product -->
      
        <!-- class="btn btn-success" -->
           
         <%--  onclick="window.location.href='${pageContext.request.contextPath}/cart/buy/${product.productid}'"  
          --%>
            <%-- <button  id="b" type="button" onclick="window.location.href='${pageContext.request.contextPath}/cart/buy/${product.productid}'"> 
			<i class="fa fa-shopping-cart"></i> 
			Add to cart
		    </button>  --%>
        </div></div> 
        </li>
       </c:forEach>
       </ul>

	

	<!--  CLOSE MANAGE PRODUCT -->
</div>


<!--  Footer Code -->
<jsp:include page="footer.jsp" />




























































<!-- ..................................login popup................. -->

  <div id="id01" class="modal">
          
          <c:if test="${not empty error}">
		  <div class="error">${error}</div>
		  </c:if>
		
		<c:if test="${not empty msg}">
		<div class="msg">${msg}</div>
		</c:if>
		
  <form class="modal-content animate" action="${pageContext.request.contextPath }/appLogin" method="post"  modelAttribute="customer">
  <h2 style="text-align: center;margin-top: 2%; color:#4CAF50;">Log In VeggieFridge</h2>
      <div class="login">
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required  style="width: 100%;
  padding: 14px 22px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   border-radius: 5px;
  /*   background-color:#f1f1f1; */">

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required style="width: 100%;
  padding: 14px 22px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   border-radius: 5px;
   /*  background-color:#f1f1f1; */">
        
  <button type="submit" style=" background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%; border-radius: 5px;">Login</button>
  
     <label>
     <input type="checkbox" checked="checked" name="remember"> Remember me
     </label>
     </div>

   <div class="login" style="background-color:#f1f1f1;height:60px;">
   <a href="${pageContext.request.contextPath }/login/logout" style="
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;">Cancel</a>
        
    <span class="psw" style="float: right;"><a href="${pageContext.request.contextPath }/login/forgotPassword" style="text-decoration: none;color:dodgerblue;">Forgot Password?</a></span>
   </div>
  <a href="##" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;" onclick="document.getElementById('id02').style.display='block'" class="submitId">New to VeggieFridge?Create an account</a><button type="button" onclick="document.getElementById('id02').style.display='block'" class="submitId"  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;">SignUp</button> 
  </form>
</div>

<!-- .....................sign up............ -->

<div class="right" style="float: right;">
               
<!-- Trigger/Open The Modal -->

<a href="#" id="myBtn" style="text-decoration: none;">${kiosklocation.location}${kiosklocation.cities}</a> 
 
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  <!-- <span class="close">&times;</span> -->
  <form method="post" action="${pageContext.request.contextPath}/home/continueLocation" modelAttribute="kioskLocation">
  <p style="width:20%;text-align: right;"><h4 style="color: green;">Choose your city  to start shopping</h4>
  <div class="row">
  <div class="col-75">
      
       <select id="cities" name="cities" id="sort-item">
       <option value=""style="color: black;">Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select><br><br>
        
      <select id="location" name="location" id="sort-item">
      <option value="" style="color: black;">Select location</option> 
      <c:forEach items="${listkiosklocation}" var="kiosklocation">
      <%--  <option   value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option> --%>
      <option value="${kiosklocation.cities eq kiosklocation.location}">${kiosklocation.cities eq kiosklocation.location}</option>
      </c:forEach>
      </select>
      </div>
      </div>

 <div style="text-align:center;">
 <input type="submit" value="Continue" formaction="${pageContext.request.contextPath}/home/viewhome"/>
 </div></p></form>
 </div>
</div>
 </div>
 <script>
// Get the modal
var modal = document.getElementById("myModal");
  
// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

/* // When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}  */

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<!-- .......................................signup.......................-->
<div class="register" id="id02">
<div class="register-content">
<form method="post"  class="signup-content"  action="${pageContext.request.contextPath}/addguestcustomer" modelAttribute="customer" >

     <font color='red'style="font-size:16px;text-align: center;"><span id="errId"></span></font>

      <h1 style="text-align: center; color: green; margin-top:4%;">Sign Up</h1>
      <p style="margin-top: 1%; margin-left: 2%;">Please fill in this form to create an account.</p>
      <hr>
  
  
  <label for=" firstname" style="margin-left: 2%;">First Name:</label>
  <spring:bind path="customer.firstName">
  <input type="text" name="${status.expression}" value="${status.value}"  placeholder="First Name" required style="width: 67%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:3%;"></spring:bind>
  
  <label for="lastname" style="margin-left:2%;">Last Name :</label>
  <spring:bind path="customer.lastName">
  <input type="text" name="${status.expression}" value="${status.value}" placeholder="last Name" required style=" width:67%;
  padding: 8px;	
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:3%;"></spring:bind>
  

 <label for="mobile" style="margin-left: 2%;">Mobile Num:</label>
 <spring:bind path="customer.mobile">
 <input type="text" name="${status.expression}" value="${status.value}" size="10" style="width: 67%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:3%;"/></spring:bind>
  
  
  <label for="city" style="margin-left: 2%;">Select City :</label>
  <select id="locationid" name="cities"  required  style="width: 70%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:4%;"> 
       <option value="" style="margin-left: 2%;">Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select>
        
       
       <label for="location" style="margin-left:2%;">Select Location:</label>
       <select id="locationid" name="location" required   style="width: 67%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:1%;">
       <option value="" style="color: black;">Select location</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
       </c:forEach>
       </select>
       
       
      <label for="email" style="margin-left:2%;">Email :</label>
      <spring:bind path="customer.email">
  
  <input type="email" name="${status.expression}" value="${status.value}" placeholder="Enter Email"  required style="width: 65%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:12%;"></spring:bind>

      
      <label for="psw" style="margin-left:2%;">Password:</label>
  <spring:bind path="customer.password">
  <input type="password" name="${status.expression}" value="${status.value}" placeholder="Enter Password" required style="width: 65%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:7%;"  id="txtPassword" 
  pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" id="psw"></spring:bind>

      
      <label for="confirm-repeat" style="margin-left:2%;">Confirm Psw:</label>
      <spring:bind path="customer.confirmPassword">
      <input type="password"  name="${status.expression}" value="${status.value}" placeholder="confirm Password" required style="width: 65%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:3%;"  id="txtConfirmPassword" ></spring:bind> 
  <hr>
      
        <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px;margin-left:2%;"> Remember me
        </label>

     <p style="margin-left: 2%;">By creating an account you agree to our <a href="#" style="color:dodgerblue;">Terms & Privacy</a>.</p><br>
     <input type="submit" style="width:280px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;margin-left:14%;"value="Sign Up" onclick="return Validate()"  id="btnSubmit">
    
  </form>
  </div>
  
 <script>
$(document).ready(function() {

  setTimeout(function(){
	  $('.mainsplash').css('display','block');
	  },3000); 

});
$('.submitId').click(function(){
	  $('.mainsplash').css('display','none');
	  });

</script>
 
   <script>
	// Get the modal
	var login = document.getElementById('id01');
	
$('.submitId').click(function(){
	  $('.model').css('display','none');
	  });
	</script>
	
	 <script>
	// Get the modal
	var register-content = document.getElementById('id02');
	
	$('.submitId').click(function(){
		  $('.register').css('display','none');
		  });
    
	</script>
  
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
   
    <script type="text/javascript">

      function validatePwds(){
    	    var newPwd = $('#customer.password').val();
    	    var confirmPwd = $('#customer.confirmPassword').val();
    	    if(newPwd!=confirmPwd){
    	    $('#errId').text('New Password And Confirm Password Is Not Match');
    	    return false;
    	    }
    	    return true;
    	}
      </script>
      
      <script type="text/javascript">
    function Validate() {
        var password = document.getElementById("txtPassword").value;
        var confirmPassword = document.getElementById("txtConfirmPassword").value;
        if (password != confirmPassword) {
        	 $('#errId').text('New Password And Confirm Password Is Not Match');
            /* alert("Password And Confirm Password Is Not Match."); */
            return false;
        }
        return true;
    }
</script>
<!-- ........popup code...... -->

<script>
$(document).ready(function() {
      if (document.cookie.indexOf("modal=true") == -1) {
        document.cookie = "modal=true; max-age=null"; // seconds in a day
       /*  $('#popup').modal('show'); */
        setTimeout(function() {
            $('#popup').modal('show');
        }, 4000);
      }
    });
</script>

  </body>
  </html>
  