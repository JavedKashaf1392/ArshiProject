<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<style>
body{
background-color:#f1f1f1;
}
* {
  box-sizing: border-box;
}
input[type=text], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
input[type=email], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

input[type=password], select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 14px 14px 14px 0;
  display: inline-block;
  float: left;
  font-size: 20px;
  color: green;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  padding: 20px;
}

.col-25 {

  width: 25%;
  margin-top: 8px;
}

.col-75 {
  float: left;
  width: 100%;

}
.col-76 {
  float: left;
  width: 50%;

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
</style>
</head>
<body>

<div style="background-color:white;margin-left:25%;margin-right:15%;width:45%;position:absolute;height:150%;text-align: center;">
<spring:url value="/images" var="images" />
<img src="${images}/logo.jpg" width="150" height="120" style="float: left; margin-top:2%;"/>
<h2 style="color:green;margin-right:50%;">Arshi Qureshi</h2>
<h4 style="margin-right:43%;">Email Id: Arshi@gamil.com</h4>
<h5 style="margin-right:52%;">Last login 2 hours ago</h5>
<hr style="color:light gray;">
<h3 style="float:left;color:gray;">Update Your Profile</h3>

<div class="container">
  <form action="/action_page.php">
    <div class="row">
      <div class="col-25">
        <label for="fname">First Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname" placeholder="Your first name..">
      </div>
    </div>
    <div class="row">
      <div class="col-25">
        <label for="lname">Last Name</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname" placeholder="Your last name..">
      </div>
    </div>
    
    
     <div class="row">
      <div class="col-25">
        <label for="email">EmailId</label>
      </div>
      <div class="col-75">
        <input type="email" id="fname" name="firstname" placeholder="Your emailid..">
      </div>
    </div>
     <div class="row">
      <div class="col-25">
        <label for="number">Mobile Nm</label>
      </div>
      <div class="col-75">
        <input type="text" id="fname" name="firstname" placeholder="Your Mobile number..">
      </div>
    </div>
    <h3 style="float:left;color:green;">Change Your Password</h3>
    
    <div class="row">
      <div class="col-25">
        <label for="password">Current Password</label>
      </div>
      <div class="col-75">
        <input type="password" id="fname" name="firstname" placeholder="Your current password..">
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="password">New Password</label>
      </div>
      <div class="col-75">
        <input type="password" id="fname" name="firstname" placeholder="Your current password..">
      </div>
    </div>
    
    
    <div class="row">
      <div class="col-25">
        <label for="password">Confirm Password</label>
      </div>
      <div class="col-75">
        <input type="password" id="fname" name="firstname" placeholder="Your current password..">
      </div>
    </div>
  </form>
   <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:green;
        border-radius: 6px;
        outline: none;margin-top:10px;margin-right:70%;">Save Changes</a>
</div>



</div><br>

<div style="background-color:white;margin-left:10%;padding:25px; width:12%;border-radius:8px;">
<a href="#" style="text-decoration: none;color:green;font-size:20px;"><i class='fas fa-wallet' style='color:green;'></i>     My Wallet</a><br><br>
<a href="${pageContext.request.contextPath}/home/currentorder" style="text-decoration: none;color:green;font-size:20px;"><i class="fa fa-bars" style='color:green;'></i>     My Orders</a><br><br>
<a href="#" style="text-decoration: none;color:green;font-size:20px;"><i class='fas fa-user-friends' style='color:green;'></i>     Membership</a><br><br>
<a href="${pageContext.request.contextPath}/home/editProfile" style="text-decoration: none;color:green;font-size:20px;"><i class="fa fa-edit" style='color:green;'></i>     EditProfile</a><br><br>
</div>
 
</script>

</body>
</html>
