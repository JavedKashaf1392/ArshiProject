<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  



<html>
<head>
<meta charset="ISO-8859-1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<title>Insert title here</title>
<style>
body {font-family: Arial, Helvetica, sans-serif;}
 
body{
    font-family: Arial;
    margin: 0;
    padding: 0;
    font-family: "Roboto", sans-serif;
    .mySlides {display: none}
    {
    box-sizing: border-box;
}
}
.footer{
   /*  margin-left:13%;
    margin-right:13%; */
    position:fixed;
   /*  width:74%; */
    width:100%;
    height: 500px;
    background: #4CAF50; 
    margin-top:50%;
  
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
     height:3480px;
     transition:1s;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex; 
}
/* <-- serach operation--> */
/* Style the search field */
form.example input[type=text] {
  padding:8px;
  font-size: 17px;
  border: 1px solid grey;
  float: left;
  width:40%;
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
margin-right:14%;
font:bold;
font-size:18px;

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
  padding: 10px 12px;
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
    color:white;
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
    /* background: #1a1a1a; */
    background-color:white;
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
<div class="footer">
      <div class="main-content">
      <div class="left box">

<h2>VeggieFridge</h2>
<div class="content" style="color: white;"> 
                            <a href="#" style="color: white;">About Us</a><br><br>
                            <a href="#"style="color: white;">Privacy Policy</a><br><br>
                            <a href="#"style="color: white;">Help</a><br><br>
                            <a href="#"style="color: white;">Terms And Condition</a><br><br>
                            <a href="#"style="color: white;">Carriers</a><br><br>
                            <a href="#" style="color: white;">Affiliate</a><br><br>
                            <a href="#"style="color: white;">In News</a><br><br>
                            <a href="#"style="color: white;">vf instant</a><br><br>
                            <a href="#"style="color: white;">vf daily</a><br><br>
</div>
</div>
<div class="center box">
                    <h2>
Address</h2>
<div class="content">
                        <div class="place">
                            <span class="fas fa-map-marker-alt" style=" background-color:white;padding: 4px 4px"></span>
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
                    <span class="far fa-copyright"></span>
                    <span> 2020 All rights reserved.</span>
                    </center>
                    </div>

</div>
</div>
</div>

</body>
</html>