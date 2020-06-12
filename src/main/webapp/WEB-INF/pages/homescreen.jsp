<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>



<!DOCTYPE HTML>

<html lang="en" dir="ltr">
    <head>
        <meta charset="utf-8">
        <title>Sidebar Dashboard Template</title>
        <link rel="stylesheet" href="style.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
    </head>
    <style>

    body{
   font-family: Arial;
    margin: 0;
    padding: 0;
    font-family: "Roboto", sans-serif;
    {
    box-sizing: border-box;
}
}

.header{
    position: fixed;
    background: #4CAF50;
    padding: 20px;
    padding: 20px;
    width: 100%;
    height: 65px;
}

.left_area h3{
    color: #fff;
    margin: 0;
    text-transform: uppercase;
    font-size: 22px;
    font-weight: 900;
}

.left_area span{
    color:#fff;
        font-size: 28px;
}
.right {
    padding: 5px;
    background: #4CAF50;
    text-decoration: none;
    float: right;
    margin-top: -30px;
    margin-right: 40px;
    border-radius: 2px;
    font-size: 15px;
    font-weight: 600;
    color: #fff;
    transition: 0.5s;
    transition-property: background;
}

.right a{
    text-decoration: none;
    color: #fff;
    transition: 0.5s;
    transition-property: background;
}

.right a:hover{
    background:  black;
}

.search {
    width: 80%;
    padding:1px;
    text-decoration: none;
    float:right;
    margin-top: 1px;
    margin-right: 60px;
    border-radius:2px;
    font-size: 15px;
    font-weight: 600;
    color: #fff;
    transition: 0.5s;
    transition-property: background;
}
.search i{
width: 15px;
height:6px;
}

.sidebar {
    background:none;
    margin-top: 8px;
    padding-top: 8px;
    position: fixed;
    left: 0;
    width: 250px;
    height: 100%;
    transition: 0.5s;
    transition-property: left;
}

.sidebar .profile_image{
    width: 1000px;
    height: 100px;
    border-radius: 50px;
    margin-bottom: 10px;
}

.sidebar h4{
    color: #4CAF50;
    margin-top: 0;
    margin-bottom: 20px;
}

.sidebar a{
    color: black;
    display: block;
    width: 100%;
    line-height: 60px;
    text-decoration: none;
    padding-left: 40px;
    box-sizing: border-box;
    transition: 0.5s;
    transition-property: background;
}

.sidebar a:hover{
    background: #4CAF50;
}

.sidebar i{
    padding-right: 10px;
}
label #sidebar_btn{
    z-index: 1;
    color: #fff;
    position: fixed;
    cursor: pointer;
    left: 170px;
    top: 60px;
    font-size: 20px;
    margin: 5px 0;
    transition: 0.5s;
    transition-property: color;
}

label #sidebar_btn:hover{
    color: black;
}

#check:checked ~ .sidebar{
    left: -190px;
}

#check:checked ~ .sidebar a span{
    display: none;
}

#check:checked ~ .sidebar a{
    font-size: 20px;
    margin-left: 170px;
    width: 80px;
}

.content{
    margin-left: 250px;
   // background: url(background.png) no-repeat;
    background-position: center;
    background-size: cover;
    height: 100vh;
    transition: 0.5s;
}

#check:checked ~ .content{
    margin-left: 60px;
}

#check{
    display: none;
}

 input[type=text] {
    padding: 8px;
    font-size: 17px;
    float:left;
    width: 50%;
}

.search button {
  float: left;
  width: 5%;
  padding: 9px;
  background: #2196F3;
  color: white;
  font-size: 17px;
  border: 1px solid grey;
  border-left: none; /* Prevent double borders */
  cursor: pointer;
}

form.example button:hover {
  background: #0b7dda;
}

/* Clear floats */
form.example::after {
  content: "";
  clear: both;
  display: table;
}
</style>

<body>

           <div class="header">

            <div class="search">
            <input type="text" placeholder="Search for vegetables fruits and more" name="search">
            <button type="submit"><i class="fa fa-search"></i></button>
            </div>

        <input type="checkbox" id="check">
        <!--header area start-->
            <label for="check">
            <i class="fas fa-bars" id="sidebar_btn"></i>
            </label>

                 <div class="left_area">
                  <h3>veggie<br><span>fridge</span></h3>
                 </div>

                <div class="right">
                <a href="#">Login as Guest|</a>
                <a href="${pageContext.request.contextPath}/login/loginView">Log in|</a>
                <a href="#">Sign Up|</a>
                <select id="city" name="city">
                <option value="Nagpur">Nagpur</option>
                <option value="mumbai">Mumbai</option>
                </select>
                </div>






   <!--header area end-->


        <div class="sidebar">

            <a href="#"><i class="fas fa-desktop"></i><span>Dashboard</span></a>
            <a href="#"><i class="fas fa-cogs"></i><span>Components</span></a>
            <a href="#"><i class="fas fa-table"></i><span>Tables</span></a>
            <a href="#"><i class="fas fa-th"></i><span>Forms</span></a>
            <a href="#"><i class="fas fa-info-circle"></i><span>About</span></a>
            <a href="#"><i class="fas fa-sliders-h"></i><span>Settings</span></a>
        </div>
        <!--sidebar end-->

        <div class="content"></div>

    </body>
</html>
