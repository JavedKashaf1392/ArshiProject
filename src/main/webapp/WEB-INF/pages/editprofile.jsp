
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>

  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>  

 <!DOCTYPE HTML>
 <html lang="en" dir="ltr">
        
        <head> 
        <link rel="icon" type="image/jpg" href="images/logo.jpg">
        <meta charset="utf-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"> -->
        <title>Edit Profile-VeggieFridge</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">   
       <link rel="icon" type="image/x-icon" href="favicon.png">
        <style>
        
body {
font-family: Arial, Helvetica, sans-serif;
background-color: white;
}
hr{
border:1px solid #f1f1f1;
}
input[type=text], select, textarea {
  /* border: 1px solid black; */
  margin-left: 10px;
  margin-top:10px;
  width: 110%;
  padding: 8px;
  border: 1px solid #008000;
 /*  border-radius: 4px; */
  resize: vertical;
}
input[type=submit]:hover {
  background-color: #45a049;
}
.footer{
    margin-left:15%;
    margin-right:20%;
    position:relative;
    width:72%;
    height:500px;
    background: #4CAF50; 
    position:relative;
   /*  padding: 20px;
    padding: 20px; */
    /* border:1px solid black;  */
    margin-top:auto;
    
}
.carousel{
    padding: 20px;
    padding: 20px;
    margin-left:150px;
    /* margin-right:100px; */
    position:relative;
    width: 100%;
    margin-top:5px;
   /*  background: #4CAF50; */
    /*  border: 1px solid grey;  */
     height:550px;
     transition:1s;
     display: -webkit-box;
     display: -ms-flexbox;
     display: flex; 

}
 @import url('https://fonts.googleapis.com/css?family=Poppins:400,500,600,700&display=swap'); 
 
 *{
    margin: 0;
    padding: 0;
   /*  color: #d9d9d9; */
   /*  color:black; */
    /* box-sizing: border-box;
    font-family: 'Poppins', sans-serif; */ 
} 
.main-content{
    display: flex;
}
.main-content .box{
    flex-basis: 50%;
    padding: 10px 20px;
}
.box h2{
    font-size: 1.125rem;
    font-weight: 600;
    text-transform: uppercase;
}
.box .content{
    margin: 20px 0 0 0;
    position: relative;
}
.box .content:before{
    position: absolute;
    content: '';
    top: -10px;
    height: 2px;
    width: 100%;
    background: #1a1a1a; 
      /*   background: #d9d9d9; */
}
.box .content:after{
    position: absolute;
    content: '';
    height: 2px;
    width: 15%;
  /*   background: #f12020; */
  background: #d9d9d9;
    top: -10px;
}
.left .content p{
    text-align: justify;
}
.center .content .social{
    margin: 20px 0 0 0;
}
.center .content .social a{
    padding: 0 2px;
}
.center .content .social a span{
    height: 40px;
    width: 40px;
    /*  background: #1a1a1a;  */
    background: white;
    line-height: 40px;
    text-align: center;
    font-size: 18px;
    border-radius: 50px;
    transition: 0.3s;
}
/* ...Left Content.... */
.center .content .social a span:hover{
    background: #f12020;
}
.center .content .fas{
    font-size: 1.4375rem;
   /*  background: #1a1a1a; */
    background: white;
    height: 45px;
    width: 45px;
    line-height: 45px;
    text-align: center;
    border-radius: 50%;
    transition: 0.3s;
    cursor: pointer;
}
.center .content .fas:hover{
    background: #4CAF50;
}
.center .content .text{
    font-size: 1.0625rem;
    font-weight: 500;
    padding-left: 10px;
}
.center .content .phone{
    margin: 15px 0;
}
.right form .text{
    font-size: 1.0625rem;
    margin-bottom: 2px; 
    color: #656565;
}
.right form .msg{
    margin-top: 10px;
}
.right form input, .right form .msgForm{
    width: 100%;
    font-size: 1.0625rem;
   /*  background: #151515; */
    /* padding-left: 10px; */
    border: 1px solid #222222;
}
.right form input:focus,
.right form .msgForm:focus{
    outline-color: #3498db;
}
.right form input{
    height: 35px;
}
.right form .btn{
    margin-top: 10px;
}
.right form .btn button{
    height: 40px;
    width: 100%;
    border: none;
    outline: none;
    background: #125688;
    font-size: 1.0625rem;
    font-weight: 500;
    cursor: pointer;
    transition: .3s;
}
.right form .btn button:hover{
    background:  #4CAF50;
}
.bottom center{
     align-content:
 /*  background: #444; */
   /* color: #fff;  */
    padding: 20px;
    margin-top:130px;
    padding: 5px;
    font-size: 0.9375rem;
   background: white; 
    width: 80%;
}
.bottom center span{
    color: #656565;
}
.bottom center a{
    color: black;
    text-decoration: none;
}
.bottom center a:hover{
    text-decoration: underline;
}
@media screen and (max-width: 900px) {
    footer{
        position: relative;
        bottom: 0px;
    }
    .main-content{
        flex-wrap: wrap;
        flex-direction: column;
    }
    .main-content .box{
        margin: 5px 0;
    }
}
.active, .dot:hover {
  background-color: #717171;
}
 </style>  
  <body>
 
   <!--  header -->
 <jsp:include page ="userheader.jsp"/> 
 
  <div class="centercontent" style="background-color:;margin-top:15px;margin-bottom:20px;">
   
  <div class="sidemenu" style="margin: 0;
  padding: 0;
  width: 250px;
  background-color:;
  position: absolute;
  height:700px;
  /*overflow: auto;*/
  margin-left:15%;border:1px solid #ddd;">
  
  <a class="active" href="#home" style=" display: block;
  color: white;
  padding: 16px;
  text-decoration: none;background-color:; ">My Account</a>
  
  <a href="${pageContext.request.contextPath }/order/editProfile"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Edit Profile</a> 
  
  <a href="${pageContext.request.contextPath }/cart/editPassword/${customerModel.email}"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Change Password</a> 
  
  <a href="${pageContext.request.contextPath }/cart/listCustomerCartItem"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - MY Cart</a>
  
  <a href="${pageContext.request.contextPath }/order/pendingorders"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - MY Order</a>
  
  <a href="${pageContext.request.contextPath }/home/wallet" style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "-> - My Wallet</a>
  
  <a href="#home"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none;"> - Membership</a>
  
  <a href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Pending Orders</a>
  
  <a href="${pageContext.request.contextPath }/order/showDeliveredOrders${customerModel.customerid}"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Deliverd Orders</a>
  
  <a href="#news"  style=" display: block;
  color: black;
  padding: 16px;
  text-decoration: none; "> - Customer Service</a>
  
  <input type="button" style="width:140px;cursor:pointer;margin: 4px 4px;font-size:14px;text-decoration:none;border-radius:8px;text-align: center;color:white;background-color:#4CAF50;padding:10px;border:none;margin-left:8%;" value="Back" onclick="history.back()">
  </div>
  
  <div class="center" style=" margin-left: 200px;
  padding: 1px 16px;
  height: 700px;
  margin-left:32%; background-color: white;margin-right:13%;">
  
  <h3>Edit Profile Details </h3>
  <hr>
   <div style="border:1px solid #ddd;margin-top:10px;padding: 50px 50px;">
   <form:form action="${pageContext.request.contextPath}/cart/saveEditProfile" method="post" modelAttribute="customer">
        <table>
          <form:hidden path="customerid"/>
            <tr>
                 <td>First Name: <span style="color: red;">*</span> </td>
                 <td><form:input path="firstName"/><form:errors path="firstName" cssClass="error"/></td>
            </tr>
             <tr>
                <td>Last Name: <span style="color: red;">*</span>  </td>
                <td><form:input path="lastName"  /><form:errors path="lastName" cssClass="error"/></td>
            </tr>
            <tr>
                <td>Mobile: <span style="color: red;">*</span>  </td>
                <td><form:input path="mobile" /></td>
                <td><form:errors path="mobile" cssClass="error" /></td> 
            </tr>
            
            <tr>
                <td>City: <span style="color: red;">*</span>  </td>
                <td><form:input path="cities" /></td>
                <td><form:errors path="cities"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>KIOSK Location: <span style="color: red;">*</span>  </td>
                <td><form:input path="location" /></td>
                <td><form:errors path="location"  cssClass="error"/></td> 
            </tr>
            
            <tr>
                <td>Email: <span style="color: red;">*</span>  </td>
                <td><form:input path="email" /></td>
                <td><form:errors path="email" cssClass="error"/></td> 
            </tr>
           
           </table><br>
       <div class="row" style="margin-top:%;">
      <input type="submit" value="SAVE CHANGES">
      <input type="reset" value="CANCEL" style=" background-color: #4CAF50;
  color: white;
  padding: 10px 14px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top:10px;">
    </div>
          
        </form:form>
        </div>
    </div>
     <jsp:include page="footer.jsp" />
  </div>
  
 
 <!--  ............................  -->


 <script type="text/javascript">
  window.onload = function() {
    var selItem = sessionStorage.getItem("SelItem");  
    $('#sort-item').val(selItem);
    }
    $('#sort-item').change(function() { 
        var selVal = $(this).val();
        sessionStorage.setItem("SelItem", selVal);
    });
   </script>
 
  
  </body>
  </html>
  