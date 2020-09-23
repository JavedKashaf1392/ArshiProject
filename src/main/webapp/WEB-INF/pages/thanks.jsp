<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
	 <script src= 
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"> 
	</script> 
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<style>

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
 
   border-radius: 10px;
  /*  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22); */
	position: relative;
	overflow: hidden;
	width: 550px;
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
  background-color:green;
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


</style>
</head>
<body>
  <div class="splash" style="background-color:white;padding: 70px 70px;">
  <div class="row">
  <div class="col-75"> 
 <form method="post" action="${pageContext.request.contextPath}/login/generateLink" modelAttribute="kioskLocation">
 <i class="fa fa-check-circle" style="font-size:80px;color:green"></i>
 <h1>Thank You !</h1>    
 <h4 style="color:#4CAF50;font-size:85%; margin-top:2%; text-align:center;">For Shopping with Us</h4> 
 <h5 style="color:#4CAF50;">Recieve your order to your pickup location </h5>
 <span class="fas fa-map-marker-alt" style="color:green;font-size:25px;"></span>
 <span style="color:black;">${customer.location},${customer.cities}</span><br><br>
 
 <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 70px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:green;
        border-radius: 6px;
        outline: none;margin-top:6px;font-size:15px;">Continue Shopping</a>
      </div>
      </div>
     </form>
    </div>
    
   
</body>
</html>
