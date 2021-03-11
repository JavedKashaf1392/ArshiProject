<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->


</head>

<style>

.menu-area{background: #d61a5e}
.dropdown-menu{padding:0;margin:0;border:0 solid transition!important;border:0 solid rgba(0,0,0,.15);border-radius:0;-webkit-box-shadow:none!important;box-shadow:none!important}
.mainmenu a, .navbar-default .navbar-nav > li > a, .mainmenu ul li a , .navbar-expand-lg .navbar-nav .nav-link{color:#fff;font-size:16px;text-transform:capitalize;padding:16px 15px;font-family:'Roboto',sans-serif;display: block !important;}
.mainmenu .active a,.mainmenu .active a:focus,.mainmenu .active a:hover,.mainmenu li a:hover,.mainmenu li a:focus ,.navbar-default .navbar-nav>.show>a, .navbar-default .navbar-nav>.show>a:focus, .navbar-default .navbar-nav>.show>a:hover{color: #fff;background: #4CAF50;outline: 0;}
/==========Sub Menu=v==========/
.mainmenu .collapse ul > li:hover > a{background: #4CAF50;}
.mainmenu .collapse ul ul > li:hover > a, .navbar-default .navbar-nav .show .dropdown-menu > li > a:focus, .navbar-default .navbar-nav .show .dropdown-menu > li > a:hover{background: #4CAF50;}
.mainmenu .collapse ul ul ul > li:hover > a{background: #4CAF50;}

.mainmenu .collapse ul ul, .mainmenu .collapse ul ul.dropdown-menu{background:#1565C0;}
.mainmenu .collapse ul ul ul, .mainmenu .collapse ul ul ul.dropdown-menu{background:#1E88E5}
.mainmenu .collapse ul ul ul ul, .mainmenu .collapse ul ul ul ul.dropdown-menu{background:#64B5F6}

/***********Drop-down menu work on hover***********/
.mainmenu{background: none;border: 0 solid;margin: 0;padding: 0;min-height:20px;width: 100%;}
@media only screen and (min-width: 767px) {
.mainmenu .collapse ul li:hover> ul{display:block}
.mainmenu .collapse ul ul{position:absolute;top:100%;left:0;min-width:250px;display:none}
/***/
.mainmenu .collapse ul ul li{position:relative}
.mainmenu .collapse ul ul li:hover> ul{display:block}
.mainmenu .collapse ul ul ul{position:absolute;top:0;left:100%;min-width:250px;display:none}
/***/
.mainmenu .collapse ul ul ul li{position:relative}
.mainmenu .collapse ul ul ul li:hover ul{display:block}
.mainmenu .collapse ul ul ul ul{position:absolute;top:0;left:-100%;min-width:250px;display:none;z-index:1}

}
@media only screen and (max-width: 767px) {
.navbar-nav .show .dropdown-menu .dropdown-menu > li > a{padding:16px 15px 16px 35px}
.navbar-nav .show .dropdown-menu .dropdown-menu .dropdown-menu > li > a{padding:16px 15px 16px 45px}
}
</style>


<body>















</head>


<body>






<div class="text-center"><h2>Bootstrap 4 Multilevel Dropdown Menu</h2></div>

<div id="menu_area" class="menu-area">
    <div class="container">
        <div class="row">
            <nav class="navbar navbar-light navbar-expand-lg mainmenu">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="active"><a href="#">Home <span class="sr-only">(current)</span></a></li>
                        <li><a href="#">Link</a></li>
                        <li class="dropdown">
                            <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                           <!--  <li><a href="#">Action</a></li>
                            <li><a href="#">Another action</a></li>
                            <li><a href="#">Something else here</a></li> -->
                           
                          
                          
    
 <c:forEach var="menu" items="${menuLevel1}">
  
 <c:if test="${empty menu.parentMenu}">
    <li>${menu.menues}
</c:if>

<c:if test="${menu.childMenu.size() > 0}">

<ul>
<c:forEach var="menu1" items="${menu.childMenu}">

<li>${menu1.menues}</li>
</c:forEach>
</ul>

</c:if>

</c:forEach>






                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                          
                           
                           
                           
                            <li class="dropdown">
                                <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown2</a>
                                <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                             <!--    <li><a href="#">Action</a></li>
                                <li><a href="#">Another action</a></li>
                                <li><a href="#">Something else here</a></li> -->
                                
                           <th:block th:each="menu : ${allChildMenus}">
                           <li><a href="#">[[${menu.menus}]]</a>
                           </th:block>
                                
                                
                                
                                <li class="dropdown">
                                    <a class="dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown3</a>
                                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <li><a href="#">Action</a></li>
                                        <li><a href="#">Another action</a></li>
                                        <li><a href="#">Something else here</a></li>
                                    </ul>
                                </li>
                                </ul>
                            </li>
                            </ul>
                        </li>
                        <li><a href="#">Service</a></li>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>


<br>
   <div class="text-center"><span><a href="https://bootsnipp.com/snippets/m1d5N">Bootstrap 3 Multilevel Dropdown Menu >></a></span></div>