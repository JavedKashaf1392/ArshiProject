<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<style>

body {
    font-family: Arial, Helvetica, sans-serif;
    width: 25%;
    height: 80px;
    align-content: center;
    left: 50px;
    top: 50px;
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
<title>Forgot Your Password ?</title>
</style>
</head>
<body>
<div  class ="container" >
<form action="${pageContext.request.contextPath}/login/generateLink" th:action="@{/forgot-password}" th:object="${user}" method="post">
<table>
<tr>
<td><label for="emailId">Email</label></td>
<td><input th:field="*{emailId}" placeholder="Enter Email address" type="text" name="emailId"></input></td>
</tr>
<tr>
<td><input class="button clear" type="reset" value="Clear"/></td>
<td><input class="button button1" type="submit" value="Continue"></input></td>
</tr>
</table>
</form>
</div>
</body>