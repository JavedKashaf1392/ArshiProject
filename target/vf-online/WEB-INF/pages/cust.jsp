<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
      
   <html>
   <head>
   <link rel="icon" type="image/jpg" href="images/logo.jpg">
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Home screen of VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style>

*{
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 120%;
  padding: 12px;
  margin-left:40px;
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

.error {
   color:red; 
 }

.center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

.col-25 {
  float: left;
  width: 20%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 50%;
  margin-top: 6px;
}


/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
 */
h2 {
  color: green;
}

</style>
<title>New/Edit Customer</title>
</head>
<body>
    <div align="center">
    <div><h2><p style="color:green;">New/Edit Customer</p></h2></div>
       <!--  <h2>New/Edit Product</h2> -->
        <form:form action="${pageContext.request.contextPath}/customer/saveCustomer" method="post" modelAttribute="customer">
        <font color='red'><span id="errId"></span></font>
       
        <table>
        
         
            <tr>
                <td>custoemrId</td>
                <td><form:input path="customerid" /><form:errors path="firstName" cssClass="error"/></td>
            </tr>
               <a href="${pageContext.request.contextPath}/customer/searchCustomer">search</a>          
            <tr>
                <td>First Name </td>
                <td><form:input path="firstName"  /><form:errors path="firstName" cssClass="error"/></td>
            </tr>
             <tr>
                <td>Last Name </td>
                <td><form:input path="lastName"  /><form:errors path="lastName" cssClass="error"/></td>
            </tr>
            <tr>
                <td>Mobile </td>
                <td><form:input path="mobile" /></td>
                <td><form:errors path="mobile" cssClass="error" /></td> 
            </tr>
            
            <tr>
                <td>City </td>
                <td><form:input path="cities" /></td>
                <td><form:errors path="cities"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>KIOSK Location </td>
                <td><form:input path="location" /></td>
                <td><form:errors path="location"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Email </td>
                <td><form:input path="email" /></td>
                <td><form:errors path="email" cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Password</td>
                <td><form:input path="password" /></td>
                <td><form:errors path="password" cssClass="error"/></td> 
            </tr>
            
             <tr>
                <td>Confirm Password </td>
                <td><form:input path="confirmPassword" /></td>
                <td><form:errors path="confirmPassword" cssClass="error"/></td> 
            </tr> 
        
           </table><br>
           <div style='float:center;'>
           <input type="submit" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;"value="Save">
           <input type="reset" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Reset">
           <input type="button" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Back" onclick="history.back()">
            </div>
        </form:form>
    </div>
    
    
    <script type="text/javascript">

      function validatePwds(){
    	    var newPwd = $('#newPassword').val();
    	    var confirmPwd = $('#confirmPassword').val();
    	    if(newPwd!=confirmPwd){
    	    $('#errId').text('New Password And Confirm Password Should Be Same');
    	    return false;
    	    }
    	    return true;
    	}

      </script>
</body>
</html> 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
