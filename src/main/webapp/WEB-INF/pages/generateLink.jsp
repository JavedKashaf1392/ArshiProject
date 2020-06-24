<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
 <title>Generate Link</title>
<style>
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
  border-radius: 10px;
  border: 1px solid #008000;
  max-width: 400px;
  padding: 20px;
  background-color: #ffffff;
  align: center;
  padding:auto;
  margin:auto;
  text-align:center;
  margin-top:15%;
}
<title>Generate Link</title>
</style>
</head>
<body>
<div class="container">
<form action="${pageContext.request.contextPath}/login/forgotPassword" th:action="@{/Cancel}" th:object="${user}" method="post">
<h3>Select one to Reset Password :</h3>
<input type="radio" name="entity" value="Email"> Email</input>
<input type="radio" name="entity" value="Text"> Text</input><br><br>
<input  class="button button1" type="submit" value="Send">
<input   class="button button1" type="submit" value="Cancel">
</form>
</div>