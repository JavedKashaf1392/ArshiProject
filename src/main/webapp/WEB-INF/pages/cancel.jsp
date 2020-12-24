<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>

<html>

<head>
<style type="text/css">

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 25%;
	height: 25%;
	margin-top: 7%;
}

/* The Close Button */
.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}
</style>


<title>Order Cancellation</title>

<!-- define styles  here just so that if any email client takes only body content. -->

<link href="${site-url}/css/main_stylesheet.css" rel="stylesheet" />

<style type="text/css">
body {
	background-color: #FFFFFF;
	color: #666666;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 11px;
	text-decoration: none;
}

.fontMedium {
	font-family: arial;
	font-size: 13px;
	text-decoration: none;
	line-height: 16px;
}

td {
	font-family: arial;
	font-size: 11px;
	text-decoration: none;
	line-height: 15px;
	color: #666666;
}

.header {
	font-family: arial;
	font-size: 20px;
}

.nowrap {
	white-space: nowrap;
}
</style>

</head>

<body>

	<!-- main table block -->

	<table border="0" style="border: 1px solid #EFEFEF;" cellspacing="5"
		cellpadding="0" width="730">
		<tr>
			<td>

				<table border="0" cellspacing="0" cellpadding="0" width="100%">

					<tr>

						<td>
							<div style="height: 8px;"></div>
						</td>

					</tr>

					<!-- Header message block -->

					<tr>

						<td>

							<table border="0">

								<tr>

									<td valign="top" align="left" width="99%">

										<div style="width: 4px;"></div> <%--  <img src="${site-url}/assets/images/text/english/logo.jpg" width="246" height="47" border="0" align="absmiddle"/> --%>

										<spring:url value="/images" var="images" /> <img
										src="${images}/logo.jpg" width="170" height="110"
										align="absmiddle" />


									</td>

									<td><div style="width: 10px;"></div></td>

									<td valign="top">

										<div class="nowrap">

											<div style="display: table-cell; vertical-align: top;">
												<b>Order #:&nbsp;</b>
											</div>

											<div style="display: table-cell; vertical-align: top;">${order.number}
												(Online) #if(${locate-order-number}) <br />${locate-order-number}
												(Locate) #end #if(${xstore-order-number}) <br />${xstore-order-number}
												(XStore) #end

											</div>

										</div>

										<div class="nowrap">

											<div style="display: table-cell; vertical-align: top;">

												<b>Order Date:&nbsp;</b>${order.order_date}

											</div>

										</div>

										<div class="nowrap">

											<div style="display: table-cell; vertical-align: top;">

												<b>Cancel Reason:&nbsp;</b>${order.cancel_reason}

											</div>

										</div>

									</td>

								</tr>

							</table>

						</td>

					</tr>

					<tr>

						<td>
							<div style="height: 8px;"></div>
						</td>

					</tr>

					<!-- Header starts -->

					<tr>

						<td bgcolor="#EFEFEF" height="48"><span class="header"
							style="padding-left: 5px;"><b>Your Order has been
									Cancelled </b></span></td>

					</tr>

					<tr>

						<td>
							<div style="height: 8px;"></div>
						</td>

					</tr>

					<!-- Header message block -->

					<tr>

						<td>

							<table border="0" width="100%">

								<tr>

									<td valign="top" align="left">

										<div class="fontMedium" style="padding: 15px 5px;">

											Dear ${order.billing_address.FIRST_NAME}
											${order.billing_address.LAST_NAME},
											${customerModel.firstName}<br />
											<br /> Your order has been canceled for the reasons indicated
											below. The items listed below were part of the canceled
											order.<br />
											<br /> <b>Cancelation Reason:</b> ${order.cancel_reason}<br />

										</div>

									</td>

								</tr>

							</table>

						</td>

					</tr>

					<!-- Purchasing Information -->

					<tr>

						<td>

							<table border="0" width="100%" cellpadding="5" cellspacing="0">

								<tr bgcolor="#EFEFEF">

									<td align="left" valign="top" width="400"><b>ITEM
											DESCRIPTION</b></td>

									<td align="left" valign="top" width="100"><b>ITEM
											PRICE</b></td>

									<td align="left" valign="top" width="100"><b>QTY</b></td>

									<td align="right" valign="top" width="100"><b>TOTAL</b></td>

								</tr>

								<!-- iterate order items -->

								#foreach ($item in ${order.items})

								<tr>

									<td align="left" valign="top" width="400"><b>${item.name}</b>

										#if (${item.gc_type} and ${item.gc_type} == "GC_TYPE_GC") <br />
									<span>${item.size_name}/${item.color_name}</span> <br />
									<span>Status: ${item.item_status}</span> <br />
									<span>Message: ${item.gc_message}</span> #else #if
										(${item.color_name} and ${item.color_name} != "") #if
										(${item.size_name} and ${item.size_name} != "") <br />
									<span>${item.color_name}/${item.size_name}</span> #else <br />
									<span>${item.color_name}</span> #end #else #if
										(${item.size_name} and ${item.size_name} != "") <br />
									<span>${item.size_name}</span> #else #end #end <br />
									<span>Status: ${item.item_status}</span> #if (${item.gift_wrap}
										== "true") <br />
									<span>Gift Wrap: Yes</span> #else <br />
									<span>Gift Wrap: No</span> #end #end</td>

									<td align="left" valign="top" width="100">#if
										(${item.item_discount_total} == "$0.00")

										${item.item_list_price} #else <strike>${item.item_list_price}</strike>

										#end

									</td>

									<td align="left" valign="top" width="100">${item.item_quantity_canceled}</td>

									<td align="right" valign="top" width="100">${item.item_canceled_total}</td>

								</tr>

								<tr>

									<td colspan="4" style="border-top: 1px solid #CCCCCC"><div
											style="width: 1px; height: 1px;"></div></td>

								</tr>

								#end

								<!-- iterate order items end -->

							</table>

						</td>

					</tr>

					<tr>

						<td>

							<table border="0" width="100%">

								<tr>

									<td valign="top">

										<div style="width: 550px;">

											If you have any questions about your order, please contact a
											<a href="${site-url}/custserv/custserv.jsp">${site-name}
												Customer Service Representative</a> or call us toll free at
											${site-toll-free-number}.For Refund Money <a href="#"
												style="display: inline-block; padding: 8px 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;"
												id="myBtn">Click Here</a>

										</div>

									</td>

								</tr>

							</table>

						</td>

					</tr>

					<tr>

						<td>
							<div style="height: 8px;"></div>
						</td>

					</tr>

				</table>

			</td>
		</tr>
	</table>

	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<span class="close">&times;</span>
			<h1
				style="color: #4CAF50; font-size: 200%; margin-top: 2%; text-align: center;">Do
				You Want to Refund Money</h1>
			<h2 style="color: #4CAF50; font-size: 200%; text-align: center;">
				<i class='fas fa-wallet' style="font-size: 50px; color: #4CAF50;"></i>
				In Your Wallet
			</h2>
			<div style="text-align: center;">
				<a href="${pageContext.request.contextPath}/addRefundMoneyInWallet/${customerModel.customerid}"
					style="display: inline-block; padding: 10px 30px; text-align: center; text-decoration: none; color: black; background-color: white; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid green;">Yes</a>
				<a href="#"
					style="display: inline-block; padding: 10px 30px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px; border: 1px solid green;">No</a>

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

	</div>


</body>

</html>