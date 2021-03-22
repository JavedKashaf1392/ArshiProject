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
     
    <!-- <link href="./images/footer.css" rel="stylesheet" type="text/css"> --> 
    <link href="./static/css/footer.css" rel="stylesheet" type="text/css">
   <%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/footer.css" /> --%>
    <!-- /vf-online/src/main/webapp/WEB-INF/pages/newfooter.jsp -->
   <!--  /vf-online/src/main/webapp/WEB-INF/images/footer.css -->
    
    </head>
	<body>
		<!-- The content of your page would go here. -->

		<footer class="footer-distributed">

			<div class="footer-left" style="text-align:left;">
         <!--  <img src="img/logo.png"> -->
				<h3><span>VeggieFridge</span></h3>

				<p class="footer-links">
					<a href="#">In News</a>
					|
					<a href="#">Privacy Policy</a>
					|
					<a href="#">Help</a>
					|
					<a href="#">FeedBack</a>
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
					  <p><span style="font-weight: font-weight:400;;">309 - Rupa Solitaire,
						 Bldg. No. A - 1, Sector - 1</span>
						<span style="font-weight: font-weight:400;">Mahape, Navi Mumbai - 400710</span></p>
						
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
					VeggieFridge, enhances you  with deep nourishing thoughts of not only being healthy but keeping you contracted against hygienic nutritional values
					and Identify The True Taste of Nutritions . . .<button  onclick="window.location.href='${pageContext.request.contextPath}/VFAbout'">Read More</button></p>

				    
				    
				
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