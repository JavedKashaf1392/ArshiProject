<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<title>VeggieFridge</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="images/VeggieFridge.ico" type="image/x-icon">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
		
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;
</style>

<script type="text/javascript">
$(document).ready(function(){
	//alert('Welcome to VeggieFridge');
	$('#id_get_time').click(function(){
		 //alert("ok");
		//alert('button clicked......');
		$.ajax({
		  type:'GET',
		  url:'${pageContext.request.contextPath }/cart/getServerTime',
			//url :'/getServerTime',
		   dataType: 'json',
			success : function(data){
				$('id_time').html(data);
				 //console.log('success',data);
				}
			});
		});
});
</script>

</head>
<body>
<h2>Ajax Test Page</h2>
<button id="id_get_time">Get Server Time</button><br/>
<p id="id_time"></p>	
</body>
</html>