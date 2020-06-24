<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml"
 xmlns:th="http://www.thymeleaf.org">
    <head> <title>Forgot Password</title> </head>
    <style>
body {
    font-family: Arial, Helvetica, sans-serif;
    width: 25%;
    height: 80px;
    align-content: center;
    left: 50px;
    top: 50px;
    }
    </style>
    <body>
        <center>
            <form action="${pageContext.request.contextPath}/login/generateLink" th:action="@{/forgot-password}" th:object="${user}" method="post">
                <table>
                    <tr>
                        <td><label for="emailId">Email</label></td>
                        <td><input th:field="*{emailId}" placeholder="Enter Email address" type="text" name="emailId"></input></td>
                    </tr>
                    <tr>
                        <td><input type="reset" value="Clear"/></td>
                        <td><input type="submit" value="Verify"></input></td>
                    </tr>
                </table>
            </form>
        </center>
    </body>
</html>