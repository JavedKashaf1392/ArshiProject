<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>

    <html>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css"> 
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
    <head>
    <style>
    
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
    </style>    
    
</head>
    
  <body>
  <div class="splash">
  <div class="row">
  <div class="col-75"> 
    
  <form method="post" action="${pageContext.request.contextPath}/login/generateLink" modelAttribute="kioskLocation">
  <spring:url value="/images" var="images" />
  <img src="${images}/logo.jpg" width="165" height="130"/>

 <!-- <i class="fa fa-lock" style="font-size:30px;color:#4CAF50;"></i> -->
 <h2 style="color:#4CAF50;"><i class="fa fa-lock" style="font-size:50px;color:#4CAF50;"></i> Forgot Password ?</h2>    
 <h6 style="color:#4CAF50;font-size:85%; margin-top:2%; text-align:center;">Enter the email associated with your VeggieFridge account</h6>
 
<!--  <i style="font-size:50px;color:#4CAF50;" class="fa">&#xf199;</i> -->
  <input type="email" name="${status.expression}" value="${status.value}" placeholder="Enter Email"  required style="width: 77%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;">
  <input type="submit" value="Continue"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;"/>
      </div>
      </div>

    <!--  <div style="text-align:center;">
    <input type="submit" value="Continue"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;"/>
    </div> --></form>
    </div>
    </body>    
    </html>