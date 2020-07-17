<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>   

 <html>
 <head>
 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <title>LOCATION DETAILS</title>
  <style>
   div {
  /* border: 1px solid #ffffff; */
  text-align: center;
  width: 50%;
  margin: 0 auto;
  margin-top:1px;
  padding: 10px;
 
}

h1 {
  text-align: center;
}

table, td, th {  
  border: 1px solid #008000;
  text-align: center;
  
}

table {
   margin-left:auto; 
   margin-right:auto;
  border-collapse: collapse;
  width: 70%; 

}

th {
 background-color: #4CAF50;
  color: white;
  
}

th, td,tr {
  padding: 15px;
}

.button {
  border-radius: 5px;
  background-color: #4CAF50; /* Add */
  border: none;
  color: white;
  padding: 12px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 5px 5px;
  margin-top: 30px;
  cursor: pointer;
  width: 100px;
}
/* .button1 {background-color: #4CAF50;
          border-radius: 12px;} /* Add */
.button2 {background-color: #4CAF50;
          border-radius: 12px;} /* Delete */ */         
     
   /*    ::-webkit-input-placeholder { /* Chrome/Opera/Safari */
  color: pink;
  hight:100;
  font-size: 14px;
  color: #d0cdfa;
  text-transform: uppercase;
  text-transform: uppercase;
  text-align: center;
  font-weight: bold;
}
::-moz-placeholder { /* Firefox 19+ */
  color: pink;
}
:-ms-input-placeholder { /* IE 10+ */
  color: pink;
}
:-moz-placeholder { /* Firefox 18- */
  color: pink;
}
           */
           
           ::-webkit-input-placeholder {
 font-size: 17px;
 color:/*  #d0cdfa */ green;
}
:-moz-placeholder { /* older Firefox*/
 font-size:17px;
 color: /* #d0cdfa */ green;
 
}
::-moz-placeholder { /* Firefox 19+ */ 
 font-size:17px;
 color:/*  #d0cdfa */ green; 

} 
:-ms-input-placeholder { 
 font-size:17px; 
 color:/*  #d0cdfa */ green;
}    
        </style>   
        </head>
        <body>
           
        <c:choose>
        <c:when test="${!empty listkiosk}">     
        <div><h2><p style="color:green;font-size:xx-large;">Kiosk Details</p></h2></div>
         
         <form method="get">
    
         <div style='float:right;'>
         <input type="text" name="searchText" value="${param.searchText}" placeholder="Search For Kiosk">
         <input type="submit" style="width:100px;cursor:pointer;margin: 5px 5px;font-size:16px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Search" formaction="${pageContext.request.contextPath}/searchKiosk">
        </div>   
        <table>
        <th></th>
		<th>KioskName</th>
		<th>Location</th>
	    <th>City</th>
		<th>State</th>
		<th>Country</th>
		
		<c:forEach var="kiosk" items="${listkiosk}">
				<tr>  
				<td><input type="checkbox" class="chkCheckBoxId" value="${kiosk.id}" name="id">
				    </td>
				    <td>${kiosk.kioskName}</td>
				    <td>${kiosk.location}</td>
					<td>${kiosk.cities}</td>
					<td>${kiosk.state}</td>
					<td>${kiosk.country}</td>
				    </tr>
		   </c:forEach>
		   </table><br>
		   </c:when>
    <c:otherwise>
    <h1 style="color:red;text-align:center">Records Not Found</h1>
    </c:otherwise>
    </c:choose>
		   <div style='float:center;'>
		   <input type="submit" style="width:100px;cursor:pointer;margin: 5px 5px;font-size:16px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Add" formaction="${pageContext.request.contextPath}/kiosk/newKiosk">
		   <input type="submit" style="width:100px;cursor:pointer;margin: 5px 5px;font-size:16px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Delete" formaction="${pageContext.request.contextPath}/kiosk/deleteKiosk" onclick="return confirm('Are you sure to delete?')">
		   <input type="submit" style="width:100px;cursor:pointer;margin: 5px 5px;font-size:16px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Edit" formaction="${pageContext.request.contextPath}/kiosk/editKiosk">
		   		   </div>
		   		   </form>		   
		  
           
</div>                    
</html>
   