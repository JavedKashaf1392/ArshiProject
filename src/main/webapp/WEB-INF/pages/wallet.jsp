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
	margin: 0px auto;
	margin-bottom:40px;
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
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 50%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
  margin-left:15px;
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
</style>

</head>
<body>

	<jsp:include page="mainheader.jsp"></jsp:include>
	
	   <div
		style="border: 1 px green; background-color: white;font-weight: bold; color: green; font-size: 25px; width: 1200px; margin: 0 auto; font-weight: 500px;">My
		Wallet</div>
		
	<div class="wrapper">

		<div class="view_main">
			
			<div class="view_wrap list-view" style="display: block;">
				<div class="view_item">
					<div class="vi_left">
					   <a href="${pageContext.request.contextPath }/wallet/chooseanamount">
						<spring:url value="/images" var="images" />
						<img src="${images}/wallet1.png" alt="tomato" /> 
						</a>
						<!-- <img src="tomato.png" alt="tomato"> -->
					</div>
					<div class="vi_right">
						<p class="title" style="color:green;">Current Balance</p>
						<p class="content">RS:<span style="font-size:25px;">${customerModel.wallet.totalAmountBalance}</span></p>
						<!-- <div class="btn">Review</div> -->
					</div>
					<div class="btn"
					style="width: 180px; background: #4abd3e; padding: 8px 5px; border-radius: 3px; color: #fff; text-align: center; font-weight: 200; cursor: pointer; margin-left: 20px;" onclick="location.href='${pageContext.request.contextPath }/wallet/chooseanamount'">Add Money</div>
			        </div>
			        
			        <input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for Transaction.." title="Type in a name">
			        <div class="view_item">
					

   <table id="myTable">
  <tr class="header">
    <th style="width:25%;">Transaction Id</th>
    <th style="width:25%;">Date</th>
     <th style="width:25%;">Money</th>
    <th style="width:25%;">status</th>
  </tr>
  <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: green;">Debit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color:red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color:red;">Credit</td>
  </tr>
  
  <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
  
  <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
   <tr>
    <td>10001</td>
    <td>December 25, 2020</td>
     <td>Rs50.00</td>
    <td style="color: red;">Credit</td>
  </tr>
  
 
</table>
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


</body>
</html>