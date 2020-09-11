<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
 <title>Generate Link</title>
<style>
  body{
background-color:#f1f1f1;
}
* {
  box-sizing: border-box;
}

.button {
  border-radius: 5px;
  background-color: #4CAF50; /* Add */
  border: none;
  color: white;
  padding: 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px 5px;
  margin-top: 30px;
  cursor: pointer;
  width: 100px;
}
h3 {
color: green;
}
.container {
  text-align: center;
   margin-left:32%;
   margin-top:10%;
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
@keyframes show {
	0%, 49.99% {
		opacity: 0;
		z-index: 1;
	}
	
	50%, 100% {
		opacity: 1;
		z-index: 5;
	}
<title>Generate Link</title>
</style>
</head>
<body>
<div class="container">
  <form action="${pageContext.request.contextPath}/login/changePassword" th:action="@{/Cancel}" th:object="${user}" method="post">
  <spring:url value="/images" var="images" />
  <img src="${images}/logo.jpg" width="165" height="130"/>
<h4 style="color:#4CAF50;">Authentication Required</h4>
<h5 style="color:#4CAF50;">For your security, we need to authenticate your request. We've sent an link to the associate email. Please go to the email click it on link to complete verification.</h5>
</form>
</div>

