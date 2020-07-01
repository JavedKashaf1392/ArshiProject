

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>

 <!DOCTYPE HTML>
 <html lang="en" dir="ltr">
        
        <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home screen of VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
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
     height:3793px;
     transition:1s;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex; 
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
margin-right:20%;
margin-top: 10px;
height:40px;
width:20%;
/* border:1px solid black;  */

}
 /* call end */


/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}

  /*  end search */

  /* right  */
.right{
float: right;
margin-top:30px;
margin-right:9%;
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
    color: #d9d9d9;
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
  </style>
  <body>
    
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
                            
                            <span class="fas fa-phone-alt"></span>
                            <span class="text">+089-765432100</span>   
                            </div>
    
    
   <div class="search">                                                 
   <form class="example" action="action_page.php">
   <input type="text" placeholder="Search For Vegetabels Fruits And More........" name="search">
   <button type="submit"><i class="fa fa-search"></i></button>
   </form>
   </div>
   </div>
  
                <div class="right" style="float: right;">
                <a href="#">Login as Guest</a> |
                <a href="${pageContext.request.contextPath}/login/loginView">Log in</a> |
                <a href="${pageContext.request.contextPath}/login/newCustomer">Sign Up </a> |
                <select id="city" name="city">
                <option value="Nagpur">Nagpur</option>
                <option value="mumbai">Mumbai</option>
                </select>
                </div>  
  
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
  <div class="slideshow-container" style="margin-top:13px; margin-right:27%;">

  <div class="mySlides fade">
  <spring:url value="/images" var="images" />
  <img src="${images}/f4.jpg" width="1300" height="400"/>
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
   </script>
  
  <div class="carousel">
  <div class="container">
   <ul> 

 <!--  1 -->
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 67% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/potato.jpg"/ width="140" height="150"  style="background: no-repeat #1864ff;background-position: center;
   background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" >
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h6 style="color: black;"> Size:1 kg<h6>
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
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
                <div class="right">
                 <button class="btn">Add to Cart</button>
                </div></div> 
           
          <!-- <div class="label-clip">
           Get 67% OFF
         </div>  -->
          </li>
        
      <!--   2   -->
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/bringal.jpg" width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"  />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
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
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 50% OFF
          </div> -->
          </li>
    
   <!--  3  -->    
    <li>
   <div  class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>       
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/ginger.jpeg" width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
  </a>
  </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
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
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
          <!--  <div class="label-clip">
           Get 40% OFF
          </div>  -->
          </li>
            
           <!--  4 -->
            <li>
   <a href="#">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <div class="product-img">
   <spring:url value="/images" var="images" />
   <img src="${images}/ladyfinger.jpg" width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
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
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!-- <div class="label-clip">
           Get 40% OFF
          </div>  -->
          </li>
           
           
           
    <!--  5    -->   
   <li> 
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4> 
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/app.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
           
         <!--   6 -->
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/banana.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 67% OFF
          </div> -->
          </li>
          
          <!-- 7 -->
    <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/cherry.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--   <div class="label-clip">
           Get 67% OFF
          </div> -->
          </li>
          
       <!--    8 -->
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/mango.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover;float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
          
   <!--  9  -->    
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/cabbage.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
          <!-- <div class="label-clip">
           Get 67% OFF
          </div> --> 
          </li>
          
          <!-- 10 --> 
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/carrot.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
    </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div> -->
          </li>
          
          <!-- 11 -->
            <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/tomato.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
    
    <!-- 12 -->         
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/onion.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;" />
   </a>
   </div>
            
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
  
   <div class="second">
  <spring:url value="/images" var="images" />
  <img src="${images}/c4.jpg" width="1300" height="400"/>
  </div><br><br>
  
   <th>
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/icici.jpg" width="300" height="250" />
   </a>
   </th>
  
   
   
   <th>
    <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/induslandbank.jpg" width="300" height="250"/>
    </a>
   </th>
  
   
  
   <th>
    <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/paytm.jpg" width="300" height="250"/>
   </a>
   </th>
   
   <th>
    
   <a href="abc.htm">
   <spring:url value="/images" var="images" />
   <img src="${images}/standard.jpg" width="300" height="250"/>
   </a>
   </th>
   </tr>  
  </table>
   
   
     <!--  13 -->
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/chiku.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
            </div>
           <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
       
       <!-- 14   -->
    <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/orange.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
    
   <!--  15  -->    
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/pinapple.png"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                   <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--   <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
           
          <!--  16 -->
     
           <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/strawberry.jpg"   width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
          </div>
          <!-- <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
            
   <!--  17  -->       
    <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/guava.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover;float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
       <!--   <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
     
    <!--  18 -->
     <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/pears.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 67% OFF
          </div> -->
          </li>
       
       <!-- 19-->
       <li>
    <div class="product-img">
    <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/pumpkin.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover;float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
          <!-- <div class="label-clip">
           Get 67% OFF
          </div> --> 
          </li>   
     
    <!--  20   -->   
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/tomato.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h6 style="color: black;"> Size:1 kg<h6>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
            
  <!--   21    -->     
    <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/watermelon.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover;float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
   
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
         <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
    
   <!--  22 -->
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/orange.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                    <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--   <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li>
    
   <!--  23 -->
   <li>
   <div class="product-img">
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/mango.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>
            <div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
     <!--   <div class="label-clip">
           Get 67% OFF
          </div> -->
          </li>
  <!--  24 -->
   <li>
   <div class="product-img" >
   <h4 style="background-color: #4CAF50; float: right;">Get 60% OFF</h4>
   <a href="#">
   <spring:url value="/images" var="images" />
   <img src="${images}/chiku.jpg"  width="120" height="150"  style="background: no-repeat #1864ff;background-position: center;
  background-size: cover; float: right; margin-left: 10%; margin-right: 23%;"/>
   </a>
   </div>       
<div class="product-meta">
            <h4>Potato</h4>
            <h6 style="color: black;">Fresh potato's fiber, potassium, vitamin C</h6>
            <h5 style="color: black;"> Size:1 kg<h5>
            </div>
         <!--    <div class="divider"></div> -->
            <div class="product-price-wrap" style="background-color:#f1f1f1;">
                     <div class="left">
                   <span class="price">
                   <span class="mrp" style=" font-size: 14px;
  color:black;
  font-weight: 300;
  position: relative;
   color:black;">MRP</span>
                   <span class="old-price"> Rs 150</span>
                    Rs 49.50
                     </span>
            </div>
            <div class="right">
                 <button class="btn">Add to Cart</button>
                </div>
           </div>
        <!--  <div class="label-clip">
           Get 67% OFF
          </div>  -->
          </li><br>
  
  
  <div class="third">
  <spring:url value="/images" var="images" />
  <img src="${images}/organic.jpg" width="1300" height="400"/>
  </div><br><br>
    </ul>
    </div>
    </div>
 <!--  ............................  -->
      <div class="footer">
      <div class="main-content">
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

     
  </body>
  </html>
  