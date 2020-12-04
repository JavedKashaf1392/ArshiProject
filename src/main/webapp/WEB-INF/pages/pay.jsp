
  <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
   pageEncoding="ISO-8859-1" isELIgnored="false"%>
   
<!DOCTYPE html>
<html>
<head>
   
</head>
<body>
<form method="post" action="/vf-online/pgRedirect">
    
                        <h3>Payment</h3>
                       
                                    <input id="ORDER_ID"
                                           name="ORDER_ID" placeholder="ORDER ID">
                              
                               
                                    <input type="text"  placeholder="Customer ID" value=""
                                           name="CUST_ID"/>
                               
                               
                                    <input type="text" placeholder="INDUSTRY_TYPE_ID" value=""
                                           name="INDUSTRY_TYPE_ID"/>
                               
                                    <input type="text" placeholder="Channel" value=""
                                           name="CHANNEL_ID"/>
                                
                               
                                    <input type="text" placeholder="Amount" value=""
                                           name="TXN_AMOUNT"/>
                               
                                <input type="submit" value="Pay with Paytm" />
                           
</form>
</body>
</html>