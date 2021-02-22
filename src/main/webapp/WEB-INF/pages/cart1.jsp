<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<meta charset="utf-8">

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>

body {
	font-family: 'Quicksand', sans-serif;
}


 </style>
 </head>
 
 <body>
 
	 <table>
					<th><a href="abc.htm"> <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="90" height="75" alt=""/>
					</a></th>
					<th><a href="abc.htm">  <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt="" style="margin-top:30px;"/>
					</a></th>
				</table>

</body>
</html>