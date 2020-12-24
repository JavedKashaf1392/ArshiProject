    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Home screen of VeggieFridge</title>
        <script>document.getElementsByTagName("html")[0].className += " js";</script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
        </head>
        <style>

body {font-family: Arial, Helvetica, sans-serif;
}
 
body
{
    font-family: Arial;
    margin: 0;
    padding: 0;
    font-family: "Roboto", sans-serif;
}
.header{
    position:relative;
    padding: 20px;
    padding: 20px;
    width: 100%;
    /* height:30px; */
}

.logo{
 position:absolute;
 float:left;
 margin-right:60%;
}

/* call */
.call{
/* border:1px solid black;   */
font-size:16px;
float: right;
margin-right:6%;
}

  .notification {
  margin-left:4%;
  background-color:#4CAF50;
  color: white;
  text-decoration: none;
  padding: 12px 24px;
  position: relative;
  display: inline-block;
  border-radius:4px;
  margin-right:14%; 
}

.notification:hover {
  background: green;
}

.notification .badge {
  position: absolute;
  top: -10px;
  right: -10px;
  padding: 4px 10px;
  border-radius: 50%;
  background-color: red;
  color: white;
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

input[type=text], select, textarea {
  width: 90%;
  padding: 8px;
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 135px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 130%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 22%;
  margin-left: 68%;
  border-radius: 4px;
 
}

/* The Close Button */
.close {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.close:hover,
.close:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
 .popUpMain{ 
  outline: #4CAF50 solid 10px;
  display: none;   /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1001; /* Sit on top */
  padding-top: 75px;  /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
 /*  overflow: auto; /* Enable scroll if needed */ */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.8); /* Black w/ opacity */
  box-shadow: 1px 2px 5px 3px white;
  } 
  
.popup {/* 
  /* background-color:#f1f1f1; */
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 30%;
  margin-left: 34%;
}
  
.head{
    margin-left:10%;
    position:relative;
    padding: 20px;
    padding: 20px;
    width: 100%;
    height: 20px;
    /* background: #4CAF50; */
}
   
}
form.example input[type=text] {
  padding:12px;
  font-size:17px;
  border: 1px solid grey;
}

  form.example button {
  width:5%;
  padding:8px 7px;
  background: #4CAF50;
  color:white;
  font-size:17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
  border-radius:4%;
}

form.example button:hover {
  background: green;
}

.navbar {
  overflow: hidden;
  background-color:#4CAF50 ;
  margin-top:16px;
}
.navbar a {
  float:left;
  font-size: 20px;
  color: white;
  text-align: center;
  text-decoration: none;
}

.dropdown {
  float: left;
  overflow: hidden;
}

.dropdown .dropbtn {
  font-size: 16px;  
  border: none;
  outline: none;
  color: white;
  padding: 10px 15px;
  background-color: inherit;
  font-family: inherit;
  margin: 0;
}

.navbar a:hover, .dropdown:hover .dropbtn {
  background-color: ;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {
  background-color:#4CAF50;
}
.dropdown:hover .dropdown-content {
  display: block;
}
/* ................... */
  </style>
  <style>
  .menu {
  display: none; /* Hidden by default */
  position:absolute; /* Stay in place */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  /*background-color: rgb(0,0,0);*/ /* Fallback color */
 /* background-color: rgba(0,0,0,0.4);  Black w/ opacity */
  padding-top: 60px;
}
  
 .left_area h3{
  color: #fff;
  margin: 0;
  text-transform: uppercase;
  font-size: 22px;
  font-weight: 900;
}

.left_area span{
  color: white;
}
.sidebar{
  background:#4CAF50;
  margin-top:69px;
  padding-top:20px;
  position:absolute;
  left: 0;
  width: 320px;
  height: 59%;
  transition: 0.5s;
  transition-property: right;
  margin-left:71%;
}

.sidebar h4{
  color:white;
  margin-top: 0;
  margin-bottom: 20px;
}

.sidebar a{
  color: #fff;
  display: block;
  width: 100%;
  line-height: 60px;
  text-decoration: none;
  padding-left: 40px;
  box-sizing: border-box;
  transition: 0.5s;
  transition-property: background;
}
.sidebar a:hover{
  background: green;
}

.sidebar i{
  padding-right: 10px;
}

label #sidebar_btn{
  z-index: 1;
  transition: 0.5s;
  transition-property: color;
}

label #sidebar_btn:hover{
  color: #19B3D3;
}

#check:checked ~ .sidebar{
  left: -190px;
}

#check:checked ~ .right.sidebar a span{
  display:none;
}

#check:checked ~ .sidebar a{
  font-size: 20px;
  margin-left: 170px;
  width: 80px;
}
#check{
  display: none;
} 
.cartpopup{
  display: none; /* Hidden by default */
  position:absolute; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 135px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 130%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
 /*  background-color: rgb(0,0,0); /* Fallback color */
  /* background-color: rgba(0,0,0,0.8); */
}

/* Modal Content */
.cart-content {
  background-color: #fefefe;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 22%;
  margin-left: 60%;
  border-radius: 4px;
}
 input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 10px 15px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top:2px;
}

input[type=submit]:hover {
  background-color: #45a049;
} 
    </style>
    <body>
   
   <!--   
   <div style="position:absolute;margin-left:11%;
    margin-right:20%;
    width:80%;border:1px solid #f1f1f1;">
    -->
    
   <div style="margin-left:11%;
    margin-right:20%;
    width:80%;border:1px solid #f1f1f1;">
    
   <div class="logo" style="margin-top:5px;">
   <spring:url value="/images" var="images" />
   <img src="${images}/logo.jpg" width="150" height="90"/>
   </div> 
   
 <div class="call" style="margin-top:5px;"> 
 
 <security:authorize access="hasAnyRole('ADMIN', 'USER')">  
 <span class='fas fa-user-circle' style="color:green;"></span>
 <a href="#" style="text-decoration: none;color: black;" onclick="document.getElementById('id05').style.display='block'">Hello,${customerModel.firstName}</a><i class="fa fa-caret-down" style="font-size:20px;color:green;"></i> |
 </security:authorize> 
  
  <security:authorize access="hasRole('USER')">
  <span class="fas fa-map-marker-alt" style="color:green;"></span><%-- ${kiosklocation.location},${kiosklocation.cities} --%>
  <a href="#" id="myBtn" style="text-decoration: none;color: black;margin-right:2px;">${customerModel.cities},${customerModel.location}</a><i class="fa fa-caret-down" style="font-size:20px;color:green;"></i>  | 
  </security:authorize>
  
 <span class="fas fa-phone-alt" style="color:green;"></span><span>+089-765432100</span> |
 
 <%--  <security:authorize access="permitAll">
 <span class="fa fa-edit" style="color:green;"></span>
 <a href="${pageContext.request.contextPath}/signup" style="text-decoration: none;color: black;">Sign Up</a> |  
 </security:authorize>
 
 <security:authorize access="permitAll">
 <span class='fas fa-unlock-alt' style="color:green;"></span>
 <a href="${pageContext.request.contextPath}/login" style="text-decoration: none;color: black;">Hello,Sign In</a>
  </security:authorize> --%>
  
 <security:authorize access="hasAnyRole('ADMIN', 'USER')">   
 | <span class='fas fa-sign-out-alt' style="color:green;"></span>
   <a href="<c:url value="/logout" />" style="text-decoration: none;color: black;"> Logout</a>
 </security:authorize>  
 
 <!-- The Modal -->
 <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  <!-- <span class="close">&times;</span> -->
  <form method="post" action="${pageContext.request.contextPath}/cart/changeLocation" modelAttribute="kioskLocation">
  <p style="width:20%;text-align: right;"><h4 style="color: green;">Choose your city  to start shopping</h4>
  <div class="row">
  <div class="col-75">
      
       <select id="cities" name="cities" required  style="background-color:#f1f1f1;">
       <option value=""style="color: black;" >Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select><br><br>
        
       <select id="location" name="location" required  style="background-color:#f1f1f1;">
       <option value="" style="color: black;">Select location</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option   value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
       </c:forEach>
      </select>
    </div>
    </div>

 <div style="text-align:center;">
 <input type="submit" value="Continue" style="width: 30%;"/>
 </div></p></form>
 </div>
 </div>
 </div>
  
  <div class="search" style="margin-left:18%;width:100%;margin-top:34px;">                                                 
  <form class="example">
  <input type="text" placeholder="Search For Vegetabels,Milk And More........" name="search" id="myInput" onkeyup="myFunction()" style="width:55%;padding:10px 10px;">
  <button type="submit" style="border-radius:4px;margin-right:2%;"><i class="fa fa-search"></i></button>
  <a href="#" class="notification" id="group">
  <span>Cart<i class='fas fa-cart-plus' style="font-size:22px;"  onclick="document.getElementById('id06').style.display='block'"></i></span>
  <div class="badge" id="output">${customerModel.cartpage.cartitem}</div>
  </a>
 </form>
  
  <div id="id06" class="cartpopup">
  <div class="cart-content">
  Yout cart is Empty
  </div>
  </div>
  </div>
  
      <div class="right" style="float: right;">
     <%--  <span  class='fas fa-user-circle' style="color:green;"></span> 
      Hello<span onclick="document.getElementById('id05').style.display='block'">,${customer.firstName}</span> |  --%>
      <div id="id05" class="menu">
      <div class="sidebar">
      <center>
      <i class='fas fa-user-circle' style='font-size:85px;color:white;margin-right:3%;'></i>
      <span style="color:white;font-size:25px;font-family:'Montserrat',sans-serif">Hello, ${customer.firstName}</span>
      </center>
      <a href="#"><i class="fa fa-user-circle"></i><span>My Account</span></a>
      <a href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}"><i class="fa fa-bars"></i> <span>My Orders</span></a>
      <a href="${pageContext.request.contextPath }/cart/listCustomerCartItem"><i class="fa fa-shopping-cart"></i> <span>My Cart</span></a>
      <a href="${pageContext.request.contextPath }/wallet/myWallet/${customerModel.customerid}"><i class='fas fa-wallet'></i> <span>My Wallet</span></a>
      <a href="#"><i class='fas fa-user-friends'></i> <span>Membership</span></a>
      <a href="#"><i class="fas fa-info-circle"></i> <span>Ask us</span></a>
      <a href="<c:url value="/logout" />"><i class='fas fa-sign-out-alt'></i> <span>Log Out</span></a>
      </div>
      </div> 
       
<!-- The Modal -->
<div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
  <!-- <span class="close">&times;</span> -->
  <form method="post" action="${pageContext.request.contextPath}/home/regcontinueLocation" modelAttribute="kioskLocation" >
  <p style="width:20%;text-align: right;"><h4 style="color: green;">Choose your city  to start shopping</h4>
  <div class="row">
  <div class="col-75">
      
       <select id="cities" name="cities" required  style="background-color:#f1f1f1;">
       <option value=""style="color: black;" >Select city</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option value="${kiosklocation.cities}" style="color: black;">${kiosklocation.cities}</option>
       </c:forEach>
       </select><br><br>
        
       <select id="location" name="location" required  style="background-color:#f1f1f1;">
       <option value="" style="color: black;">Select location</option> 
       <c:forEach items="${listkiosklocation}" var="kiosklocation">
       <option   value="${kiosklocation.location}" style="color: black;">${kiosklocation.location}</option>
       </c:forEach>
      </select>
    </div>
    </div>

 <div style="text-align:center;">
 <input type="submit" value="Continue" style="width: 30%;"/>
 </div></p></form>
 </div>
</div> 
 </div>
 
 <script>
// Get the modal
var modal = document.getElementById("myModal");
  
// Get the button that opens the modal
var btn = document.getElementById("myBtn");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
  <div class="navbar">
  <div class="dropdown">
    <button class="dropbtn">Search By Category  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Fruit Vegetable</a>
      <a href="#">leafy vegetable</a>
      <a href="#">Milk</a>
    </div>
  </div> 
  <security:authorize access="hasRole('USER')">
<div class="dropdown">
    <button class="dropbtn">Discounts
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div> 
  </security:authorize>
  
  <security:authorize access="hasRole('USER')">
  <div class="dropdown">
    <button class="dropbtn">More
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
      <a href="#">Link 1</a>
      <a href="#">Link 2</a>
      <a href="#">Link 3</a>
    </div>
  </div>
  </security:authorize> 
 
  <security:authorize access="hasRole('ADMIN')">  
  <div class="dropdown">
    <button class="dropbtn">Manage
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="${pageContext.request.contextPath }/product/viewAll">Manage Product</a>
      <a href="${pageContext.request.contextPath }/kiosk/listKiosk">Manage kiosk</a>
      <a href="${pageContext.request.contextPath }/location/listLocation">Manage Location</a>
      </div>
      </div>
     </security:authorize> 
     
 
    <security:authorize access="hasRole('USER')">    
    <div class="dropdown">
    <button class="dropbtn">Join Membership
    </button>
    </div>
    </security:authorize>
     
      </div>
     
      </div> 
      </div>
      </div>
     
     
     <script>
     function myFunction() {
         var input, filter, ul, li, a, i, txtValue;
         input = document.getElementById("myInput");
         filter = input.value.toUpperCase();
         ul = document.getElementById("myUL");
         li = ul.getElementsByTagName("li");
         for (i = 0; i < li.length; i++) {
             a = li[i].getElementsByTagName("a")[0];
             txtValue = a.textContent || a.innerText;
             if (txtValue.toUpperCase().indexOf(filter) > -1) {
                 li[i].style.display = "";
             } else {
                 li[i].style.display = "none";
             }
         }
     }
     </script>

     <script>
     // Get the modal
     var cartpopup = document.getElementById('id06');

     // When the user clicks anywhere outside of the modal, close it
     window.onclick = function(event) {
         if (event.target == cartpopup) {
         	cartpopup.style.display = "none";
         }
     }
     </script>

     <script>
     // Get the modal
     var menu = document.getElementById('id05');

     // When the user clicks anywhere outside of the modal, close it
     window.onclick = function(event) {
         if (event.target == menu) {
         	menu.style.display = "none";
         }
     }
     </script>

         <script> 
     	// Use find() function to extract the badge 
     	// count from '#group' container. 
     	$(document).ready(function() { 
     		$(".btn").click(function() { 
     			var val = parseInt($('#group').find('.badge').text()); 

     			// Check for the button clicked 
     			if ($(this).hasClass('btn-danger')) { 
     				$('#group').find('.badge').text(val - 1); 
     			} else if ($(this).hasClass('btn-success')) { 
     				$('#group').find('.badge').text(val + 1); 
     			} 
     		}); 
     	}); 
     </script> 

     <script>
     $('#b').click(function() {
         $('#c').html(function(i, val) { return val*1+1 });
     });
     </script>


    
</body>
</html>