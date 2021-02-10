<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="footer, address, phone, icons" />

	<title>Responsive Footer</title>

	<link rel="stylesheet" href="style.css">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

	<link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
     
    <style>
    @import url('http://fonts.googleapis.com/css?family=Open+Sans:400,700');

*{
	padding:0;
	margin:0;
} 

/* The footer is fixed to the bottom of the page */

footer{
	position: relative;
	bottom: 0;
}

@media (max-height:800px){
	footer { position: static; }
	header { padding-top:px; }
}

.footer-distributed{
	background-color:#F8F8F8; 
/* background-color:#F0F0F0; */
	/* background-color: #4CAF50; */
	box-sizing: border-box;
	/* width:80%; */
	/* max-width:1280px; */
	/* margin-left:11%; */
	/* margin-right:20px; */
	/* text-align: left;
	font: bold 16px sans-serif;
	padding: 50px 50px 60px 50px; */
/* 	margin-top:50px; */
	/* margin-left:160px;
    margin-right:145px; */
    /* background-color: #2c292f; */
	box-sizing: border-box;
	width: 100%;
	text-align: center;
	font: bold 16px sans-serif;
	padding: 50px 50px 60px 50px;
	/* margin-top: 80px; */
	/*  max-width: 1388px; */
	 /* margin-left:97px; */
	 align-content: center;
	 margin: 0 auto;
}

.footer-distributed .footer-left,
.footer-distributed .footer-center,
.footer-distributed .footer-right{
	display: inline-block;
	vertical-align: top;
}

/* Footer left */

.footer-distributed .footer-left{
	width: 30%;
}

.footer-distributed h3{
	/* color:  #ffffff; */
	color:black;
	/* font: normal 36px 'Cookie', cursive; */
	margin: 0;
}
.footer-distributed h3 span{
	/* color:  #e0ac1c; */
	color:  black;
}

/* Footer links */

.footer-distributed .footer-links{
	/* color:  #ffffff; */
color:#767070;
	margin: 20px 0 12px;
}

.footer-distributed .footer-links a{
	display:inline-block;
	line-height: 1.8;
	text-decoration: none;
	color:  inherit;
	
}

.footer-distributed .footer-company-name{
	/* color:  #8f9296; */
	color:white;
	font-size: 14px;
	font-weight:bold;
	margin: 0;
	width:100%;
	 display: flex;
    justify-content: space-between;
    align-items: center;
    /* letter-spacing: 1px; */
	
}

/* Footer Center */

.footer-distributed .footer-center{
	width: 35%;
}
.footer-distributed .footer-center i{
	/* background-color:  #33383b; */
	background-color:white;
	/* color: #ffffff; */
	/* color:green; */
	color:black;
	font-size: 25px;
	width: 38px;
	height: 38px;
	border-radius: 50%;
	text-align: center;
	line-height: 42px;
	margin: 10px 15px;
	vertical-align: middle;
}

.footer-distributed .footer-center i.fa-envelope{
	font-size: 17px;
	line-height: 38px;
	
}

.footer-distributed .footer-center p{
	display: inline-block;
	color:#767070;
	/* color: #ffffff; */
	vertical-align: middle;
	margin:0;
}

.footer-distributed .footer-center p span{
	display:block;
	/* font-weight: normal; */
	font-size:15px;
	line-height:1.5;
}

.footer-distributed .footer-center p a{
	/* color:  #e0ac1c; */
	color:#767070;
	text-decoration: none;;
}


/* Footer Right */

.footer-distributed .footer-right{
	width: 30%;
}

.footer-distributed .footer-company-about{
	line-height: 20px;
	/* color:  #92999f; */
	color:#767070;
	font-size: 15px;
	font-weight:bold;
	margin: 0;
}

.footer-distributed .footer-company-about span{
	display: block;
/* color:#e0ac1c; */
color:black;
	/* color:  #ffffff; */
	font-size: 18px;
	font-weight: bold;
	margin-bottom: 20px;
	
}

.footer-distributed .footer-icons{
	margin-top: 25px;
}

.footer-distributed .footer-icons a{
	display: inline-block;
	width: 35px;
	height: 35px;
	cursor: pointer;
	/* background-color:  #33383b; */
	border-radius: 2px;
	font-size: 20px;
	/* color: #ffffff; */
	text-align: center;
	line-height: 35px;
	margin-right: 3px;
	margin-bottom: 5px;
}
.fa:hover {
    opacity: 0.7;
}

/* Here is the code for Responsive Footer */
/* You can remove below code if you don't want Footer to be responsive */


@media (max-width: 880px) {

	.footer-distributed .footer-left,
	.footer-distributed .footer-center,
	.footer-distributed .footer-right{
		display: block;
		width: 100%;
		margin-bottom: 40px;
		text-align: center;
	}

	.footer-distributed .footer-center i{
		margin-left: 0;
	}

}
   </style>
   </head>
	<body>
		<!-- The content of your page would go here. -->

		<footer class="footer-distributed">

			<div class="footer-left" style="text-align:left;">
         <!--  <img src="img/logo.png"> -->
				<h3><span>VeggieFridge</span></h3>

				<p class="footer-links">
					<a href="#">Contact Us</a>
					|
					<a href="#">Privacy Policy</a>
					|
					<a href="#">In News</a>
					|
					<a href="#">Help</a>
				</p>

				<!-- <p class="footer-company-name">© 2019 Eduonix Learning Solutions Pvt. Ltd.</p> -->
			    <h4 style="color:black;">Download App</h4>
				
				<table style="margin-top:2%;">
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/Apple-App-store-icon.png"
							width="120" height="45" />
					</a></th>
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/Google-App-store-icon.png"
							width="120" height="45" style="margin-left:6px;"/>
					</a></th>
				</table>
			</div>

			<div class="footer-center" style="text-align:left;">
			<span style="color:black;font-size:18px;margin-left:6%;">Address</span>
				<div style="margin-top:3%;">
					<i class="fa fa-map-marker"></i>
					  <p><span style="font-weight: bold;">309 - Rupa Solitaire,
						 Bldg. No. A - 1, Sector - 1</span>
						<span style="font-weight: bold;">Mahape, Navi Mumbai - 400710</span></p>
						
						<!--  <p>309 - Rupa Solitaire,
						 Bldg. No. A - 1, Sector - 1</p>
						<p>Mahape, Navi Mumbai - 400710</p> -->
				</div>

				<div>
					<i class="fa fa-phone"></i>
					<p>+91 22-27782183</p>
				</div>
				<div>
					<i class="fa fa-envelope"></i>
					<p style="color:#767070;"><a href="mailto:aq570975@gmail.com">support@eduonix.com</a></p>
				</div>
				<p class="footer-company-name" style="margin-top:12%;">Created By VeggieFridge Copyright © 2021 All Rights
								Reserved.</p>
			</div>
			<div class="footer-right" style="text-align:left;">
				<p class="footer-company-about">
					<span>About</span>
					We offer training and skill building courses across Technology, Design, Management, Science and Humanities
					We offer training and skill building courses across Technology, Design, Management, Science and Humanities.</p>
				
				
				<div class="footer-icons">
				<h4 style="color:black;margin-bottom:2%;">Get Social With Us</h4>
					<a href="#"style="background-color: #3B5998; color: white;"><i class="fa fa-facebook"></i></a>
					<a href="#" style="background-color: #55ACEE; color: white;"><i class="fa fa-twitter"></i></a>
					<a href="#" style="background-color: #125688; color: white;"><i class="fa fa-instagram"></i></a>
					<a href="#" style="background-color: #007bb5; color: white;"><i class="fa fa-linkedin"></i></a>
					<a href="#" style=" background: #dd4b39;
                    color: white;"><i class="fa fa-google"></i></a>
				</div>
			</div>
		</footer>
	</body>
</html>