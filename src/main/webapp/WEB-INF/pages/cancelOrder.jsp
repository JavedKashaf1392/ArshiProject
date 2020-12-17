<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders is Cancelled</title>
</head>
<body>
<h3>Your Orders is Cancelled</h3>
<p>Do You want to Refund money in Your wallet</p><%-- ${customerModel.customerid} --%>
<a href="${pageContext.request.contextPath }/order/addMoneyInWallet/${customerModel.customerid}"
							style="display: inline-block; padding: 8px 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;"
						>Yes</a>
				<a href="#"
							style="display: inline-block; padding: 8px 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;" d>NO</a>		
</body>
</html>