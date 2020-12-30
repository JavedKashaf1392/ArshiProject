<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg"> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>

h4{
 align-content: center;
    left: 50px;
    top: 50px;
}

body {
    font-family: Arial, Helvetica, sans-serif;
    width: 25%;
    height: 80px;
    align-content: center;
    left: 50px;
    top: 50px;

    }
form {
    border: 3px solid #f1f1f1;
    position: absolute;
    left: 50%;
    top: 50%;
    transform: translate(-50%,-50%);
    padding: 10px 10px;
    width: 350px;
    }

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color:#4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 40%;
  border-radius: 50%;
}

.container {
  padding: 16px;
   
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head>
 
 <body>
<div style ="position:absolute;left:570px;top:40px;"><h4>Customer has been registered successfully</h4></div>

<form action="${pageContext.request.contextPath}/payment/pgRedirect" method="post" modelAttribute="user">
<h2>Log In VeggieFridge</h2>                                  
  <div class="container">
    <label for="uname"><b>Email Id</b></label>
    <input type="text" placeholder="Enter Email Id" name="uname" required>

    <label for="psw"><b>Password</b></label>
    <input type="password" placeholder="Enter Password" name="psw" required>

    <button type="submit" value="${pageContext.request.contextPath}/login/loginProcess">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn"  value="sidebar menu.htm">Cancel</button>
    <span class="psw"><a href="#">Forgot Password?</a></span>
  </div>

 <div style="align-content: center">
  <a href="${pageContext.request.contextPath}/login/newCustomer">New To VeggieFridge?Create an account</a>
 </div>
 </form>
 
 </body>
 </html>



