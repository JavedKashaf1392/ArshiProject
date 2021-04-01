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
	margin: 220px auto 20px;
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

#myInput {
    background-image:url("/images/searchicon.png");
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 50%;
	font-size: 16px;
	padding: 12px 20px 12px 40px;
	/* border: 1px solid #ddd; */
	margin-bottom: 12px;
	margin-left: 15px;
}

#myTable {
	border-collapse: collapse;
	width: 100%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	text-align: left;
	padding: 12px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

/* calendar */
[type="date"] {
	background: #fff
		url(https://cdn1.iconfinder.com/data/icons/cc_mono_icon_set/blacks/16x16/calendar_2.png)
		97% 50% no-repeat;
}

[type="date"]::-webkit-inner-spin-button {
	display: none;
}

[type="date"]::-webkit-calendar-picker-indicator {
	opacity: 0;
}

label {
	display: block;
}

input{
   /*  border: 1px solid #c4c4c4;*/
	border-radius: 5px;
	background-color: #fff;
	padding: 3px 5px;
	/* box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1); */
	width: 190px;
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
	color:black;
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

	<jsp:include page="header.jsp"></jsp:include>
	<!-- <div style="max-width: 1200px; margin:200px auto;">

		<span
			style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">My
			Wallet</span>
	</div> -->
	<div class="wrapper">
	<div style="margin-top:25px;margin-bottom:20px;">
    <span
	style="border: 1 px green; background-color: white; font-weight: bold; color: green; font-size: 25px; font-weight: 500px;">My
	Cart</span>
	</div>

		<div class="view_main">
			<c:if test="${not empty message}">
				<div class="alert">
					<span class="closebtn">&times;</span> <strong></strong> ${message}.
				</div>
			</c:if>

			<div class="view_wrap list-view" style="display: block;">
				<div class="view_item">
					<div class="vi_left">
						<a
							href="${pageContext.request.contextPath }/wallet/chooseanamount">
							<spring:url value="/images" var="images" /> <img
							src="${images}/wallet1.png" alt="tomato" />
						</a>
						<!-- <img src="tomato.png" alt="tomato"> -->
					</div>
					<div class="vi_right">
						<p class="title" style="color: green;">Current Balance</p>
						<form modelAttribute="wallet">
							<p class="content">
								${repee_sign}<span style="font-size: 25px;"><fmt:formatNumber
										type="number" minFractionDigits="2" maxFractionDigits="2"
										value="${wallet.totalAmountBalance}" /></span>
							</p>
						</form>
						<!-- <div class="btn">Review</div> -->
					</div>
					<div class="btn"
						style="width: 180px; background: #4abd3e; padding: 8px 5px; border-radius: 3px; color: #fff; text-align: center; font-weight: 200; cursor: pointer; margin-left: 20px;"
						onclick="location.href='${pageContext.request.contextPath }/wallet/chooseanamount/${customerModel.customerid}'">Add
						Money</div>
				</div>

				<span style="margin-left: 8px; font-weight: bold;">WALLET
					ACTIVITY</span>
				
				<table style="margin-left: 8px; margin-top: 10px;border-spacing:6px 2px">
					<th><label for="dateofbirth">From</label></th>
					<th><input type="date" name="dateofbirth" id="dateofbirth" style="box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);border: 1px solid #c4c4c4;" class="">
					</th>
					<th><label for="dateofbirth">To</label></th>
					<th><input type="date" name="dateofbirth" id="dateofbirth" style="box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1);border: 1px solid #c4c4c4;">
					</th>
					<th><label for="dateofbirth"></label></th>
					<th>
					<th>
						<button
							style="border: 1px solid #c4c4c4; border-radius: 5px; background-color: #fff; padding: 5px 5px; box-shadow: inset 0 3px 6px rgba(0, 0, 0, 0.1); width: 70px;">Filter</button>
					</th>
				</table>
				
				<div class="view_item">
					<c:choose>
						<c:when test="${not empty listwallettransaction}">

							<table id="myTable">
								<tr class="header">
									<th style="width: %;text-align: center;">Transaction Id</th>
									<th style="width: %;text-align: center;">Date</th>
									<th style="width: %;text-align: center;">Money</th>
									<th style="width: %;text-align: center;">status</th>
								</tr>
								<c:forEach var="walletpaymnet" items="${listwallettransaction}">
									<tr>
										<td style="width: %;text-align: center;">${walletpaymnet.walletPaymentId}</td>
										<td style="width: %;text-align: center;"><fmt:formatDate value="${walletpaymnet.paymentDate}" pattern="${dateformatter}"/></td>
										<td style="width: %;text-align: center;">${repee_sign}<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${walletpaymnet.paymentAmount}"/></td>
										<td style="width: %;text-align: center;">${walletpaymnet.paymentStatus}</td>
									</tr>
								</c:forEach>
							</table>
						</c:when>
						<c:otherwise>
						No wallet activity available for the period!
						
						</c:otherwise>


					</c:choose>


				</div>



			</div>

		</div>

	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	
	<script>
		function myFunction() {
			var input, filter, table, tr, td, i, txtValue;
			input = document.getElementById("myInput");
			filter = input.value.toUpperCase();
			table = document.getElementById("myTable");
			tr = table.getElementsByTagName("tr");
			for (i = 0; i < tr.length; i++) {
				td = tr[i].getElementsByTagName("td")[0];
				if (td) {
					txtValue = td.textContent || td.innerText;
					if (txtValue.toUpperCase().indexOf(filter) > -1) {
						tr[i].style.display = "";
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		}
	</script>
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