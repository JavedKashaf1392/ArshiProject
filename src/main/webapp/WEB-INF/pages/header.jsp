<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<title>VeggieFridge</title> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<spring:url var="css" value="/resources/css"></spring:url>
<spring:url var="js" value="/resources/js"></spring:url>
<spring:url var="images" value="/resources/images"></spring:url>

<script src='https://kit.fontawesome.com/a076d05399.js'></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
	
<link href="${css}/header.css" rel="stylesheet">

<script type="text/javascript">
window.menu='${title}';
</script>

<style>
@import
url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap');

.magic-shadow:after{
    background-image:url("${images}/shadow.svg");  
}

.magic-shadow-sm:after{
    background-image:url("/images/shadow-sm.svg");  
}

/* The Modal (background) */
.a {
   /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top:100px; /* Location of the box */
  left:0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.a-content {
  position: relative;
  background-color: #fefefe;
  margin-left:58%;
  padding:0;
  border: 1px solid #888;
  width:22%;
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2),0 6px 20px 0 rgba(0,0,0,0.19);
  -webkit-animation-name: animatetop;
  -webkit-animation-duration: 0.4s;
  animation-name: animatetop;
  animation-duration: 0.4s;
  margin-top:-58px;
  
}

/* Add Animation */
@-webkit-keyframes animatetop {
  from {top:-300px; opacity:0} 
  to {top:0; opacity:1}
}

@keyframes animatetop {
  from {top:-300px; opacity:0}
  to {top:0; opacity:1}
}

/* The Close Button */
.aclose {
  color: white;
  float: right;
  font-size:28px;
  font-weight: bold;
}

.aclose:hover,
.aclose:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}

.modal-header {
  padding:6px 0px;
  background-color: #5cb85c;
  color: white;
}

.modal-body {padding:20px 0px;}

.modal-footer {
  padding: 2px 0px;
  background-color: #5cb85c;
  color: white;
}

.form {
padding: 0px 20px;
}

.form-control input, select {
	border: 2px solid #f0f0f0;
	border-radius:4px;
	display: block;
	font-family: inherit;
	font-size: 14px;
	padding: 10px;
	width: 100%;
	margin-bottom:8px;
}
.form button {
	background-color: #4CAF50;
	border: 2px solid #4CAF50;
	border-radius: 50px;
	color: #fff;
	display: block;
	font-family: inherit;
	font-size: 16px;
	padding: 10px;
	width: 100%;
}
.form button hover {
	opacity: 0.8;
}
</style>
</head>
<body>

<!-- ......... HeadSection........ -->

<div class="main-wrapper" style="position:relative;
      width:100%;
      height:100vh;
      overflow:hidden;"> 
      
<div class="nav-background">
   		
   <div class="mobile-logo">
   <spring:url value="/images" var="images" />
   <img src="${images}/VeggieFridge.ico"  width="150" height="100" alt=""/>
   </div>
   
   <div class="mobile-nav">
   <div class="cart">
   <div class="flex items-center">
     <security:authorize access="isAnonymous()">
     <a href="#">Nagpur,Mihan</a><%-- ${customerModel.cities}, ${customerModel.location} --%>
     </security:authorize>
   <security:authorize access="isAnonymous() or hasRole('USER')">
   <spring:url value="/images" var="images" />
   <img src="${images}/cart-dark.svg"  width="15" height="15" alt=""/>
   <!--   <img src="./icons/cart-dark.svg" alt=""> -->
   <a href="#">${customerModel.cartpage.cartitem} Items - (&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/>)</a>
   </security:authorize>
   </div>
                </div>
                <div class="nav-top">
                    <ul style="display: block;">
                    
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">About us</a>
                        </li>
                        <li>
                            <a href="#">Products</a>
                        </li>
                        <li>
                            <a href="#">Blog</a>
                        </li>
                        <li>
                            <a href="#">Shop</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li>
                            <a href="#">Contact us</a>
                        </li>
                        <security:authorize access="isAnonymous()">
                        <li>
                            <a href="#">Log in</a>
                        </li>
                        <li>
                            <a href="#">Register</a>
                        </li>
                        </security:authorize>
                          <security:authorize access="hasAnyRole('ADMIN', 'USER')">
                        <li>
                            <a href="<c:url value="/logout"/>">Log Out</a>
                        </li>
                        </security:authorize>
                        
                    </ul>
                </div>
                <div class="contact flex items-center">
   <spring:url value="/images" var="images" />
   <img src="${images}/phone2.png"  width="25" height="25" alt=""/>
                    <!-- <img src="./icons/phone.svg" alt=""> -->
                    <div>
                        <h5>Call us: (+84) 123 456 789</h5>
                        <h6>E-mail : support@freshmeal.com</h6>
                    </div>
                </div>
            </div>
        </div>
  
      <div class="site-content-wrapper">
        
                <div class="nav-trigger">
                <svg xmlns="" width="24" height="24" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
   	                 class="feather feather-bar-chart">
                    <line x1="12" y1="20" x2="12" y2="10" />
                    <line x1="18" y1="20" x2="18" y2="4" />
                    <line x1="6" y1="20" x2="6" y2="16" /></svg>
                    </div> 
            
                <div class="site-content">
                <div style="position:fixed;z-index:999;width:99%;margin-right:0;">
                 
                 
                 <div id="mydiv">
                 <c:if test="${not empty message}" > 
				<div class="alert">
				<span class="closebtn">&times;</span><strong></strong> ${message}.
				</div>
			    </c:if> 
			    </div>
                 
               
                <header class="topbar">
                <div class="container flex justify-between items-center">
                        <div class="icons">
                            <spring:url value="/images" var="images" />
                            <img src="${images}/facebook.svg"  width="15" height="15" alt=""/>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/twitter.svg"  width="15" height="15" alt=""/>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/google.svg"  width="15" height="15" alt=""/>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/instagram.svg"  width="15" height="15" alt=""/>
                          
                        </div>
                        <div class="auth flex items-center">
                         
                        <security:authorize access="isAnonymous()">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/user-icon.svg"  width="15" height="15" alt=""/>
                              <!--   <img src="./icons/user-icon.svg" alt=""> -->
                            <a href="${pageContext.request.contextPath}/login">Log in</a>
                            </div> 
                            <span class="divider">|</span>
                            </security:authorize>
                             
                            <security:authorize access="isAnonymous()">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/edit.svg"  width="15" height="15" alt=""/>
                            <!--   <img src="./icons/edit.svg" alt=""> -->
                            <a href="${pageContext.request.contextPath}/signup">Register Now</a>
                            </div>
                            <span class="divider">|</span> 
                            </security:authorize>
                            
<security:authorize access="hasAnyRole('ADMIN', 'USER')">
<div class="dropdown">
<spring:url value="/images" var="images" />
<img src="${images}/user-icon.svg"  width="15" height="15" alt=""/>Hello, ${customerModel.firstName}
<span class="fas fa-caret-down" style="color: white;"></span>
                          
<ul class="dropdown-content">
<li><a href="${pageContext.request.contextPath }/myaccount/editProfile">My Profile</a></li>
<li><a href="${pageContext.request.contextPath }/cart/listCustomerCartItem">My Cart</a></li>
<li>
          <label for="btn-3" class="second" style="color: white;">My Orders
            <span class="fas fa-caret-down"></span>
          </label>
          <input type="checkbox" id="btn-3" style="display: none;">
<ul>
<li><a href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}">Current</a></li>
<li><a href="${pageContext.request.contextPath }/order/showDeliveredOrders${customerModel.customerid}">Delivered</a></li>
<li><a href="${pageContext.request.contextPath }/order/showCancelOrders${customerModel.customerid}">Cancelled</a></li>
</ul>
</li>
<li><a href="${pageContext.request.contextPath }/wallet/myWallet/${customerModel.customerid}">My Wallet</a></li>

<li><a href="<c:url value="/logout"/>">Log Out</a></li>
</ul>
 </div>
<span class="divider">|</span>  
</security:authorize>     
                            <security:authorize access="hasRole('USER')">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/location.png"  width="15" height="15" alt=""/>
                            <!--   <img src="./icons/user-icon.svg" alt=""> -->
                            <a href="#" id="myloc">${customerModel.cities}, ${customerModel.location}</a>
                            <span class="fas fa-caret-down" style="color: white;"></span>
                            </div>
                             <span class="divider">|</span>
                            </security:authorize>
                             
                          
                           <security:authorize access="hasRole('USER')">
                           <div>
                           <spring:url value="/images" var="images" />
                           <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                           <!--  <img src="./icons/cart.svg" alt=""> -->
                           <a href="${pageContext.request.contextPath}/cart/listCustomerCartItem">${customerModel.cartpage.cartitem} Items - (${repee_sign} <fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/>)</a>
                           </div>
                           </security:authorize>
                           
                           <security:authorize access="isAnonymous()">
                           <div>
                           <spring:url value="/images" var="images" />
                           <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                           <!--  <img src="./icons/cart.svg" alt=""> -->
                           <a href="#">0 Items - (${repee_sign}0.00)</a>
                           </div>
                           </security:authorize>
                        </div>
                    </div>
                </header>
            
                <nav>
                
                <div class="top">
                <div class="container flex justify-between" style="background-color:white;">
              
         
                            <div class="contact flex items-center">
       <a href="${pageContext.request.contextPath}/home">                    
     <table> 
     <th>                    
   <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="60" height="60" alt=""/>
   </th> 
   <th>   
    <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
    </th>
    </table>  
    </a>                
   <div>
  
           <!--  <h5>Call US: (+84) 123 456 789</h5>
           <h6>E-mail : support@freshmeal.com</h6> -->
                              </div>   
                            </div>
                            <div class="branding">
                            <form class="search-form" 
  style="position:relative;
  width: 350px;
  height: 40px;
  border-radius: 40px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.10);
  transform: translate(-50%, -50%);
  background: #fff;
  transition: all 0.3s ease; top:40%;
  left:48%;">
   
  <input type="search" value="" placeholder="Search" class="search-input" id="myInput">
  <button type="submit" class="search-button">
  </button>
  </form>
                              
                            </div>
                            <div class="time flex items-center">
                               
                                <spring:url value="/images" var="images" />
   <img src="${images}/Phone1.jpg"  width="25" height="25" alt=""/>
                               <!--  <img src="/images/phone.svg" alt=""> -->
                                <div>
                                    <h5>Call Us: (+91) 982 357 6042  </h5>
                                    <h6>E-mail : support@veggiefridge.com</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <security:authorize access="isAnonymous() or hasRole('USER')">
                    <div class="navbar magic-shadow">
                    <div class="container flex justify-center">
                    <a href="${pageContext.request.contextPath}/home" id="home">Home</a>      
                    <a href="${pageContext.request.contextPath}/ProductsByCatogary" onclick="location.href=this.href+'?param='+v1;return false;showOrHideDiv()" id="leafy">Leafy Vegetables</a>
                    <a href="${pageContext.request.contextPath}/ProductsByCatogary" onclick="location.href=this.href+'?param='+v2;return false;showOrHideDiv()" id="fruit">Fruit Vegetables</a>
                    <a href="${pageContext.request.contextPath}/ProductsByCatogary" onclick="location.href=this.href+'?param='+v3;return false;showOrHideDiv()" id="milk">Milk</a>
                    <a href="${pageContext.request.contextPath }/discount" id="discount">Discount</a>
                    <a href="${pageContext.request.contextPath }/blog" id="blog">Blog</a>
                    <a href="${pageContext.request.contextPath }/contactus" id="contact">Contact Us</a>
                    <script> 
        var v1 = 'Leafy Vegetables'
        var v2 = 'Fruit Vegetables'
        var v3 = 'Milk'    
        </script>
                    
                    <%-- <c:forEach var="menu" items="${listNavbarMenu}"> 
                    <a href="${menu.url}" onclick="location.href=this.href+'?param='+${menu.jsvar};return false;showOrHideDiv()" id="preview">${menu.menues}</a>
                   
   
     <script> 
        var ${menu.jsvar} = '${menu.paramKey}'
    </script>
    </c:forEach>  --%>
   </div>
   </div>
   </security:authorize>
                     
              
               <security:authorize access="hasRole('ADMIN')">
               <div class="navbar magic-shadow">
                            <div class="container flex justify-center">
                           <!--  <ul class="navbar-nav"> -->
                           <!--  <li class="active"> --><a href="${pageContext.request.contextPath}/home"  id="home">Home</a>
                            <a href="${pageContext.request.contextPath}/manageProduct" id="product">Manage Product</a>
                            <a href="${pageContext.request.contextPath}/manageLocation" id="location">Manage Location</a>
                            <a href="${pageContext.request.contextPath}/manageKiosk" id="kiosk">Manage Kiosk</a>
                           <!--  </ul> -->
                           </div>
                           </div>
               </security:authorize>
               </nav>

<!-- Trigger/Open The Modal -->
<!-- <button id="myloc">Open Modal</button> -->

<!-- The Modal -->
<div id="aModal" class="a" style="display:none;">

  <!-- Modal content -->
  <div class="a-content">
    <div class="modal-header">
      <span class="aclose">&times;</span>
      <h2 style="font-weight:400;font-size:20px;text-align:center;">Choose Your Location</h2>
    </div>
    <div class="modal-body">
      <form  class="form" action="${pageContext.request.contextPath }/addguestcustomers" modelAttribute="customer" method="post">
		
        <!-- ..........City........... -->
			<div class="form-control">
				<select id="city" name="cities">
					<option value="">Select City</option>
					<option value="Nagpur">Nagpur</option>
					<option value="Hyderbad">Hyderbad</option>
					<option value="Bhopal">Bhopal</option>
				</select> 
			</div>

			<!-- ..........Location........... -->

			<div class="form-control">
				<select id="location" name="location">
					<option value="">Select KioskLocation</option>
					<option value="Mihan">Mihan</option>
					<option value="Ameerpet">Ameerpet</option>
					<option value="Koh-e-Fiza">Koh-e-Fiza</option>
				</select> 
			</div>
<button>Submit</button>
		</form>
    </div>
   <!--  <div class="modal-footer">
      <h3>Modal Footer</h3>
    </div> -->
  </div>
  </div>
  </div>
  
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script> 
  
 
   <script>
// Get the modal
var modal = document.getElementById("aModal");

// Get the button that opens the modal
var btn = document.getElementById("myloc");

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("aclose")[0];

// When the user clicks the button, open the modal 
btn.onclick = function() {
  modal.style.display = "block";
}

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>

<script>
var val = document.getElementById("aModal");
$( '.navbar .container a' ).on( 'click', function () {
	$( '.navbar .container' ).find( 'a.active' ).removeClass( 'active' );
	$( this ).addClass( 'active' );
});
</script>


<script>
//solving the active menu problem
switch (menu) {
case 'Leafy Vegetables':
	$('#leafy').addClass('active');
	break;
case 'Fruit Vegetables':
	$('#fruit').addClass('active');
	break;
case 'Milk':
	$('#milk').addClass('active');
	break;
case 'Discount':
	$('#discount').addClass('active');
	break;
case 'Blog':
	$('#blog').addClass('active');
	break;
case 'Contact Us':
	$('#contact').addClass('active');
	break;
case 'Manage Product':
	$('#product').addClass('active');
	break;
case 'Manage Location':
	$('#location').addClass('active');
	break;
case 'Manage Kiosk':
	$('#kiosk').addClass('active');
	break;
case 'Product Management':
	$('#manageProduct').addClass('active');
	break;
case 'Shopping Cart':
	$('#userModel').addClass('active');
	break;		
default:
	$('#home').addClass('active');
		break;
	/* $('#listProducts').addClass('active');
	$('#a_' + menu).addClass('active'); */
	/* break; */
}
</script>

<script type="text/javascript" src="${js}/main.js"></script>
 	
</body>
</html>

 
