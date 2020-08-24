

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


<div style="background-color:white;padding:15px 70px; width:%;border-radius:8px;">     
<h5>Choose An Amount</h5>
<table>
<th>1000</th>
<th>2000</th>
<th>5000</th>
 <input type="text" id="fname" name="firstname" placeholder="Enter an Amount..">
</table>  
  <a href="${pageContext.request.contextPath}/home/c" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color:green;
        border-radius: 6px;
        outline: none;margin-top:6px;margin-left:15%;">Continue</a>
}
</script>

</body>
</html>
