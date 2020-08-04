
   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>
   
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
   border-radius: 10px;
   box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
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
  background-color:#f1f1f1;
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
/* The Modal (background) */
/*/*  .modal {
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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  
}
 */
/* Modal Content */
  /* .modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 22%;
  margin-left: 68%;
} */

/* The Close Button */
/* .close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
} */

/* .close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
} */

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
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
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

.header{
    margin-left:10%;
    position:relative;
    padding: 20px;
    padding: 20px;
    width: 100%;
    height: 30px;
    /* background: #4CAF50; */
   /*  border:1px solid black; */
}
.footer{
    margin-left:10%;
    margin-right:13%;
    position:relative;
   /*  padding: 20px;
    padding: 20px; */
    width: 78%;
    height: 500px;
    margin-top:px;
    background: #4CAF50; 
    /* border:1px solid black;  */
    
}
.head{
    margin-left:10%;
    position:relative;
    padding: 20px;
    padding: 20px;
    width: 100%;
    height: 20px;
    /* background: #4CAF50; */
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
     height:3840px;
     transition:1s;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex; 
     background-color:#f1f1f1;
   /*  -webkit-box-align: center;
     -ms-flex-align: center;
      align-items: center;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
       justify-content: center;
      */    
}

.logo{
 position:absolute;
 width:30% 
 border:1px;
 float:left;
 margin-right:35%;
}

/* <-- serach operation--> */
/* Style the search field */
form.example input[type=text] {
  padding:8px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 40%;
 /*  background: #f1f1f1; */
  margin-left:10%; 
}
/* Style the submit button */
  form.example button {
  float: left;
  width: 4%;
  padding: 8px;
  background: #4CAF50;
  color: white;
  font-size: 17px;
  border: 1px solid grey; 
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}
form.example button:hover {
  background: green;
}
/* call */
.call{
/* border:1px solid black; */
float:right;
margin-right:19%;
margin-top: 10px;
height:35px;
width:20%;
/* border:1px solid black; */
}
/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
  /* right  */
.right{
float: right;
margin-top:30px;
margin-right:7%;
font:bold;
font-size:16px;

}

.right a {
color: black;
}

 .right a:hover {
        color: #4CAF50;
    }


/* end right */
.navbar {
  overflow: hidden;
  background-color: #4CAF50 ;
  margin-right:51%;
  margin-left: 337px;
  /* border:1px solid black;  */
}

.navbar a {
 /*  margin-right:45%;
  margin-left: 26%; */
  float: left;
  font-size: 20px;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 18px;  
  border: none;
  outline: none;
  color: white;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: ;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  /* background-color: #ddd; */
  background-color:#4CAF50 ;
}

.dropdown:hover .dropdown-content {
  display: block;
}
/* ................... */

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
  background-color: rgba(0,0,0,0.4);
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
  /*  .container ul li .product-img{
  
  width: 60%;
  background-position: center;
  background-size: cover;
  background: no-repeat #1864ff;
  height: 150px;
  margin-right:10px;
  
}  */

/* .container ul li .product-meta .divider {
  border-top: 1px solid #e8eaea;
  margin: 17px auto;
  width: 90%;
}  */
.container ul li .product-meta{


}
.container ul li  .product-price-wrap {
  width: 100%;
  height%;
  display: -ms-grid;
  display: grid; */
 -ms-grid-columns: auto auto;
 margin-top: 90%;
 
 /*  grid-template-columns: auto auto; */
 /*  -webkit-box-align: center;
      -ms-flex-align: center;
          align-items: center; */
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
  -ms-grid-column-align: end;
      justify-self: end;
}

.container ul li  .product-price-wrap .right .btn {
  float:left;
  /* background-color: #1864ff; */
  background-color:#4CAF50;
  border: 0;
  color: #ffffff;
  font-size: 14px;
  font-weight: 600;
  padding: 10px 30px;
  border-radius: 3px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}
.container ul li .product-price-wrap .right .btn:hover, .card .product-meta .product-price-wrap .right .btn:focus, .card .product-meta .product-price-wrap .right .btn:active {
  outline: none;
  cursor: pointer;
 /*  background-color: blue; */
}
  /*  .container   ul li  .label-clip {
   background-color: #1864ff; 
  background-color: #4CAF50;
  border-radius: 0 3px 3px 3px;
  font-size: 14px;
  color: #ffffff;
  font-weight: 600;
  text-align: center;
  padding: 5px 10px;
  z-index: 10;
  top: -10px; 
  left: 30px;
  position: absolute;
  
} */

/* .container   ul li .label-clip::before {
  content: '';
  /* border-right-color: #123bb4 !important; */
  border-right-color:#4CAF50 !important;
  position: absolute;
  top: 0;
  left: -10px;
  height: 0;
  width: 0;
  border-right: 10px solid transparent;
  border-top: 10px solid transparent;
  background: none !important;
}  */
@media screen and (max-width:1250px){
    .container ul li{
        width:40%;
        margin-left: 40px;   
    }
    /* ..................MainPopup......................... */
  </style>  
  <body>
 <div class="mainsplash">
 <div class="splash">
  <div class="row">
  <div class="col-75">  
    
    <form method="post" action="${pageContext.request.contextPath}/home/continueLocation" modelAttribute="kioskLocation">
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

<!-- ..................................login popup................. -->

<div id="id01" class="modal">
  
  <form class="modal-content animate" action="${pageContext.request.contextPath }/login/doLogin" method="post">
  <h2 style="text-align: center;margin-top: 2%; color:#4CAF50;font-family: 'Montserrat', sans-serif;">Log In VeggieFridge</h2>
    <div class="login">
      <label for="email"><b>Email</b></label>
      <input type="email" placeholder="Enter Email" name="email" required  style="width: 100%;
  padding: 14px 22px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   border-radius: 5px;
    background-color:#f1f1f1;">

      <label for="password"><b>Password</b></label>
      <input type="password" placeholder="Enter Password" name="password" required style="width: 100%;
  padding: 14px 22px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
   border-radius: 5px;
    background-color:#f1f1f1;">
        
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

   <div class="login" style="background-color:#f1f1f1">
   <a href="${pageContext.request.contextPath }/login/logout" style="
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;">Cancel</a>
        
    <span class="psw" style="float: right;"><a href="#" style="text-decoration: none;color:dodgerblue;">Forgot Password?</a></span>
    </div>
  <a href="##" style="color:dodgerblue; margin-bottom: 2%; margin-top: 2%; text-align: center;" onclick="document.getElementById('id02').style.display='block'" class="submitId">New to VeggieFridge?Create an account</a><button type="button" onclick="document.getElementById('id02').style.display='block'" class="submitId"  style="
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
  color: white;
  border: none; margin-top: 2%;margin-left: 2%;border-radius:5px;">SignUp</button> 
  </form>
   <span style="color: red;">${message}</span>
</div>

<!-- .....................sign up............ -->
    
     <!--  header -->
    <div class="header">
    <div class="logo">
    <spring:url value="/images" var="images" />
    <img src="${images}/logo.jpg" width="140" height="110"/>
    </div>
    
    <div class="call"> 
    <a href="abc.htm">                        
    <spring:url value="/images" var="images" />
    <img src="${images}/cart.png" width="100" height="55" style="float: right;"/>
    </a>                        
                            <span class="fas fa-phone-alt" style="color: black;"></span>
                            <span class="text" style="color: black;">+089-765432100</span>   
                            </div>
    
    
   <div class="search">                                                 
   <form class="example" action="action_page.php">
   <input type="text" placeholder="Search For Vegetabels Fruits And More........" name="search">
   <button type="submit"><i class="fa fa-search"></i></button>
   </form>
   </div>
   </div>
  
                <div class="right" style="float: right;">
                <a href="#" style="text-decoration: none;">Login as Guest</a> |
                <a href="${pageContext.request.contextPath}/login/loginView" style="text-decoration: none;">Log in</a> |
                <a href="${pageContext.request.contextPath}/login/newCustomer" style="text-decoration: none;">Sign Up </a> |
                
<!-- Trigger/Open The Modal -->
<span class="fas fa-map-marker-alt" style="color: black;"></span>
<a href="#" id="myBtn" style="text-decoration: none;">${kiosklocation.location},${kiosklocation.cities}</a> 
 <i class="arrow down" style="  transform: rotate(45deg);
  -webkit-transform: rotate(45deg);  border:solid black; 
  border-width: 0 3px 3px 0;
  display: inline-block;
  padding: 3px;"></i>
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
} */

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
  <div class="navbar">
  <div class="dropdown">
    <button class="dropbtn">Search By Catogary  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 
<div class="dropdown">
    <button class="dropbtn">Discounts
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 
 
  <div class="dropdown">
    <button class="dropbtn">More 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
      </div>
      </div>
      </div> 
      
                      
  <!--   close header  -->
 <!--  <div class="slideshow-container" style="margin-top:13px; margin-right:27%;">

  <div class="mySlides fade"> -->
  <spring:url value="/images" var="images" />
  <img src="${images}/bigimage.jpg" width="1600" height="500" style="margin-top:15px;"/> 
 <%--  </div>

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
   
  
  <div class="carousel">
  <div class="container">
   <ul> 
  <c:forEach var="product" items="${listProduct}">
 <!--  1 -->
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right; color: white;">Get ${product.discount}% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/${product.imageName}"/ width="140" height="150"  style="background: no-repeat #1864ff;background-position: center;
   background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" >
   </a>
   </div>
            <div class="product-meta">
            <h4 style="color: black;">${product.productName}</h4>
            <h6 style="color: black;">${product.description}</h6>
            <h6 style="color: black;"> Size:${product.size} g<h6>
             </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1; margin-top: 90%">
                   <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;   
  color:black;">MRP</span>
                   <span class="old-price"> Rs ${product.price}</span>
                    Rs ${product.finalPrice}
                     </span>
            </div>
                <div class="right">
                 <button class="btn">Add to Cart</button>
                </div></div> 
           
          <!-- <div class="label-clip">
           Get 67% OFF
         </div>  -->
          </li>
          </c:forEach>
        
      
   <div class="second">
  <spring:url value="/images" var="images" />
  <img src="${images}/c4.jpg" width="1300" height="400"/>
  </div><br><br>
  
   <th>
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/icici.jpg" width="300" height="300" />
   </a>
   </th>
  
   
   
   <th>
    <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/induslandbank.jpg" width="300" height="300"/>
    </a>
   </th>
  
   
  
   <th>
    <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/paytm.jpg" width="300" height="300"/>
   </a>
   </th>
   
   <th>
    
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/standard.jpg" width="300" height="300"/>
   </a>
   </th>
   </tr>  
  </table>
    <br>
  
  
  <div class="third">
  <spring:url value="/images" var="images" />
  <img src="${images}/organic.jpg" width="1300" height="400"/>
  </div><br><br>
    </ul>
    </div>
    </div>
 <!--  ...........footer.................  -->
      
      
      <div class="footer">
      <div class="main-content" style="color: #d9d9d9;">
      <div class="left box">

<h2>VeggieFridge</h2>
<div class="content"> 
                            <a href="#">About Us</a><br><br>
                            <a  href="#">Privacy Policy</a><br><br>
                            <a href="#">Help</a><br><br>
                            <a href="#">Terms And Condition</a><br><br>
                            <a href="#">Carriers</a><br><br>
                            <a href="#">Affiliate</a><br><br>
                            <a href="#">In News</a><br><br>
                            <a href="#">vf instant</a><br><br>
                            <a href="#">vf daily</a><br><br>
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
                            <a href="https://facebook.com/coding.np"><span class="fab fa-facebook-f" style="background-color:#3B5998;"></span></a>
                            <a href="#"><span class="fab fa-twitter" style="background-color: #55ACEE;"></span></a>
                            <a href="https://instagram.com/coding.np" ><span class="fab fa-instagram" style="background-color: #125688;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-linkedin"  style="background-color:  #007bb5;"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-pinterest"  style="background-color: #bb0000;"></span></a>
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
</div>


<!-- .......................................signup....................... -->
 
 
 <div class="register" id="id02">
 <div class="register-content">
<form method="post"  class="signup-content"  action="${pageContext.request.contextPath}/home/saveCustomer" modelAttribute="customer" >

      <h1 style="text-align: center; color: green; margin-top:4%;">Sign Up</h1>
      <p style="margin-top: 1%; margin-left: 2%;">Please fill in this form to create an account.</p>
      <hr>
  
  
  <label for=" firstname" style="margin-left: 2%;">First Name :</label>
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
       <option   value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
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
  background: #f1f1f1;border-radius:4px;margin-left:7%;"></spring:bind>

      <label for="confirm-repeat" style="margin-left:2%;">Confirm Psw:</label>
      <spring:bind path="customer.confirmPassword">
      <input type="password"  name="${status.expression}" value="${status.value}" placeholder="Repeat Password" required style="width: 65%;
  padding: 8px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;margin-left:3%;"></spring:bind>
 <hr>
      
        <label>
        <input type="checkbox" checked="checked" name="remember" style="margin-bottom:15px;margin-left:2%;"> Remember me
        </label>

      <p style="margin-left: 2%;">By creating an account you agree to our <a href="#" style="color:dodgerblue;">Terms & Privacy</a>.</p><br>
     <input type="submit" style="width:280px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;margin-left:14%;"value="Sign Up">
    
  </form>
   </div>
 <script>

$(document).ready(function() {

  setTimeout(function(){
	  $('.mainsplash').css('display','block');
	  },50); 

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
  </body>
  </html>
  