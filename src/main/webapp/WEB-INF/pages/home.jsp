
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
    /* border:1px solid black; */
}
.footer{
    margin-left:10%;
    margin-right:10%;
    position:relative;
   /*  padding: 20px;
    padding: 20px; */
    width: 82%;
    height: 500px;
    margin-top:500px;
    background: #4CAF50; 
    border:1px solid black; 
    
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
.center{
    padding: 20px;
    padding: 20px;
    margin-left:150px;
    margin-right:150px;
    position:relative;
    width: 100%;
   /*  margin-top:5px; */
    /* background: #4CAF50; */
}

.logo{
 position:fixed;
 width:30% 
 border:1px;
 float:left;
 margin-right:35%;
}

/* <-- serach operation--> */
/* Style the search field */
form.example input[type=text] {
  padding: 8px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width: 45%;
 /*  background: #f1f1f1; */
  margin-left:10%; 
}


/* Style the submit button */
  form.example button {
  float: left;
  width: 5%;
  padding: 8px;
  background: #4CAF50;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: black;
}

/* call */
.call{
/* border:1px solid black; */
float:right;
margin-right:23%;
margin-top: 4px;
height:40px;
width: 15%;
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
margin-top:18px;
margin-right:8%;
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
  /* border:1px solid black; */ 
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
  background-color: black;
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
    /* box-sizing: border-box;
    font-family: 'Poppins', sans-serif; */ 
} 
.content1{
    position: relative;
    margin: 130px auto;
    text-align: center;
    padding: 0 20px;
}
.content1 .text{
    font-size: 2.5rem;
    font-weight: 600;
    color: #202020;
}
.content1 .p{
    font-size: 2.1875rem;
    font-weight: 600;
    color: #202020;
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
   /*  background: #1a1a1a; */
}
.box .content:after{
    position: absolute;
    content: '';
    height: 2px;
    width: 15%;
   background: #f12020;
    top: -10px;
}
.left .content p{
    text-align: justify;
}
.left .content .social{
    margin: 20px 0 0 0;
}
.left .content .social a{
    padding: 0 2px;
}
.left .content .social a span{
    height: 40px;
    width: 40px;
    /* background: #1a1a1a; */
    background: white;
    line-height: 40px;
    text-align: center;
    font-size: 18px;
    border-radius: 5px;
    transition: 0.3s;
}
.left .content .social a span:hover{
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
    background: #f12020;
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
    background: #151515;
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
    background: #f12020;
    font-size: 1.0625rem;
    font-weight: 500;
    cursor: pointer;
    transition: .3s;
}
.right form .btn button:hover{
    background: #000;
}
.bottom center{
    padding: 5px;
    font-size: 0.9375rem;
    background: #151515;
}
.bottom center span{
    color: #656565;
}
.bottom center a{
    color: #f12020;
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
  <body>
    
   <!--  header -->
    <div class="header">
    
    <div class="logo">
    <spring:url value="/images" var="images" />
    <img src="${images}/logo.jpg" width="150" height="120"/>
    </div>
    
    <div class="call"> 
    <a href="abc.htm">                        
    <spring:url value="/images" var="images" />
    <img src="${images}/cartimage.jpg" width="75" height="60" style="float: right;"/>
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
  
    <div class="center">
   
  <spring:url value="/images" var="images" />
  <img src="${images}/f1.jpg" width="1300" height="350"/><br>
 
  <spring:url value="/images" var="images" />
  <img src="${images}/f7.jpg" width="1300" height="350"/><br><br>
    </div>
    
      <div class="footer">
      <div class="main-content">
                <div class="left box">
   
   
                
<h2>VeggieFridge</h2>
<div class="content"> 
<a hidden="#">About Us</a>
<a hidden="#">Privacy Policy</a>
<a hidden="#">Help</a>
<a hidden="#">Terms And Condition</a>
<a hidden="#">Carriers</a>
<a hidden="#">Affiliate</a>
<a hidden="#">In News</a>
<a hidden="#">vf instant</a>
<a hidden="#">vf daily</a>

                       
<div class="social">
                            <a href="https://facebook.com/coding.np"><span class="fab fa-facebook-f"></span></a>
                            <a href="#"><span class="fab fa-twitter"></span></a>
                            <a href="https://instagram.com/coding.np"><span class="fab fa-instagram"></span></a>
                            <a href="https://youtube.com/c/codingnepal"><span class="fab fa-youtube"></span></a>
                        </div>
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
</div>
</div>
<div class="right box">
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
<div class="bottom">
<center>
                    <span class="credit">Created By <a href="https://youtube.com/c/codingnepal">CodingNepal</a> | </span>
                    <span class="far fa-copyright"></span> 2020 All rights reserved.
                </center>
</div>

</div>  
    
   
     
  </body>
  </html>
 