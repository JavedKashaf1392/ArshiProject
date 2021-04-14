<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
  <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>   
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
  
   
     <html>
     <head>
     <link rel="icon" type="image/jpg" href="images/logo.jpg">s
     </head>
     <style>
     
     .center {
  margin: 0;
  position: absolute;
  top: 50%;
  left: 50%;
  -ms-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}
    
     h3 {
  color: green;
}
     
     td {
  font-size:large;
  padding: 12px 12px 12px 0;
  }
  
  option[type=text], select, textarea {
  width: 130%;
  padding: 12px;
  margin-left:15px;
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
} 

input[type=text],select, textarea {
  width: 130%;
  padding: 12px;
  margin-left:15px;
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
} 


  {
  box-sizing: border-box;
}
   </style>
   <div align="center">
   <div><h2><p style="color:green;">Edit Kiosk</p></h2></div>
   <body>
   <form method="post" action="${pageContext.request.contextPath}/kiosk/updateKiosk" modelAttribute="kiosk"> 
      
      <script>
     function GetSelectedText(){
     var e=document.getElementById("id");
     var kiosk=e.options[e.selectedIndex].text;
     document.getElementById("kiosk").innerHTML=kiosk;
         } 
     </script>
     
     <table>      
        
        <tr>
        <td>KioskName</td>
        <td>
       <spring:bind path="kiosk.kioskName">
       <input type="text" name="${status.expression}" value="${status.value}"><br>
        </spring:bind>
        </td>
        </tr>
         
            <tr>
                <td>Location</td>
                <td>
                    <select id="locationid" name="location">
                        <option value="">Select location</option> 
                        <c:forEach items="${listkiosklocation}" var="kiosklocation">
                            <option <c:if test="${kiosklocation.location eq kiosk.location}">selected="selected"</c:if> value="${kiosklocation.location}">${kiosklocation.location}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <tr>
                <td>City</td>
                <td>
                    <select id="locationid" name="cities">
                        <option value="">Select City</option> 
                        <c:forEach items="${listkiosklocation}" var="kiosklocation">
                            <option <c:if test="${kiosklocation.cities eq kiosk.cities}">selected="selected"</c:if> value="${kiosklocation.cities}">${kiosklocation.cities}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
            
            <tr>
                <td>State</td>
                <td>
                    <select id="locationid" name="state">
                        <option value="">Select State</option> 
                        <c:forEach items="${listkiosklocation}" var="kiosklocation">
                            <option <c:if test="${kiosklocation.state eq kiosk.state}">selected="selected"</c:if>  value="${kiosklocation.state}">${kiosklocation.state}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>  
            
            <tr>
                <td>Country</td>
                <td>
                    <select id="locationid" name="country">
                        <option value="">Select Country</option> 
                        <c:forEach items="${listkiosklocation}" var="kiosklocation">
                            <option <c:if test="${kiosklocation.country eq kiosk.country}">selected="selected"</c:if> value="${kiosklocation.country}">${kiosklocation.country}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>
           </table><br>
           
           <div style = "position:absolute;left:730px;">
           <input type="submit" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;"value="Save" onclick="GetSelectedText()">
           <input type="reset" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Reset">
           <input type="button" style="width:60px;cursor:pointer;margin: 5px 5px;font-size:14px;text-decoration:none;border-radius:12px;text-align: center;color:white;background-color:#4CAF50;padding:12px;border:none;" value="Back" onclick="history.back()">
           </div>
           </form>
           </body>
           </div>
           </html>









    