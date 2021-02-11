<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>

<html lang="en">
<head>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>

<meta charset="UTF-8">
<title>VeggieFridge</title>
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap')
	;

* {
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

.view_item img {
	width: 75px;
}

.wrapper {
	width: 1200px;
	margin: 20px auto;
}

.links {
	margin-bottom: 25px;
	background: #fff;
	padding: 15px;
	border-radius: 3px;
}

.links ul {
	display: flex;
	justify-content: center;
}

.links ul li {
	margin: 0 15px;
	font-weight: 600;
	text-transform: uppercase;
	letter-spacing: 3px;
	font-size: 20px;
	cursor: pointer;
}

.links ul li:hover, .links ul li.active {
	color: #4abd3e;
}

.view_main {
	background: #f5f5f5;
	border-radius: 3px;
	padding: 15px;
	border: 1px solid #e2efe1;
	padding: 30px 30px;
}

.list-view .view_item {
	background: #fff;
	border: 1px solid #e2efe1;
	margin: 10px;
	padding: 10px 20px;
	display: flex;
	align-items: center;
}

.list-view .view_item:last-child {
	margin-bottom: 0;
}

.list-view .view_item .vi_left {
	margin-right: 25px;
}

.view_item .title {
	font-weight: 600;
}

.view_item .content {
	margin: 5px 0;
	font-size: 14px;
	line-height: 22px;
	font-weight: 700;
}

.view_item .btn {
	width: 125px;
	background: #4abd3e;
	padding: 8px 5px;
	border-radius: 3px;
	color: #fff;
	text-align: center;
	font-weight: 200;
	cursor: pointer;
}

.view_item .btn:hover {
	background: #3bd62b;
}

.grid-view {
	width: 100%;
}

.grid-view .view_item {
	display: inline-block;
	border: 1px solid #e2efe1;
	width: 230px;
	padding: 25px;
	text-align: center;
	margin: 10px;
}

.grid-view .view_item .vi_left {
	margin-bottom: 10px;
}

.grid-view .view_item .btn {
	margin: 0 auto;
}

.splash {
	/*  text-align: center;
   margin-left:32%;
   margin-top:5%;
   font-family: 'Montserrat', sans-serif; */
	border-radius: 10px;
	/*  box-shadow: 0 14px 28px rgba(0,0,0,0.25), 
			0 10px 10px rgba(0,0,0,0.22); */
	position: relative;
	overflow: hidden;
	width: 450px;
	max-width: 100%;
	min-height: 100px;
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
	background-color: green;
}
.alert {
	padding: 10px;
	background-color:white;
	color:green;
	opacity: 1;
	transition: opacity 0.6s;
	margin-bottom: 15px;
	text-align: center;
	letter-spacing: 2px;
	cursor: pointer;
	font-weight: bold;
	max-width:1200px;
	margin: 10px auto;

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
}

</style>
</head>
<body>
	<jsp:include page="mainheader.jsp"></jsp:include>

	<div style="max-width: 1200px; margin: 17px auto;">

		<span
			style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">My
			Wallet</span>
	</div>

	<div class="wrapper">


		<div class="view_main">
		<c:if test="${not empty message}">
				<div class="alert">
					<span class="closebtn">&times;</span> <strong></strong> ${message}.
				</div>
			</c:if>

			<div class="view_wrap list-view" style="display: block;">
				<div class="view_item">
					<div class="vi_left">

						<spring:url value="/images" var="images" />
						<img src="${images}/wallet1.png" alt="tomato" />

						<!-- <img src="tomato.png" alt="tomato"> -->
					</div>
					<div class="vi_right">
						<p class="title" style="color: green;">Current Balance</p>
						<form modelAttribute="wallet">
							<p class="content">
								&#8377;<span style="font-size: 25px;"><fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${wallet.totalAmountBalance}" /></span>
							</p>
						</form>
						<!-- <div class="btn">Review</div> -->
					</div>


					<div class="view_item" style="margin-left: 130px;">


						<form method="post"
							action="${pageContext.request.contextPath}/wallet/addMoneyInWallet/${customerModel.customerid}"
							modelAttribute="kioskLocation">
							<h2 style="color: #4CAF50; text-align: center;">Enter Amount</h2>
							<h6 style="color: #4CAF50; margin-top: 2%; text-align: center;">Amount
								will be added in your VeggieFridge Wallet</h6>

							<input type="text" name="TXN_AMOUNT"
								placeholder="Enter Amount Max Limit &#8377;5000" required
								style="width: 100%; padding: 12px; margin: 3px 0 12px 0; display: inline-block; border: none; background: #f1f1f1; border-radius: 4px; margin: 5px auto;">

							<input type="submit" value="Continue"
								style="width: 100%; padding: 12px; background-color: green; margin: 5px auto;"onclick="return confirm('Are you sure to Add Money in Wallet?')" />

						</form>

					</div>



				</div>





			</div>

		</div>

	</div>




	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
		var close = document.getElementsByClassName("closebtn");
		var i;

		for (i = 0; i < close.length; i++) {
			close[i].onclick = function() {
				var div = this.parentElement;
				div.style.opacity = "0";
				setTimeout(function() {
					div.style.display = "none";
				}, 600);
			}
		}
	</script>


</body>
</html>