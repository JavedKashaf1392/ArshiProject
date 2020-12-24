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
  <div style="background-color:white;margin-left:15%;margin-right:15%;"><h2 style="color: green; text-align: center;style="background-color:white;"><a href="#" style="color:green;text-decoration: none;font-size:15px;float: left;" >Home</a>My Wallet</h2></div><br>
  <div class="splash" style="background-color:white;">
  <div class="row">
  <div class="col-75"> 
    
 <form method="post" action="${pageContext.request.contextPath}/wallet/pgRedirect" modelAttribute="kioskLocation">
 <h2 style="color:#4CAF50;"><i class='fas fa-wallet' style="font-size:50px;color:#4CAF50;"></i>Enter Amount</h2>    
 <h6 style="color:#4CAF50;font-size:85%; margin-top:2%; text-align:center;">Amount will be added in your VeggieFridge Wallet</h6>
 
 <input type="text"  name="TXN_AMOUNT" placeholder="Enter Amount"  required style="width: 77%;
  padding: 12px;
  margin: 3px 0 12px 0; 
  display: inline-block;
  border: none;
  background: #f1f1f1;border-radius:4px;">
 
 <input type="submit" value="Continue"  style="width: 79%;  padding:12px; margin-left: 1%; margin-right: 1%;background-color:green;"/>
      </div>
      </div>
     </form>
    </div>
    
    <script>
   function handleChange(input) {
    if (input.value < 0) input.value = 0;
    if (input.value > 5000) input.value = 5000;
  }
</script>
</body>
</html>
