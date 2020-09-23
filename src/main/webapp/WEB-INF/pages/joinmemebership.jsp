<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>

    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

    <html>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css"> 
    <head>
    <style>
    body{
background-color:#f1f1f1;
}

* {
  box-sizing: border-box;
}
    
    .splash{
   text-align: center;
   margin-left:32%;
   margin-top:5%;
   font-family: 'Montserrat', sans-serif;
   background-color: #fff;
   border-radius: 10px;
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


Forogt Password----------->page
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
    
  <spring:url value="/images" var="images" />
  <img src="${images}/logo.jpg" width="110" height="70"/>
  
 <h6 style="color:#4CAF50;font-size:85%; margin-top:2%; text-align:center;">Do subscribe VeggieFridge Membership and unlock benefits</h6>

 <a href="${pageContext.request.contextPath}/member/addMember/${customer.customerid}" style="display:inline-block;
        padding: 5px 12px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Yes</a>
        
<input type="button" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:4px;text-align: center;color:white;background-color:#4CAF50;padding:7px;border:none;" value="no" onclick="history.back()">
    
     </div>
     </div>
     </form>
    </div>
    </body>    
    </html>