   <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
 <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>  
 
 <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">  
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home screen of VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
 
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
 
 <font color='red'>${errMsg}</font>
 
 <form:form action="${pageContext.request.contextPath}/forgot/passwordChanged" modelAttribute="customer" method="POST">    
 
 <font color='red'><span id="errId"></span></font>
 
 <spring:url value="/images" var="images" />
 <img src="${images}/logo.jpg" width="130" height="100"/>
 
 <h2 style="color:#4CAF50;">Create new password</h2>
 <h5 style="color:#4CAF50;">We will ask for this password whenever you sign in</h5>
 
 <!-- <input type="email" name="email" placeholder="Enter Email"  required style="width: 77%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;">   -->  
   <font color='red'><span id="errId"></span></font>
    
   <table>
    
    <tr>
    <td>Your Email:</td>
    <td><form:input path="email" readonly="true"></form:input> </td>
    </tr>
       
    <tr>

    <td>Enter New Password</td>
    <td><form:password path="newPassword"></form:password></td>
    </tr>
    
    <%-- <tr>
    <td>Confirm Password</td>
    <td><form:password path="confirmNewPassword"/>  </td>
    </tr> --%>
    <tr>
    <td><input type="submit" value="changePassword" onclick="return validatePwds()"></td>
    </tr>
    </table>
    </form:form>
      </div>
      </div>
      </div>
  
     
      <script type="text/javascript">

      function validatePwds(){
    	    var newPwd = $('#newPassword').val();
    	    var confirmPwd = $('#confirmNewPassword').val();
    	    if(newPwd!=confirmPwd){
    	    $('#errId').text('New Password And Confirm Password Should Be Same');
    	    return false;
    	    }
    	    return true;
    	}

      </script>

   
</body>
</html>