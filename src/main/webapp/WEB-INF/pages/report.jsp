<!DOCTYPE html>
<html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<head>
<link rel="icon" type="image/jpg" href="images/logo.jpg"> 
    <meta charset="UTF-8"/>
    <title>Payment Report</title>
    <link href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>

<body>
<form>
<div class="container">
    <div class="row">
        <div class="well col-xs-10 col-sm-10 col-md-6 col-xs-offset-1 col-sm-offset-1 col-md-offset-3">
            <div class="row">
                <div class="col-xs-6 col-sm-6 col-md-6">
                    <strong "${result}"></strong>
                    <br>
                </div>
                <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                    <p>
                        <em>Receipt #: 34522677W</em>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="text-center">
                    <h1>Receipt</h1>
                </div>
               
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>Components</th>
                    </tr>
                    </thead>
                    <tbody>

                    <%-- <tr 
                    c.foreach="entry : ${parameters}">

                        <td "${entry.key} + '  : -  ' + ${entry.value}"></td>
                      
                    </tr> --%>
                    <tr>
     <c:forEach items="${parameters}" var="entry">
       ${entry.key} = ${entry.value}<br>
     </c:forEach> 


                    
                    
                    </tr>
                    </tbody>
                </table>
                <input type = "button" value = "Print" onclick = "window.print()" />
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>