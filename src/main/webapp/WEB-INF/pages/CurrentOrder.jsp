
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body{
background-color:#f1f1f1;
}
* {
  box-sizing: border-box;
}

#myInput {
  background-image: url('/css/searchicon.png');
  background-position: 10px 10px;
  background-repeat: no-repeat;
  width: 70%;
  font-size: 16px;
  padding: 12px 20px 12px 40px;
  border: 1px solid #ddd;
  margin-bottom: 12px;
  margin-left:15%; 
  margin-right:auto;
}

#myTable {
   margin-left:auto; 
   margin-right:auto;
  text-align: center;
  border-collapse: collapse;
  width: 70%;
  border: 1px solid #ddd;
  font-size: 18px;
  align-content: center;
  background-color:white;
}

#myTable th, #myTable td {
  text-align: center;
  padding: 12px;
  
}

#myTable tr {
  border-bottom: 1px solid #ddd;
  text-align: center;
}

#myTable tr.header, #myTable tr:hover {
  background-color: forestgreen;
  
}
</style>
</head>
<body>

<div style="background-color:white;margin-left:15%;margin-right:15%;"><h2 style="color: green; text-align: center;style="background-color:white;">My Orders</h2></div><br>

<table style="margin-left:13%;width:5%;cellspacing:2%; border-spacing:28px;">
<th style="background-color:white;padding:10px 40px; width:5%;border-radius:8px;">     
<a href="${pageContext.request.contextPath}/home/currentorder" style="display: inline-block;
        padding: 10px 30px;
        text-align:center;
        text-decoration: none;
        color: #ffffff;
        background-color:#4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Pendings</a>
       </th>

<th style="background-color:white;padding:10px 40px; width:%;border-radius:8px;">     
<a href="${pageContext.request.contextPath}/home/myorder" style="display: inline-block;
        padding: 10px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Delivered</a>
      
       </th> 
       </table>
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for order.." title="Type in a name">


    <table id="myTable">
    <tr class="header">
    <th style="width:%;color:white;">Order Id</th>
    <th style="width:%;color:white;">Order Date</th>
    <th style="width:%;color:white;">Order Status</th>
    <th style="width:%;color:white;">Total Amount </th>
    <th style="width:%;color:white;">Pickup Location</th>
 
  </tr>
    
    <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style=";font-size:100%;color:dodgerblue;">13788</a></td>
    <td>03-07-2020</td>
    <td><i class="fa fa-circle" style="color:orange"></i>Pending</td>
    <td>Rs 12000</td>
   <td><i class="fa fa-gift" style="color:green;"></i>${customer.location},${customer.cities}</td>
    </tr>
    
    <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style=";font-size:100%;color:dodgerblue;">13789</a></td>
    <td>03-07-2020</td>
    <td><i class="fa fa-circle" style="color:orange"></i>Pending</td>
    <td>Rs 12000</td>
    <td><i class="fa fa-gift" style="color:green;"></i>${customer.location},${customer.cities}</td>
    </tr>
    
    <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style=";font-size:100%;color:dodgerblue;">13780</a></td>
    <td>03-07-2020</td>
    <td><i class="fa fa-circle" style="color:orange"></i>Pending</td>
    <td>Rs 12000</td>
    <td><i class="fa fa-gift" style="color:green;"></i>${customer.location},${customer.cities}</td>
    </tr>
    </table>

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
