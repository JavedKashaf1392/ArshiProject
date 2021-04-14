<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
	
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>	

 </head>
 <body>

<div>
<h2 id="response"></h2>
</div>

<form modelAttribute="product"  method="post" id="form">
<input type="hidden" value="1002" name="productid" id="productid">
<button type="submit" class="btn-cart" id="cart">add to cart</button>
</form>

		
 <!-- <script type="text/javascript">

$(document).ready(function () {
$("#form").submit(function (event) {
	alert("hi");
    //stop submit the form, we will post it manually.
    event.preventDefault();

    fire_ajax_submit();

});
});

function fire_ajax_submit() {
	var search = {};
	search["productid"] = $("#productid").val();
	alert(JSON.stringify(search));
	
$.ajax({
    type: "POST",
    contentType: "application/json",
    url:"${pageContext.request.contextPath }/cart/addToCart",
    data:JSON.stringify(search),
    dataType:"html",
    
    
    success: function(data) {
    $("#response").append(data);
    console.log(data);
    console.log("hello")
    alert(data)
 },
  
    error: function (e) {
    alert('respone back is error'+e)
    },
});

};
</script> -->	
		 
		 
		 
<!-- <script type="text/javascript">

$(document).ready(function () {
$("#form").submit(function (event) {
	alert("hi");
    //stop submit the form, we will post it manually.
    event.preventDefault();

    fire_ajax_submit();

});
});

function fire_ajax_submit() {
	//var search = {};
	 var productid = $('#productid').val();
	//search["productid"] = $("#productid").val();
	alert(JSON.stringify(productid));
	
$.ajax({
    type: "POST",
    contentType: "application/json",
    url:"${pageContext.request.contextPath }/cart/addToCart",{
    	productid : productid
        },
    data:JSON.stringify(productid),
    dataType:"html",
    
    
    success: function(data) {
    $("#response").append(data);
    console.log(data);
    console.log("hello")
    alert(data)
 },
  
    error: function (e) {
    alert('respone back is error'+e)
    },
});

};
</script> -->	
		
		<!-- <script>
  setTimeout(function() {
           /*  $('#mydiv').fadeOut('fast'); */
            $('#msg').delay(1000).fadeOut(500); 
        }, 1000); 
        </script> -->
        
<script type="text/javascript">
$(document).ready(function () {

$("#form").submit(function (event) {

    //stop submit the form, we will post it manually.
    event.preventDefault();

    fire_ajax_submit();
    

});

});

function fire_ajax_submit() {
 
 var productid=$("#productid").val();

 alert(productid);

$.ajax({
    type: "POST",
    contentType: "application/json",
    url: "${pageContext.request.contextPath }/cart/addToCart?productid="+productid,
  
    dataType: 'html',
    success: function(data) {
    $("#response").append(data);
    console.log(data);
    console.log("hello")
    alert(data)
 },
    error: function (e) {
    alert('respone back is error')
    },
    
    
});

};
</script>
        

 </body>
</html>