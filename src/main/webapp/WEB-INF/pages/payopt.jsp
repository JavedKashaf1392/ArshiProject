<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
.container{
		width:50%;
		padding: 40px;
		margin: 40px auto;
		background: #ddd;
		display: flex;
		flex-direction: row;
		justify-content: center;
		border:1px solid #ddd;
	}

	.box{
		width: 200px;
		height: 150px;
	 background:white; 
    margin: 0px 10px;
    transition: 1s;
    border:1px solid black;

	}
	.box:hover{
		transform: scale(1.3);
		background: ;
		z-index: 2;
		box-shadow: 2px 2px 2px #000;
		
	}

</style>

</head>
<body>
<h4 style="color:green;font-size:30px;text-align: center;">Select Payment Method</h4>
<div class="container">
	<div class="box"></div><p>Net Banking</p>
	<div class="box"></div>
	<div class="box"></div>
	<div class="box"></div>
	
</div>
</body>
</html>