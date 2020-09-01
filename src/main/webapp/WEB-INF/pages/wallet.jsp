

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
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

<div style="background-color:white;margin-left:15%;margin-right:15%;"><h2 style="color: green; text-align: center;style="background-color:white;"><a href="#" style="color:green;text-decoration: none;font-size:15px;float: left;" >Home</a>My Wallet</h2></div><br>
<table style="margin-left:13%;width:10%;cellspacing:2%; border-spacing:28px;">
       <th style="background-color:white;padding:15px 70px; width:5%;border-radius:8px;">     
<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

<a href="${pageContext.request.contextPath}/home/currentorder" style="display: inline-block;
        padding: 15px 25px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:orange;
        border-radius: 6px;
        outline: none;margin-top:6px"><span  class='fas fa-user-alt' style="font-size:40px;color:white"></span></a>
Membership Id:7
       </th>

<th style="background-color:white;padding:15px 70px; width:%;border-radius:8px;">     
<a href="${pageContext.request.contextPath}/home/currentorder" style="display: inline-block;
        padding: 15px 25px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:#00cccc;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class='fas fa-wallet'style="font-size:40px;"></span></a>
        Balance:2000.00


       </th>       
       <th style="background-color:white;padding:15px 70px; width:5%;border-radius:8px;">     
<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

<a href="${pageContext.request.contextPath}/home/currentorder" style="display: inline-block;
        padding: 15px 25px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:red;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class="fa fa-thumbs-up" style="font-size:35px;color:white"></span></a>
        Card:1001
       </th>
       
<th style="background-color:white;padding:15px 70px; width:5%;border-radius:8px;">     
<!-- <div style="background-color:white;margin-left:15%;padding:25px; width:13%;border-radius:8px;"> -->

<a href="${pageContext.request.contextPath}/home/currentorder" style="display: inline-block;
        padding: 15px 25px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px"><span class="fa fa-shopping-cart" style="font-size:35px;color:white"></span></a>
        Transaction:3
       </th>
       </table>
        
<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search for order.." title="Type in a name">

<table id="myTable">
    <tr class="header">
    <th style="width:%;color:white;">Transaction Id</th>
    <th style="width:%;color:white;">Date</th>
     <th style="width:%;color:white;">Status</th>
    <th style="width:%;color:white;">Amount</th>
    </tr>
  <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style="text-decoration:none;font-size:100%;color:black;">13788</a></td>
    <td>03-07-2020</td>
    <td><i class="" style="color:green"></i>Debit</td>
    <td>Rs 1000</td>
  </tr>
    <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style="text-decoration:none;font-size:100%;color:black;">13789</a></td>
    <td>03-07-2020</td>
      <td><i class="" style="color:green"></i>Debit</td>
    <td>Rs 1000</td>
     
  </tr>
    <tr>
    <td><a href="${pageContext.request.contextPath }/home/orderinfo" style="text-decoration:none;font-size:100%;color:black;">13790</a></td>
    <td>03-07-2020</td>
      <td><i  style="color:green"></i>Debit</td>
    <td>Rs 1000</td>
  </tr>
</table>
  <a href="${pageContext.request.contextPath}/home/chooseanamount" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:green;
        border-radius: 6px;
        outline: none;margin-top:6px;margin-left:15%;">Add Balance</a>

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
