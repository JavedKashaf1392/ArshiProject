<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style>
body  {
  background-image: url("/WEB-INF/images/vg_image.png");
  
}

h3 {
color: green;
}

* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 80%;
  padding: 12px;
 
  border: 1px solid #008000;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  
  padding: 12px 115px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: center;
  margin-top: 10px;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 10px;
  border: 1px solid #008000;
  max-width: 400px;
  padding: 20px;
  background-color: #ffffff;
  align: center;
  padding:auto;
  margin:auto;
  text-align:center;
  margin-top:15%;
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

.button1 {background-color: #4CAF50;
          border-radius: 12px;}

.col-25 {
  float: left;
  width: 20%;
  margin-top: 6px;
}

.col-75 {
  
  width: 100%;
  margin-top: 6px;
}


/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>

<title>Insert title here</title>
</head>
<div class="container">

<img src="/WEB-INF/images/vfg_icon.png" width="30" height="30" />
 <h2 style = "color:green;"> 
            VeggieFridge 
        </h2> 
       
  <h3>Choose Your City</h3>
  
  <div class="row">
   
    <div class="col-75">
    
        <select id="city" name="city">
        <option value="none">Select City</option>
        <option value="pune">Pune</option>
        <option value="mumbai">Mumbai</option>
        </select>
    </div>
  </div>
  <div style="text-align:center;">

 <input type="submit" value="Continue"/>
   
</div>
<h5>Already have an account? Login</h5>
  </div>
  </form>
</div>


</body>
</html>