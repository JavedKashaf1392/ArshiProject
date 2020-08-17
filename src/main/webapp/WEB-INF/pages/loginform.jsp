<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<style>

h2{
 left: 50px;
}
.splash{
   text-align: center;
   margin-left:32%;
   margin-top:5%;
   font-family: 'Montserrat', sans-serif;
   background-color: #fff;
   border-radius: 10px;
   box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22);
	position: relative;
	overflow: hidden;
	width: 450px;
    max-width: 100%;
	min-height: 100px;
}
  .alert {
  padding: 20px;
  background-color:  #4CAF50;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}
input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px;
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
  background-color: #4CAF50;
}

.regbtn{
  width: auto;
  padding: 10px 18px;
  background-color: #4CAF50;
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
  .alert {
  padding: 20px;
  background-color:  #4CAF50;
  color: white;
}

.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
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
 <div class="alert">
  <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span> 
  <strong>Sucess!</strong> Your Password have succesfully changed.
</div>
 
 
  <form  method="post" action="${pageContext.request.contextPath}/customer/doLogin" modelAttribute="customer">
  <h2 style="color:#4CAF50;">Log In VeggieFridge</h2>                                
 
  <label style="margin-right:57%;">Email</label>
  <input type="email" name="${status.expression}" value="${status.value}" placeholder="Enter Password"  required style="width: 80%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;border:1px gray;"><br>
  
  <label style="margin-right:57%;">Password</label>
  <input type="password" name="${status.expression}" value="${status.value}" placeholder="Enter Password"  required style="width: 80%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px; border: 1pc gray;"><br>
 
  <input type="submit" value="Login"  style="width: 80%;  padding:12px;margin-left:3%; border-radius:4px;"/><br>
   
      <label style="float:left; margin-left:10%;">
      <input type="checkbox" checked="checked" name="remember"> Remember me
      </label><br>

    <div class="container" style="background-color:#f1f1f1;margin-left:10%;margin-right:10%; margin-top:2%;" >
    <button type="button" class="cancelbtn"  value="${pageContext.request.contextPath}/home/viewhome" style="margin-right:35%;">Cancel</button>
    <span class="psw"><a href="${pageContext.request.contextPath}/login/forgotPassword">Forgot Password?</a></span>
    </div>
   
    <div class="signup" style="margin-top:4%;font-size:100%;">
    New To VeggieFridge?Create an account <a href="${pageContext.request.contextPath }/login/saveCustomer" style="
        padding: 8px 16px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;">SignUp</a>
   </div>

</form>
</div>
</body>
</html>
