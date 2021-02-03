<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>

<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<title>VeggieFridge</title> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
 <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" /> 
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/fontawesome/4.7.0/css/font-awesome.min.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="main.css">
        <!-- font awesome -->
        <script src="https://kit.fontawesome.com/dbed6b6114.js" crossorigin="anonymous"></script>

<style>
        /* fonts  */
@font-face {
    font-family:"Raleway-regular";
    src:url(../fonts/Raleway-Regular.ttf)
}
@font-face {
    font-family:"Raleway-medium";
    src:url(../fonts/Raleway-Medium.ttf)
}
@font-face {
    font-family:"Raleway-bold";
    src:url(../fonts/Raleway-Bold.ttf)
}
@font-face {
    font-family:"Raleway-extrabold";
    src:url(../fonts/Raleway-ExtraBold.ttf)
}
@font-face {
    font-family:"Raleway-semibold";
    src:url(../fonts/Raleway-SemiBold.ttf)
}
@font-face {
    font-family:"Raleway-black";
    src:url(../fonts/Raleway-Black.ttf)
}

/* colors  */

:root {
    --primary:#4CAF50;
    /* --primary:#EEBF00; */
    --secondary:#232B38;
    --ternary:#6C6C6C;
    --danger:#FE4545;
    --pure:#FEFEFE;
    --light:#F0F0F0;
    --heaven:#FFFFFF;
    --footer:#2D333F;
}

:root{  
    --white-light: rgba(255, 255, 255, 0.5);
    --alice-blue: #f8f9fa;
  /*   --carribean-green: #40c9a2; */
    --carribean-green:green;
    --gray: #ededed;
}

/* Reset  */
*{
    padding:0;
    margin:0;
    box-sizing: border-box;
}


body{
    -webkit-font-smoothing:antialiased;
  /*   font-family: "Raleway-regular"; */
     font-family: 'Quicksand', sans-serif;
}
.container {
    width:100%;
    padding:o 15px;
    margin:0 auto;
}

@media (min-width:576px){
    .container{
        max-width:540px;
    }
}
@media (min-width: 768px) {
    .container {
      max-width: 720px;
    }
  }
  
  @media (min-width: 992px) {
    .container {
      max-width: 960px;
    }
  }
  
  @media (min-width: 1200px) {
    .container {
      max-width: 1152px;
    }
  }

  .main-wrapper{
      position:relative;
      width:100%;
      height:100vh;
      overflow:hidden;
  }

  .nav-background{
      width:100%;
      height:100%;
      background:var(--light);
      position: absolute;
      top:0;
      left:0;
      padding:0;
      z-index:1;
  }

  .nav-trigger{
      position: absolute;
      top:0;
      left:0;
      z-index:1;
      padding:15px;
      display:none;
  }

  .nav-trigger svg{
      transform:rotate(90deg) scaleX(-1);
      -webkit-transform:rotate(90deg) scaleX(-1);
      -moz-transform:rotate(90deg) scaleX(-1);
      -ms-transform:rotate(90deg) scaleX(-1);
      -o-transform:rotate(90deg) scaleX(-1);
      width:40px;
      height:40px;
}
.site-content-wrapper{
    width:100%;
    height:100%;
    position:absolute;
    background:var(--heaven);
    z-index:2;
    transition:all .3s ease;
    -webkit-transition:all .3s ease;
    -moz-transition:all .3s ease;
    -ms-transition:all .3s ease;
    -o-transition:all .3s ease;
}

.site-content-wrapper.scaled{
    transform:scale(0.9) translateX(90%);
    -webkit-transform:scale(0.9) translateX(90%);
    -moz-transform:scale(0.9) translateX(90%);
    -ms-transform:scale(0.9) translateX(90%);
    -o-transform:scale(0.9) translateX(90%);
    border-radius:3px;
    -webkit-border-radius:3px;
    -moz-border-radius:3px;
    -ms-border-radius:3px;
    -o-border-radius:3px;
    box-shadow:0 3px 10px 0 var(--secondary);
}

.site-content{
    width:100%;
    height:100%;
    overflow-x:auto;
}
  header.topbar{
     width: 100%;
        position: fixed;   
      background:#4CAF50;
     /*  background:var(--secondary); */
      color:var(--pure);
      font-family:"Raleway-semibold";
      padding:0.75rem 0;
      top: 0; 
  }
  header.topbar .auth > div a{
      color:var(--pure);
      text-decoration: none;
  }
  header.topbar .icons a{
    margin-right:0.6rem;
  }
  header.topbar .auth .divider{
      padding:0 1rem;
  }
  header.topbar .auth > div img{
      margin-right:0.35rem;
  }
  .flex{
    display:flex;
  }
  .justify-between{
    justify-content: space-between;
  }
  .items-center{
      align-items: center;
  }
  nav .top{
      padding:1.5rem 0;
     /*  margin-top:45px; */
  }
  nav .top .contact h5,  nav .top .time h5{
      font-family:"Raleway-black";
      margin-bottom:0.25rem;
  }
  nav .top .contact h6, nav .top .time h6{
    font-family:"Raleway-medium";
    letter-spacing: 0.055rem;
    font-size:0.75rem;
    color:var(--ternary);
}
nav .top .contact img, nav .top .time img{
    margin-right:1rem;
}

.justify-center{
    justify-content:center;
}
nav .navbar a{
    text-decoration:none;
    color:var(--secondary);
    font-family:"Raleway-semibold";
    font-size:1rem;
    padding:1rem 1.5rem;
    transition:all .3s ease;
    -webkit-transition:all .3s ease;
    -moz-transition:all .3s ease;
    -ms-transition:all .3s ease;
    -o-transition:all .3s ease;
}
nav .navbar a.active{
    background:var(--primary);
    color:var(--pure);
}
nav .navbar a:hover{
    background:var(--primary);
    color:var(--pure); 
}
.magic-shadow{
    position: relative;
    background:var(--heaven);
}
.magic-shadow:after{
    content:'';
    display:block;
    width:100%;
    height:69px;
    /* background-image:url(../images/shadow.svg); */
   background-image:url("images/shadow.svg");
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    bottom:-22px;
    z-index:-1;
   /*  box-shadow: 0px 0px 8px 1px #00000078; */
    
}
.magic-shadow-sm{
    position: relative;
    background:var(--heaven);
}
.magic-shadow-sm:after{
    content:'';
    display:block;
    width:100%;
    height:69px;
    background-image:url("/images/shadow-sm.svg");
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    bottom:-20px;
    left:50%;
    transform:translateX(-50%);
    z-index:-1;
    -webkit-transform:translateX(-50%);
    -moz-transform:translateX(-50%);
    -ms-transform:translateX(-50%);
    -o-transform:translateX(-50%);
   /*  box-shadow: 0px 0px 8px 1px #00000078; */
}
header.hero{
    height:600px;
    background-image:url("/images/Blur.png");
   /*  background-image:url("/images/hero.png"); */
    background-position: 0% 0%;
    background-repeat: no-repeat;
    overflow:hidden;
}
header.hero .container{
    position: relative;
    
}
header.hero .welcome{
    margin-bottom:0.25rem;
}
header.hero .welcome span{
    font-family:"Raleway-bold";
    color:var(--secondary);
    margin-right:0.75rem;

}
header.hero h1{
    font-family:"Raleway-extrabold";
    color:var(--secondary);
    font-size: 2.5rem;
    margin-bottom:0.75rem;
}
header.hero h1 span{
    color:var(--primary);
}
header.hero p{
    font-family: "Raleway-medium";
    width:50%;
    line-height:1.5;
    margin-bottom:1rem;
}
.btn{
    padding:0.75rem 0.75rem;
    border-radius:4px;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    -ms-border-radius:4px;
    -o-border-radius:4px;
    line-height:0.8;
    font-size:1.2rem;
    cursor: pointer;
    transition: all 0.3s ease;
    -webkit-transition: all 0.3s ease;
    -moz-transition: all 0.3s ease;
    -ms-transition: all 0.3s ease;
    -o-transition: all 0.3s ease;
    border:1px solid transparent;
}

.btn-primary {
    background:var(--primary);
    color:var(--heaven);
}
.btn-primary:hover{
    background:var(--heaven);
    color:var(--primary); 
    border:1px solid var(--primary);
}
.btn-secondary{
    background:var(--secondary);
    color:var(--heaven); 
}
.btn-secondary:hover{
    background:var(--heaven);
    color:var(--secondary); 
    border:1px solid var(--secondary);
}

header.hero button:first-child{
    margin-right:0.50rem;
}

header.hero .hero-image{
    position:absolute;
    top:-40px;
    right:40px;
}

section{
    padding:4rem 0;
}
section.top-products{
    background:var(--light);
}

.section-heading{
    font-family:"Raleway-bold";
    text-align:center;
    Position:relative;
    margin-bottom:6rem;
}
.section-heading:after{
    content:'';
    display:block;
    width: 100%;
    height:30px;
    background-image:url(../icons/hr.svg);
    background-repeat: no-repeat;
    background-position: center;
    position:absolute;
    bottom:-40px;
}
section.top-products .food-slider .food-card{
    background:var(--heaven);
    padding:1.5rem 0;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}
section.top-products .food-slider .food-card .product-image img{
    width:80%;
    height:200px;
    object-fit:contain;
    padding-bottom:1rem;
}
hr{
    border:1px solid var(--light);
    opacity: 0.8;
    margin:1rem 0;
}
section.top-products .food-slider .food-card h2{
    font-family:"Raleway-bold";
    font-size:1.3rem;
    margin-bottom:0.25rem;
}
.text-center{
    text-align: center;
}
section.top-products .food-slider .food-card .stars{
    margin-bottom:0.5rem;
}
section.top-products .food-slider .food-card .stars img{
    margin-right:0.25rem;
}
section.top-products .food-slider .food-card .price{
    font-family:"Raleway-medium";
    color:var(--danger);
    margin-bottom: 1rem;
}
section.top-products .food-slider .food-card button{
    font-family:"Raleway-medium";
    color:var(--secondary);
    background:var(--heaven);
    border:2px solid var(--primary);
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
    display:flex;
    align-items: center;
    width:50%;
    font-size:1rem;
    cursor: pointer;
    transition:all .3s ease;
    -webkit-transition:all .3s ease;
    -moz-transition:all .3s ease;
    -ms-transition:all .3s ease;
    -o-transition:all .3s ease;
}
section.top-products .food-slider .food-card button:hover{
    background:var(--primary);
    color:var(--heaven);
}
.food-slider .food-card button img{
    background:var(--primary);
    padding:0.50rem;
    height:32px;
    margin-right:1.2rem;
}

.slick-slide{
    margin:0 27px;
}
.slick-list{
    margin:0 -27px;
}
.top-products .slider-btn{
    width: 30px;
    height:30px;
    border: none;
    background:var(--primary);
    border-radius:4px;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    -ms-border-radius:4px;
    -o-border-radius:4px;
    cursor:pointer;
    outline:none;
}

.prev-btn{
    position:absolute;
    top:46%;
    left:-3rem;
    z-index: 1;
}
.next-btn{
    position:absolute;
    top:46%;
    right:-3rem;
    z-index: 1;
}
.top-products .slider{
    position: relative;
}
.top-products .btn-wrapper{
    margin-top:2rem;
}
.slick-track{
    padding:1rem 0;
}
section.about-meal img{
    width:85%;
}
.flex-1{
    flex:1;
}
section.about-meal h2{
    font-family: "Raleway-bold";
    font-size:1.4rem;
    color:var(--secondary);
    margin-bottom:2rem;
    line-height:1.3;
}
section.about-meal p{
    line-height: 1.7;
    margin-bottom:4rem;
}

section.our-services{
    background:var(--light);
    position:relative;
    z-index:0;
}
section.our-services .card-wrapper{
    margin-right:-2rem;
    margin-top:8rem;
}
section.our-services .service-card{
    background:var(--heaven);
    text-align: center;
    padding:2rem;
    padding-top:4rem;
    margin-right:2rem;
    position: relative;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}
section.our-services .service-card .icon{
    position: absolute;
    top:-45px;
    left:50%;
    transform:translateX(-50%);
    -webkit-transform:translateX(-50%);
    -moz-transform:translateX(-50%);
    -ms-transform:translateX(-50%);
    -o-transform:translateX(-50%);
} 
section.our-services .service-card h2{
    font-family: "Raleway-bold";
    font-size: 1.3rem;
    margin-bottom:1rem;
}
section.our-services .service-card p{
    line-height: 1.6;
    margin-bottom:1rem;
}
.text-primary{
    color:var(--primary);
}

section.big-deal {
    background: linear-gradient(
        rgba(35,43,56,0.9),
        rgba(35,43,56,0.9)
    ), url(../images/food-table.jpg);
    background-size: cover;
    background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
}
section.big-deal .timer{
    display:flex;
    align-items: center;
    justify-content: center;
    margin-right:-2rem;
    margin-bottom:2rem;
}
section.big-deal .timer div{
    margin-right:2rem;
    background: var(--primary);
    width:150px;
    height:150px;
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
    display:flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}
section.big-deal .timer div span:first-child{
    font-family: "Raleway-semibold";
    font-size:2.5rem;
    color:var(--heaven);
    margin-bottom:0.05rem;
}
section.big-deal .timer div span:last-child{
    font-family: "Raleway-medium";
    color:var(--heaven);
}
.text-pure{
    color:var(--pure);
}

section.latest-news{
    background:var(--light);
    position:relative;
    z-index:0;
}
section.latest-news .article-wrapper{
    display:flex;
    margin-right:-2rem;

}
.latest-news .article-wrapper .card {
    margin-right:2rem;
    background:var(--heaven);
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
}
.latest-news .article-wrapper .card img{
    width:100%;
}
.latest-news .article-wrapper .card .card-content{
    padding:2rem;
}
.latest-news .article-wrapper .card .card-content .post-meta{
    margin-bottom: 1rem;
}
.latest-news .article-wrapper .card .card-content .post-meta .comment-count{
    margin-left:1rem;
}
.latest-news .article-wrapper .card .card-content h2{
    font-family: "Raleway-bold";
    font-size: 1.3rem;
    margin-bottom:1rem;
}
.latest-news .article-wrapper .card .card-content p{
    line-height: 1.6;
}
.latest-news .btn-wrapper{
    margin-top:2rem;
}
section.subscribe{
    background:var(--primary);
}
section.subscribe .container > div:first-child img{
    width:90%;
}
section.subscribe .container div:first-child{
    flex:1;
}
section.subscribe .container div:last-child{
    flex:1;
}

section.subscribe h1{
    font-family:"Raleway-bold";
    font-size: 1.5rem;
    margin-bottom:1.5rem;
}
section.subscribe p{
    font-family:"Raleway-medium"; 
    font-size: 1rem;
    margin-bottom:1.5rem;
    line-height: 1.5;
}
section.subscribe .input-wrap{
    background:var(--heaven);
    display:flex;
    padding:0.3rem;
    border-radius:4px;
    -webkit-border-radius:4px;
    -moz-border-radius:4px;
    -ms-border-radius:4px;
    -o-border-radius:4px;
}
section.subscribe .input-wrap input{
    width:100%;
    border:none;
    padding: 0 1rem;
    font-size:1rem;
}
section.subscribe .input-wrap input:focus{
    outline:none;
}
section.subscribe .input-wrap button{
    padding:0.8rem 2rem;
    border:none;
    background:var(--primary);
    color:var(--pure);
    border-radius: 4px;
    -webkit-border-radius: 4px;
    -moz-border-radius: 4px;
    -ms-border-radius: 4px;
    -o-border-radius: 4px;
    font-size:1rem;
    cursor:pointer;
    transition: all .3s ease;
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -ms-transition: all .3s ease;
    -o-transition: all .3s ease;
    outline:none;
}
section.subscribe .input-wrap button:hover{
    background:var(--secondary);
}
section.contact-us{
    padding-top:0;
    padding-bottom: 0;
}
section.contact-us .contact-info-wrapper {
    padding:4rem 0;
    flex:1;
}
section.contact-us .map{
    flex:1;
    filter:grayscale(100%);
    -webkit-filter:grayscale(100%);
}
section.contact-us .contact-info{
    display:flex;
    justify-content: center;
}
section.contact-us .contact-info > div > div {
    display:flex;
    align-items:center;
    margin-bottom:2rem;
}
section.contact-us .contact-info > div > div img{
    margin-right: 1rem;
}
section.contact-us .contact-info > div > div > div{
    display:flex;
    flex-direction: column;
}
section.contact-us .contact-info > div > div > div span:first-child{
    font-family: "Raleway-bold";
    margin-bottom:0.25rem;
}
footer{
    background:var(--footer);
    padding:4rem 0;
}
footer .container{
    display:flex;
    color:var(--pure);
}

footer .box{
    flex:1;
    margin-right:2rem;
    text-align:center;
}

footer .instagram-api img{
    width:100%;
    height:100%;
    object-fit: cover;
}
footer .instagram-api .post-wrap{
    display:flex;
    flex-wrap:wrap;
    justify-content:space-between;
}
footer .instagram-api .post-wrap > div{
    width: calc(1/3*100% - (1 - 1/3)*10px);
    margin-bottom:10px;
}
footer .box ul{
    list-style-type: none;
}
footer .box ul li a{
    color:var(--pure);
    text-decoration: none;
    transition: all .3s ease;
    -webkit-transition: all .3s ease;
    -moz-transition: all .3s ease;
    -ms-transition: all .3s ease;
    -o-transition: all .3s ease;
}
footer .box ul li a:hover{
    color:var(--primary);
}
footer .box h3{
    border-bottom:1px solid var(--primary);
    padding-bottom:1rem;
    margin-bottom:1rem;
}

footer .box p{
    line-height: 1.6;
    margin-bottom:1rem;
}
footer .box ul li{
    margin-bottom:1rem;
}
footer .box:nth-child(3) > div {
    display:flex;
    justify-content: center;
}
footer .box:nth-child(3){
    text-align: left;
}
footer .box:nth-child(3) h3{
    text-align: center;
}
footer .box:nth-child(3) > div img{
    margin-right:1rem;
}
footer .box:nth-child(3) ul li{
    margin-bottom:1.5rem;
}

footer.copyright{
    padding:1rem 0;
    background: var(--secondary);
    color:var(--pure);
    text-align: center;
    font-size: 0.75rem;
}
footer.copyright a{
    color:var(--primary);
    text-decoration: none;
}

.nav-background .mobile-logo{
    padding:1rem;
}
.nav-background .mobile-nav{
    padding:1rem;
}
.nav-background .mobile-nav ul{
    list-style-type: none;
}
.nav-background .mobile-nav ul li{
    margin-bottom:1rem;
}
.nav-background .mobile-nav ul li a{
    text-decoration: none;
    color:var(--secondary);
    font-family: "Raleway-medium";
}
.nav-background .mobile-nav ul li a:hover{
    color:var(--primary);
}
.nav-background .contact, .nav-background .time{
    padding:1rem;
    padding-left:0;
}
.nav-background .contact img, .nav-background .time img{
    margin-right:1rem;
}
.nav-background .contact h5,.nav-background .time h5{
    font-family:"Raleway-bold";
    margin-bottom:0.25rem;
    font-size:1rem;
}
.nav-background .contact h6, .nav-background .contact h6{
    font-size: 0.75rem;
}
.nav-background .cart{
    margin-bottom:2rem;
}
.nav-background .cart a{
    color:var(--secondary);
    text-decoration: none;
    font-family: "Raleway-bold";
}
.nav-background .cart img{
    margin-right:0.75rem;
    width:20px;
    height:20px;
}

@media (max-width:992px){
    .nav-trigger{
        display:block;
    }
    header.topbar, nav{
        display:none;
    }

    header.hero {
        margin-top:-4rem;
    }
    header.hero .hero-image{
        right:-160px;
        top:100px;
    }
    .top-products .slider-btn{
        display:none!important;
    }
    .latest-news .article-wrapper{
        flex-direction:column;
    }
    .latest-news .article-wrapper .card{
        margin-right:0;
        margin-bottom:4rem;
    }

    footer .instagram-api .post-wrap > div{
        width:calc(1/2*100% - (1 - 1/3)*10px);
    }
}

@media (max-width:768px){
    .about-meal .about-meal-wrap{
        flex-direction: column;
    }
    .about-meal .about-meal-wrap img{
        width:100%;
        margin-bottom: 2rem;
    }

    section.our-services .card-wrapper{
        flex-direction:column;
    }
    section.our-services .card-wrapper .service-card{
        margin-bottom:6rem;
    }
    footer .container{
        flex-direction: column;
    }
    footer .box{
        text-align: left;
        margin-right:0;
        margin-bottom:3rem;
    }
    footer .box:nth-child(3) h3{
        text-align:left;
    }
    footer .box:nth-child(3) > div{
        display:block;
    }
}

@media( max-width:576px){
    header.hero .hero-image{
        right:-235px;
        top:150px;
    }
    header.hero .container{
        padding-left:1rem;
    }
    header.hero{
        margin-top:-3rem;
    }
    section.big-deal .timer > div{
        margin-right:0.50rem;
    }
    section.big-deal .timer{
        margin-right:-0.5rem;
    }

    section.subscribe .container{
        flex-direction: column;
        padding:0.50rem;
    }
   
} 

/* ..............SearchBar...........   */ 

.search-input {
  position: absolute;
  top: 10px;
  left: 38px;
  font-size: 14px;
  background: none;
  color: #5a6674;
  width: 195px;
  height: 20px;
  border: none;
  appearance: none;
  outline: none;

  &::-webkit-search-cancel-button {
    appearance: none;
  }
}

.search-button {
  position: absolute;
  top: 10px;
  left: 15px;
  height: 20px;
  width: 20px;
  padding: 0;
  margin: 0;
  border: none;
  background: none;
  outline: none!important;
  cursor: pointer;
}
    
 @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700;900&display=swap');
/* <style>  */

:root{  
    --white-light: rgba(255, 255, 255, 0.5);
    --alice-blue: #f8f9fa;
  /*   --carribean-green: #40c9a2; */
    --carribean-green:green;
    --gray: #ededed;
}
.lg-title,
.md-title,
.sm-title
.show-ad-title{
    font-family: 'Roboto', sans-serif;
    padding: 0.6rem 0;
    text-transform: capitalize;
}
.lg-title{
    font-size: 2.5rem;
    font-weight: 500;
    text-align: center;
    padding: 1.3rem 0;
    opacity: 0.9;
}
.show-ad-title{
    font-size: 2.5rem;
    font-weight: 500;
    text-align: center;
    padding: 1.3rem 0;
    opacity: 0.9;
}
.md-title{
    font-size: 2rem;
    font-family: 'Roboto', sans-serif;
}
.sm-title{
    font-weight: 300;
    font-size: 1rem;
    text-transform:
     uppercase;
}
 .size{
    font-weight:100;
    font-size: 1rem;
    margin-top:0.4rem;
} 
.text-light {
    font-size: 1rem;
    font-weight: 600;
    line-height: 1.5;
    opacity: 0.5;
    margin: 0.4rem 0;
}
/* product section */
.products{
    background: var(--alice-blue);
    padding: 3.2rem 0;
}
.products .text-light{
    text-align: center;
    width: 70%;
    margin: 0.9rem auto;
}
.product{
    margin: 2rem;
    position: relative;
     background-color: #f9f9f9;
   /*   display: grid; */   
}
.product-title{
    font-weight: 300;
    font-size: 1rem;
   /*  text-transform:
     uppercase; */
}
.product-content{
    background: var(--gray);
    padding: 3rem 0.5rem 2rem 0.5rem;
    cursor: pointer;
}
.product-img{
    background: var(--white-light);
    box-shadow: 0 0 20px 10px var(--white-light); 
    /* box-shadow: 0 0 80px 40px var(--white-light); */ 
    width: 200px;
    height: 200px;
    margin: 0 auto;
    border-radius: 50%;
    transition: background 0.5s ease;
}
.product-btns{
    display: flex;
    justify-content: center;
    margin-top: 1.4rem;
    opacity: 0;
    transition: opacity 0.6s ease;
}
.btn-cart, .btn-buy{
    background: transparent;
    border: 1px solid black;
    padding: 0.8rem 0;
    width: 125px;
    font-family: inherit;
    text-transform: uppercase;
    cursor: pointer;
    border: none;
    transition: all 0.6s ease;
}
.btn-cart{
    /* background: black; */
    color: white;
    background:#4CAF50;
}
.btn-cart:hover{
    background: var(--carribean-green);
}
.btn-buy{
    background: white;
}
.btn-buy:hover{
    background: var(--carribean-green);
    color: #fff;
}
.product-info{
    background: white;
    padding: 2rem;
}
.product-info-top{
    display: flex;
    justify-content: space-between;
    align-items: center;
}
.rating span{
   /*  color: var(--carribean-green); */
    /* color:green; */
    color:orange;
}
.product-name{
    color: black;
    display: block;
    text-decoration: none;
    font-size: 1rem;
   /*  text-transform: uppercase; */
    font-weight: bold;
}
.product-price{
    padding-top: 0.6rem;
    padding-right: 0.6rem;
    display: inline-block;
   
}
.product-price:first-of-type{
    text-decoration: line-through;
   /*  color: var(--carribean-green); */
    color: #4CAF50;
}
.product-size{
    padding-top: 0.6rem;
    padding-right: 0.6rem;
    display: inline-block;

}
.product-img img{
    transition: transform 0.6s ease;
}
.product:hover .product-img img{
    transform: scale(1.1);
}
.product:hover .product-img{
    /* background: var(--carribean-green);  */
    background: white; 
    
}
.product:hover .product-btns{
    opacity: 1;
}
.off-info .sm-title{
    /* background: var(--carribean-green); */
     /* background:#4CAF50; */
   /*  color: white; */
    background-color:#4CAF50;
    color:white;
    display: inline-block;
    padding: 0.5rem;
    position: absolute;
    top: 0;
    left: 0;
    writing-mode: vertical-tb;
    transform: rotate(360deg); 
   /*  z-index: 1; */
    letter-spacing: 3px;
    cursor: pointer;
    font-weight: bold;
}

/* product collection */
.product-collection{
  /* padding: 3.2rem 0;   */
    padding: 0.1rem 0; 
}
.product-collection-wrapper{
  /* padding: 3.2rem 0;  */
   padding: 0.1rem 0;
}
.product-col-left{
    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3)), url("images/milk image.jpg") center/cover no-repeat;
}
.product-col-r-top{
    background: linear-gradient(rgba(0, 0, 0, 0), rgba(0, 0, 0, 0.3)), url("images/vegetables.jpg") center/cover no-repeat;
}
.flexx{
    display: flex;
    justify-content: center;
    align-items: flex-end;
    height: 50vh;
    padding: 2rem 1.5rem 3.2rem;
    margin: 5px;
}
.product-col-r-bottom > div:first-child{
  /*   background: #eaa001; */
    background: #ABD5BAFF;
    
}
.product-col-r-bottom > div:last-child{
    /* background: #0090ff; */
    background:#ff726f; 
   /* background:#FAE6FA; */
  
  
}
.product-col-content{
    text-align: center;
    color: white;
}
.product-collection .text-light{
    opacity: 1;
    font-size: 0.8;
    font-weight: 400;
    line-height: 1.7;
}
.btn-dark{
    background: white;
    color:green;
    border:1px solid #ddd;
    outline: 0;
    border-radius: 25px;
    padding: 0.7rem 1rem;
    border: 0;
    margin-top: 1rem;
    cursor: pointer;
    transition: all 0.6s ease;
    font-size: 1rem;
    font-family: inherit;
}
.btn-dark:hover{
    background: var(--carribean-green);
    /* background:white; */
}
/* Media Queries */
@media screen and (min-width: 992px){
    .product-items{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
    .product-col-r-bottom{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
}
@media screen and (min-width: 1200px){
    .product-items{
        grid-template-columns: repeat(3, 1fr);
    }
    .product{
        margin-right: 1rem;
        margin-left: 1rem;
    }
    .products .text-light{
        width: 50%;
    }
}

@media screen and (min-width: 1336px){
    .product-items{
        grid-template-columns: repeat(4, 1fr);
    }
    .product-collection-wrapper{
        display: grid;
        grid-template-columns: repeat(2, 1fr);
    }
    .flexx{
        height: 60vh;
    }
    .product-col-left{
        height: 121.5vh;
    }
}

/* ..........slider......... */

/* Slider Css */
    .galleryContainer {
    width: 100%;
   /*  height: 500px; */
    height:500px;
    max-width: 1388px;
   /*  margin: auto; */
    user-select: none;
    /* box-shadow: 0px 0px 3px 1px #00000078; */
   /*  padding: 10px; */
    /*  box-sizing: border-box; */
   /*  margin-left:97px; */
    /* margin-right:50px; */
    margin:0 auto; 
    
}
.galleryContainer .slideShowContainer{
    width: 100%;
    height: 90%;
    overflow: hidden;
    background-color: gainsboro;
    position: relative;
}
.galleryContainer .slideShowContainer #playPause{
    width: 32px;
    height: 32px;
    position: absolute;
    background-image: url(${images}/playpouse.png);
    background-repeat: no-repeat;
    z-index: 5;
    background-size: cover;
    margin: 5px;
    cursor: pointer;
}
.galleryContainer .slideShowContainer #playPause:hover{
    opacity: .7;
}
.galleryContainer .slideShowContainer .imageHolder{
    width: 100%;
    height: 100%;
    position: absolute;
   /*  opacity: 0; */
}
.galleryContainer .slideShowContainer .imageHolder img{
    width: 100%;
    height: 100%;
}
.galleryContainer .slideShowContainer .imageHolder .captionText{
    display: none;
}

.galleryContainer .slideShowContainer .leftArrow,.galleryContainer .slideShowContainer .rightArrow{
    width: 50px;
    background: #00000036;
    position: absolute;
    left: 0;
    z-index: 1;
    transition: background 0.5s;
    height: 72px;
    top: 50%;
    transform: translateY(-50%);
    border-top-right-radius: 10px;
    border-bottom-right-radius: 10px;
}

.galleryContainer .slideShowContainer .rightArrow {
    left: auto;
    right: 0;
    border-top-right-radius: 0px;
    border-bottom-right-radius: 0px;
    border-top-left-radius: 10px;
    border-bottom-left-radius: 10px;
}
.galleryContainer .slideShowContainer .leftArrow:hover,.galleryContainer .slideShowContainer .rightArrow:hover{
    background: #000000a8;
    cursor: pointer;
}
.galleryContainer .arrow{
    display: inline-block;
    border: 3px solid white;
    width: 10px;
    height: 10px;
    border-left: none;
    border-bottom: none;
    margin: auto;
    position: absolute;
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}
.galleryContainer .arrow.arrowLeft{
    transform: rotateZ(-135deg);
}
.galleryContainer .arrow.arrowRight{
    transform: rotateZ(45deg);
}

.galleryContainer .slideShowContainer>.captionTextHolder{
    position: absolute;
    bottom: 0;
    z-index: 1;
    color: white;
    font-family: sans-serif;
    font-size: 20px;
    text-align: center;
    width: 100%;
    background: #00000047;
    height: 50px;
    line-height: 50px;
    overflow: hidden;
}
.galleryContainer .slideShowContainer>.captionTextHolder>.captionText{
    margin: 0;
}

.galleryContainer #dotsContainer{
    width: 100%;
    height: 10%;
    text-align: center;
    padding-top: 20px;
    box-sizing: border-box;
}
.galleryContainer #dotsContainer .dots{
    display: inline-block;
    width: 15px;
    height: 15px;
    border-radius: 50%;
    margin-left: 5px;
    background-color: #bbb;
    cursor: pointer;
    transition:background-color 0.5s;
}
.galleryContainer #dotsContainer .dots:first-child{
    margin-left: 0;
}
.galleryContainer #dotsContainer .dots:hover,.galleryContainer #dotsContainer .dots.active{
    background-color: #717171;;
}

.galleryContainer .moveLeftCurrentSlide{
    animation-name: moveLeftCurrent;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;

}
.galleryContainer .moveLeftNextSlide{
    animation-name: moveLeftNext;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
@keyframes moveLeftCurrent {
    from {margin-left: 0;opacity: 1;}
    to {margin-left: -100%;opacity: 1;}
}
@keyframes moveLeftNext {
    from {margin-left: 100%;opacity: 1;}
    to {margin-left: 0%;opacity: 1;}
}


.galleryContainer .moveRightCurrentSlide{
    animation-name: moveRightCurrent;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
.galleryContainer .moveRightPrevSlide{
    animation-name: moveRightPrev;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-fill-mode:forwards;
}
@keyframes moveRightCurrent {
    from {margin-left: 0;opacity: 1;}
    to {margin-left: 100%;opacity: 1;}
}
@keyframes moveRightPrev {
    from {margin-left: -100%;opacity: 1;}
    to {margin-left: 0%;opacity: 1;}
}
.slideTextFromBottom {
    animation-name: slideTextFromBottom;
    animation-duration: 0.7s;
    animation-timing-function: ease-out;
}
@keyframes slideTextFromBottom {
    from {opacity: 0;margin-top: 100px}
    to {opacity: 1;margin-top: 0px;}
}
.slideTextFromTop {
    animation-name: slideTextFromTop;
    animation-duration: 0.7s;
    animation-timing-function: ease-out;
}
 @keyframes slideTextFromTop {
    from {opacity: 0;margin-top: -100px}
    to {opacity: 1;margin-top: 0px;}
}

.alert{
 background-color:orange;
 padding:12px;
  color: white;
  opacity: 1;
  transition: opacity 0.6s;
  margin-bottom: 15px;
   max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;
    text-align: center;
     letter-spacing:2px;
    cursor: pointer;
    font-weight: bold;
}
.closebtn {
  margin-left: 15px;
  color: white;
  font-weight: bold;
  float: right;
  font-size: 22px;
  line-height: 20px;
  cursor: pointer;
  transition: 0.3s;
}

.closebtn:hover {
  color: black;
}
.qty{
width:35px;
}
.map{
    flex:1;
    filter:grayscale(100%);
    -webkit-filter:grayscale(100%);
    max-width: 1388px;
    margin: 0 auto;
}
.qty{
width:35px;
height:40px
}


/* ........Profile Menu css........... */
.dropdown {
  position: relative;
  display: inline-block; 
}
.dropdown-content {
  display: none;
  position:absolute;
  background-color: #f1f1f1;
  min-width: 200px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
 /*  z-index: 1; */
        z-index: 999;
        left: 0;
       /*  margin-top:11px; */
       
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
}

.dropdown-content a:hover {background-color: #ddd;
    border-bottom: 3px solid black;}

.dropdown:hover .dropdown-content {display: block;
   border-bottom: 3px solid black; }

.dropdown:hover .dropbtn {background-color:;
    border-bottom: 3px solid white;}
    
    /* ........Profile Menu css Close........... */
   
 </style>
</head>


<!-- ***************Body Code***************** -->

<body>

<%-- <c:if test="${not empty message}">
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong></strong>${message}
</div>
</c:if>
 --%>
 
<!-- ......... HeadSection........ -->

<div class="main-wrapper"> 

	<div class="nav-background">
   		
   		<div class="mobile-logo">
   <spring:url value="/images" var="images" />
   <img src="${images}/VeggieFridge.ico"  width="150" height="100" alt=""/>
             <!--    <img src="./icons/logo.svg" alt=""> -->
            </div>
            <div class="mobile-nav">
   <div class="cart">
   <div class="flex items-center">
     <security:authorize access="isAnonymous()">
     <a href="#">Nagpur,Mihan</a><%-- ${customerModel.cities}, ${customerModel.location} --%>
     </security:authorize>
   <security:authorize access="isAnonymous() or hasRole('USER')">
   <spring:url value="/images" var="images" />
   <img src="${images}/cart-dark.svg"  width="15" height="15" alt=""/>
   <!--   <img src="./icons/cart-dark.svg" alt=""> -->
   <a href="#">${customerModel.cartpage.cartitem} Items - (&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/>)</a>
   </security:authorize>
   </div>
                </div>
                <div class="nav-top">
                    <ul>
                    
                        <li>
                            <a href="#">Home</a>
                        </li>
                        <li>
                            <a href="#">About us</a>
                        </li>
                        <li>
                            <a href="#">Products</a>
                        </li>
                        <li>
                            <a href="#">Blog</a>
                        </li>
                        <li>
                            <a href="#">Shop</a>
                        </li>
                        <li>
                            <a href="#">Services</a>
                        </li>
                        <li>
                            <a href="#">Contact us</a>
                        </li>
                        <security:authorize access="isAnonymous()">
                        <li>
                            <a href="#">Log in</a>
                        </li>
                        <li>
                            <a href="#">Register</a>
                        </li>
                        </security:authorize>
                          <security:authorize access="hasAnyRole('ADMIN', 'USER')">
                        <li>
                            <a href="<c:url value="/logout"/>">Log Out</a>
                        </li>
                        </security:authorize>
                        
                    </ul>
                </div>
                <div class="contact flex items-center">
   <spring:url value="/images" var="images" />
   <img src="${images}/phone2.png"  width="25" height="25" alt=""/>
                    <!-- <img src="./icons/phone.svg" alt=""> -->
                    <div>
                        <h5>Call us: (+84) 123 456 789</h5>
                        <h6>E-mail : support@freshmeal.com</h6>
                    </div>
                </div>
                <%-- <div class="time flex items-center">
   <spring:url value="/images" var="images" />
   <img src="${images}/Phone1.jpg"  width="25" height="25" alt=""/>
                   <!--  <img src="./icons/clock.svg" alt=""> -->
                    <div>
                        <h5>Working Hours:</h5>
                        <h6>Mon - Sat (8.00am - 12.00am)</h6>
                    </div>
                </div> --%>
            </div>
        </div>
        
        
        <div class="site-content-wrapper">
            <div class="nav-trigger">
                <svg xmlns="" width="24" height="24" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
   	                 class="feather feather-bar-chart">
                    <line x1="12" y1="20" x2="12" y2="10" />
                    <line x1="18" y1="20" x2="18" y2="4" />
                    <line x1="6" y1="20" x2="6" y2="16" /></svg>
            </div> 
            
                <div class="site-content">
                <header class="topbar" style="position:relative;">
                    <div class="container flex justify-between items-center">
                        <div class="icons">
                            <a href="#"><img src="./icons/facebook.svg" alt=""></a>
                            <a href="#"><img src="./icons/twitter.svg" alt=""></a>
                            <a href="#"><img src="./icons/google.svg" alt=""></a>
                            <a href="#"><img src="./icons/instagram.svg" alt=""></a>
                            <a href="#"><img src="./icons/search.svg" alt=""></a>
                        </div>
                        <div class="auth flex items-center">
                         
                            <security:authorize access="isAnonymous()">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/user-icon.svg"  width="15" height="15" alt=""/>
                              <!--   <img src="./icons/user-icon.svg" alt=""> -->
                            <a href="${pageContext.request.contextPath}/login">Log in</a>
                            </div> 
                            <span class="divider">|</span>
                            </security:authorize>
                             
                            <security:authorize access="isAnonymous()">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/edit.svg"  width="15" height="15" alt=""/>
                            <!--   <img src="./icons/edit.svg" alt=""> -->
                            <a href="${pageContext.request.contextPath}/signup">Register Now</a>
                            </div>
                            <span class="divider">|</span> 
                            </security:authorize>
                            
                            <security:authorize access="hasAnyRole('ADMIN', 'USER')">
                            
                            <div class="dropdown">
                            <spring:url value="/images" var="images" />
    <img src="${images}/user-icon.svg"  width="15" height="15" alt=""/>
                              <!--   <img src="./icons/user-icon.svg" alt=""> -->
    <a href="#" class="dropbtn">Hello, ${customerModel.firstName}</a>
    
    <div class="dropdown-content" style="color: black;">
    <c:forEach var="menu" items="${listprofileMenu}">
   
   <a style="color: black;" href="${pageContext.request.contextPath }/${menu.url}"> <spring:url value="/images" var="images" />
   <img src="${images}/${menu.imageName}"  width="15" height="15" alt=""/> ${menu.menues}</a>
   
  <%--  <a href="${pageContext.request.contextPath }/cart/editProfile${customerModel.customerid}" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/myprofile1.png"  width="15" height="15" alt=""/> My Profile</a> --%>
    <%-- <a href="${pageContext.request.contextPath }/cart/listCustomerCartItem" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/cart-dark.svg"  width="15" height="15" alt=""/> My cart</a>
    <a href="${pageContext.request.contextPath }/order/showPendingOrders${customerModel.customerid}" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/order4.png"  width="15" height="15" alt=""/> My Orders</a>
     <a href="${pageContext.request.contextPath }/wallet/myWallet/${customerModel.customerid}" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/wallet.png"  width="15" height="15" alt=""/> Wallet</a>
    <a href="#" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/cart-dark.svg"  width="15" height="15" alt=""/> Membership</a>
    <a href="#" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/cart-dark.svg"  width="15" height="15" alt=""/> Help</a>
    <a href="<c:url value="/logout" />" style="color: black;"> <spring:url value="/images" var="images" />
   <img src="${images}/logout1.png"  width="15" height="15" alt=""/> Log Out</a> --%>
  </c:forEach>
   </div>
                            </div>
                            <span class="divider">|</span>
                            </security:authorize>
                            
                            <security:authorize access="isAnonymous()">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/location.png"  width="15" height="15" alt=""/>
                            <!--   <img src="./icons/user-icon.svg" alt=""> -->
                            <a href="#">Nagpur,Mihan</a>
                            </div>
                             <span class="divider">|</span>
                            </security:authorize>
                            
                            
                             <security:authorize access="hasRole('USER')">
                            <div>
                            <spring:url value="/images" var="images" />
                            <img src="${images}/location.png"  width="15" height="15" alt=""/>
                            <!--   <img src="./icons/user-icon.svg" alt=""> -->
                            <a href="#">${customerModel.cities}, ${customerModel.location}</a>
                            </div>
                             <span class="divider">|</span>
                            </security:authorize>
                             
                          
                           <security:authorize access="hasRole('USER')">
                           <div>
                           <spring:url value="/images" var="images" />
                           <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                           <!--  <img src="./icons/cart.svg" alt=""> -->
                           <a href="${pageContext.request.contextPath}/cart/listCustomerCartItem">${customerModel.cartpage.cartitem} Items - (&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/>)</a>
                           </div>
                           </security:authorize>
                           
                            <security:authorize access="isAnonymous()">
                           <div>
                           <spring:url value="/images" var="images" />
                           <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                           <!--  <img src="./icons/cart.svg" alt=""> -->
                           <a href="#">0 Items - (&#8377;0.00)</a>
                           </div>
                           </security:authorize>
                        </div>
                    </div>
                </header>
                
          <nav>                    
                <div class="top">
                        <div class="container flex justify-between">
                        
                       <%--  <div>
                        <spring:url value="/images" var="images" />
   <img src="${images}/logo.jpg"  width="50" height="50" alt=""/>
   </div> --%>
                            <div class="contact flex items-center">
                         <%--   <spring:url value="/images" var="images" />
   <img src="${images}/logo.jpg"  width="50" height="50" alt=""/>
                           <spring:url value="/images" var="images" />
   <img src="${images}/phone.svg"  width="25" height="25" alt=""/>  --%>
                               <!--  <img src="/images/phone.svg" alt=""> --> 
                               <div style="margin-left:80px;">
   <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
                                    <!--  <h5>Call US: (+84) 123 456 789</h5>
                                    <h6>E-mail : support@freshmeal.com</h6> -->
                              </div>   
                            </div>
                            <div class="branding">
                            <form class="search-form" style="position:relative;
  width: 350px;
  height: 40px;
  border-radius: 40px;
  box-shadow: 0 4px 6px rgba(0, 0, 0, 0.10);
  transform: translate(-50%, -50%);
  background: #fff;
  transition: all 0.3s ease; top:40%;
  left:45%;">
  <input type="search" value="" placeholder="Search" class="search-input" id="myInput">
  <button type="submit" class="search-button">
  </button>
  </form>
                                <!-- <img src="./icons/logo.svg" alt=""> -->
                                 <%--  <spring:url value="/images" var="images" />
   <img src="${images}/logo.jpg"  width="165" height="120"/> --%>
                            </div>
                            <div class="time flex items-center">
                                <!-- <img src="./icons/clock.svg" alt="">
                                <div>
                                    <h5>Working Hours:</h5>
                                    <h6>Mon - Sat (8.00am - 12.00am)</h6>
                                </div> -->
                                <spring:url value="/images" var="images" />
   <img src="${images}/Phone1.jpg"  width="25" height="25" alt=""/>
                               <!--  <img src="/images/phone.svg" alt=""> -->
                                <div>
                                    <h5>Call Us: (+91) 982 357 6042  </h5>
                                    <h6>E-mail : support@veggiefridge.com</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <security:authorize access="isAnonymous() or hasRole('USER')">
                    <div class="navbar magic-shadow">
                           <div class="container flex justify-center">
                            <a href="${pageContext.request.contextPath}/home" class="active">Home</a>
                          <c:forEach var="menu" items="${listMenu}">
                            <a href="#">${menu.menues}</a>
                           <!--  <a href="#">Products</a>
                            <a href="#">Blog</a>
                            <a href="#">Shop</a>
                            <a href="#">Services</a>
                            <a href="#">Gallery</a>
                            <a href="#">Contact us</a> -->
                            </c:forEach>
                        </div>
                    </div>
                     </security:authorize>
                     
                      <security:authorize access="hasRole('ADMIN')">
                    <div class="navbar magic-shadow">
                            <div class="container flex justify-center">
                            <a href="#" class="active">Home</a>
                            <a href="#">Manage Product</a>
                            <a href="#">Manage Location</a>
                             <a href="#">Manage Kiosk</a>
                        </div>
                    </div>
                     </security:authorize>
                 </nav>
           
                <header class="hero flex items-center" style="background-image:url('images/Blur.png');">
                    <div class="container">
                        <div class="welcome flex items-center">
                            <span>Welcome to</span>
                            <%-- <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>  --%>
                          <!--   <img src="./icons/logo-2.svg" alt=""> -->
                        </div>
                        <h1>The World Best <span>Shoping</span> Website</h1>
                        <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has
                            been the
                            industry's standard dummy.</p>
                        <div>
                            <button class="btn btn-primary">Read More</button>
                            <button class="btn btn-secondary">Shop Now</button>
                        </div>
                        <div class="hero-image">
                         <spring:url value="/images" var="images" />
                         <img src="${images}/vegies.png" alt=""/>
                            <!-- <img src="./images/straw.png" alt=""> -->
                        </div>
                    </div>
                </header>
               
               <!--  </div>
                </div>
                </div> -->
            
              
<!-- Products   -->
     <security:authorize access="isAnonymous() or hasRole('USER')">
	 <div class = "products">
            <div class = "container" style="margin: 0 auto;max-width:1388px;">
                <h1 class = "lg-title">Fresh Vegetables And Milk</h1>
                <p class ="text-light">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quos sit consectetur, ipsa voluptatem vitae necessitatibus dicta veniam, optio, possimus assumenda laudantium. Temporibus, quis cum.</p>
                <div class = "product-items">
                    <!--1. single product -->
                   <c:forEach var="product" items="${listProduct}">
                   <div class = "product">
                        <div class = "product-content">
                            <div class = "product-img">
                             <spring:url value="/images" var="images" />
    <img src="${images}/${product.imageName}"/ width="100%"> 
    <%-- <spring:url value="/images" var="images" />
	<img src="${images}/bringal.jpg" width="100%"; /> --%>
                              <!--   <img src = "images/shoe-1.png" alt = "product image"> -->
                            </div>
                            <div class = "product-btns">
                            <button type = "button" class = "btn-cart" onclick="window.location.href='${pageContext.request.contextPath }/cart/addToCartPageItem/${product.productid}'"> add to cart
                            <span><i class = "fas fa-shopping-cart"></i></span>
                            </button>
                         
 <button onclick="increment()" class ="qty">+</button>
<input id=demoInput type=text min=1 max=9 class = "number" value="1" style="text-align: center;width:35px;">
<button onclick="decrement()" class = "qty">-</button>
                            <!-- <input type="number" max="9" min="1" value="1" placeholder="Qty" style="text-align:center;
                            "> -->
                                <!-- <button type = "button" class = "btn-buy"> buy now
                                    <span><i class = "fas fa-shopping-cart"></i></span>
                                </button> -->
                            </div>
                        </div>
                        <div class = "product-info" id="myTable">
                            <div class = "product-info-top">
                                <h2 class = "product-title" style="color: black;">${product.productName}</h2>
                                <div class = "rating" style="color:orange;">
                                    <span><i class = "fas fa-star"></i></span>
                                    <span><i class = "fas fa-star"></i></span>
                                    <span><i class = "fas fa-star"></i></span>
                                    <span><i class = "fas fa-star"></i></span>
                                    <span><i class = "far fa-star"></i></span>
                                </div>
                            </div>
                            <a href = "#" class = "product-name">${product.description}</a>
                          <h4 class = "size" style="color: black;">Size: ${product.size} ${product.unit}</h4> 
                          <%--   <p class = "product-price">Rs ${product.price}</p> --%>
                      MRP: <p class = "product-price">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}"/></p>
                       <p class = "product-price">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price-product.discount * product.price/100}"/></p>
                      <%--  <p class = "product-price">Rs ${product.price-product.discount * product.price/100}</p> --%>
                            
                        </div>

                        <div class = "off-info" style="background-color:#4CAF50;">
                            <h2 class = "sm-title">${product.discount}% off</h2>
                        </div>
                    </div>
                    </c:forEach>
 
               <!--  end of single product -->
                    
                </div>
            </div>
        </div>
         </security:authorize>

            <security:authorize access="isAnonymous() or hasRole('USER')">
            <div class = "product-collection">
            <div class = "container" style="margin: 0 auto;max-width:1388px;">
            <h1 class = "show-ad-title">Shop By Catogary</h1>
            <div class = "product-collection-wrapper">
                    <!-- product col left -->
                    <div class = "product-col-left flexx">
                        <div class = "product-col-content">
                            <h2 class = "sm-title">Fresh Milk </h2>
                            <h2 class = "md-title">Fresh Milk </h2>
                            <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                            <button type = "button" class = "btn-dark">Shop now</button>
                        </div>
                    </div>

                    <!-- product col right -->
                    <div class = "product-col-right">
                        <div class = "product-col-r-top flexx">
                            <div class = "product-col-content">
                                <h2 class = "sm-title">Fruit Vegetables </h2>
                                <h2 class = "md-title">Fruit Vegetables </h2>
                                <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                                <button type = "button" class = "btn-dark">Shop now</button>
                            </div>
                        </div>

                        <div class = "product-col-r-bottom">
                            <!-- left -->
                            <div class = "flexx">
                                <div class = "product-col-content">
                                    <h2 class = "sm-title">OFFERS </h2>
                                    <h2 class = "md-title">Leafy Vegetables </h2>
                                    <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                                    <button type = "button" class = "btn-dark">Shop now</button>
                                </div>
                            </div>
                            <!-- right -->
                            <div class = "flexx">
                                <div class = "product-col-content">
                                    <h2 class = "sm-title">Milk </h2>
                                    <h2 class = "md-title">Milk </h2>
                                    <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                                    <button type = "button" class = "btn-dark">Shop now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </security:authorize>
        
          <security:authorize access="isAnonymous() or hasRole('USER')">
        <!-- slidercode -->
	<!--  SLIDERCODE -->
    <div class="galleryContainer">
    <div class="slideShowContainer">
        <div id="playPause" onclick="playPauseSlides()"></div>
        <div onclick="plusSlides(-1)" class="nextPrevBtn leftArrow"><span class="arrow arrowLeft"></span></div>
        <div onclick="plusSlides(1)" class="nextPrevBtn rightArrow"><span class="arrow arrowRight"></span></div>
        <div class="captionTextHolder"><p class="captionText slideTextFromTop"></p></div>
    
  <c:forEach var="image" items="${headerImages}">
  <div class="imageHolder">
  <spring:url value="/images" var="images" />
  <img src="${images}/${image.imageUrl}"/>1366X768
  <%--  <spring:url value="/images" var="images" />
  <img src="${images}/organic.jpg"/> --%>
  <p class="captionText">${image.captionText}</p>
  </div>
  </c:forEach>
  </div>
 <div id="dotsContainer"></div>
</div>
</security:authorize>
<script src="myScript.js">
    var slideIndex,slides,dots,captionText;
function initGallery(){
    slideIndex = 0;
    slides=document.getElementsByClassName("imageHolder");
    slides[slideIndex].style.opacity=1;

    captionText=document.querySelector(".captionTextHolder .captionText");
    captionText.innerText=slides[slideIndex].querySelector(".captionText").innerText;

    //disable nextPrevBtn if slide count is one
    if(slides.length<2){
        var nextPrevBtns=document.querySelector(".leftArrow,.rightArrow");
        nextPrevBtns.style.display="none";
        for (i = 0; i < nextPrevBtn.length; i++) {
            nextPrevBtn[i].style.display="none";
        }
    }

    //add dots
    dots=[];
    var dotsContainer=document.getElementById("dotsContainer"),i;
    for (i = 0; i < slides.length; i++) {
        var dot=document.createElement("span");
        dot.classList.add("dots");
        dotsContainer.append(dot);
        dot.setAttribute("onclick","moveSlide("+i+")");
        dots.push(dot);
    }
    dots[slideIndex].classList.add("active");
}
initGallery();
function plusSlides(n) {
    moveSlide(slideIndex+n);
}
function moveSlide(n){
    var i;
    var current,next;
    var moveSlideAnimClass={
          forCurrent:"",
          forNext:""
    };
    var slideTextAnimClass;
    if(n>slideIndex) {
        if(n >= slides.length){n=0;}
        moveSlideAnimClass.forCurrent="moveLeftCurrentSlide";
        moveSlideAnimClass.forNext="moveLeftNextSlide";
        slideTextAnimClass="slideTextFromTop";
    }else if(n<slideIndex){
        if(n<0){n=slides.length-1;}
        moveSlideAnimClass.forCurrent="moveRightCurrentSlide";
        moveSlideAnimClass.forNext="moveRightPrevSlide";
        slideTextAnimClass="slideTextFromBottom";
    }

    if(n!=slideIndex){
        next = slides[n];
        current=slides[slideIndex];
        for (i = 0; i < slides.length; i++) {
            slides[i].className = "imageHolder";
            slides[i].style.opacity=0;
            dots[i].classList.remove("active");
        }
        current.classList.add(moveSlideAnimClass.forCurrent);
        next.classList.add(moveSlideAnimClass.forNext);
        dots[n].classList.add("active");
        slideIndex=n;
        captionText.style.display="none";
        captionText.className="captionText "+slideTextAnimClass;
        captionText.innerText=slides[n].querySelector(".captionText").innerText;
        captionText.style.display="block";
    }

}
var timer=null;
function setTimer(){
    timer=setInterval(function () {
        plusSlides(1) ;
    },3000);
}
setTimer();
function playPauseSlides() {
    var playPauseBtn=document.getElementById("playPause");
    if(timer==null){
        setTimer();
        playPauseBtn.style.backgroundPositionY="0px"
    }else{
        clearInterval(timer);
        timer=null;
        playPauseBtn.style.backgroundPositionY="-33px"
    }
}
    </script>
</body>
</html>
<script>
    
var slideIndex,slides,dots,captionText;
function initGallery(){
    slideIndex = 0;
    slides=document.getElementsByClassName("imageHolder");
    slides[slideIndex].style.opacity=1;

    captionText=document.querySelector(".captionTextHolder .captionText");
    captionText.innerText=slides[slideIndex].querySelector(".captionText").innerText;

    //disable nextPrevBtn if slide count is one
    if(slides.length<2){
        var nextPrevBtns=document.querySelector(".leftArrow,.rightArrow");
        nextPrevBtns.style.display="none";
        for (i = 0; i < nextPrevBtn.length; i++) {
            nextPrevBtn[i].style.display="none";
        }
    }

    //add dots
    dots=[];
    var dotsContainer=document.getElementById("dotsContainer"),i;
    for (i = 0; i < slides.length; i++) {
        var dot=document.createElement("span");
        dot.classList.add("dots");
        dotsContainer.append(dot);
        dot.setAttribute("onclick","moveSlide("+i+")");
        dots.push(dot);
    }
    dots[slideIndex].classList.add("active");
}
initGallery();
function plusSlides(n) {
    moveSlide(slideIndex+n);
}
function moveSlide(n){
    var i;
    var current,next;
    var moveSlideAnimClass={
          forCurrent:"",
          forNext:""
    };
    var slideTextAnimClass;
    if(n>slideIndex) {
        if(n >= slides.length){n=0;}
        moveSlideAnimClass.forCurrent="moveLeftCurrentSlide";
        moveSlideAnimClass.forNext="moveLeftNextSlide";
        slideTextAnimClass="slideTextFromTop";
    }else if(n<slideIndex){
        if(n<0){n=slides.length-1;}
        moveSlideAnimClass.forCurrent="moveRightCurrentSlide";
        moveSlideAnimClass.forNext="moveRightPrevSlide";
        slideTextAnimClass="slideTextFromBottom";
    }

    if(n!=slideIndex){
        next = slides[n];
        current=slides[slideIndex];
        for (i = 0; i < slides.length; i++) {
            slides[i].className = "imageHolder";
            slides[i].style.opacity=0;
            dots[i].classList.remove("active");
        }
        current.classList.add(moveSlideAnimClass.forCurrent);
        next.classList.add(moveSlideAnimClass.forNext);
        dots[n].classList.add("active");
        slideIndex=n;
        captionText.style.display="none";
        captionText.className="captionText "+slideTextAnimClass;
        captionText.innerText=slides[n].querySelector(".captionText").innerText;
        captionText.style.display="block";
    }

}
var timer=null;
function setTimer(){
    timer=setInterval(function () {
        plusSlides(1) ;
    },3000);
}
setTimer();
function playPauseSlides() {
    var playPauseBtn=document.getElementById("playPause");
    if(timer==null){
        setTimer();
        playPauseBtn.style.backgroundPositionY="0px"
    }else{
        clearInterval(timer);
        timer=null;
        playPauseBtn.style.backgroundPositionY="-33px"
    }
}
</script>

<!-- MANAGE  PRODUCT TABLE -->
	<security:authorize access="hasRole('ADMIN')">
		<div>
			<h2>
				<p style="color: green; text-align: center;">Manage Product</p>
			</h2>
		</div>

		<form metod="get" onsubmit="return checkCheckBoxes(this);">

			<table id="Table1" border="1" align="center" cellspacing="0"
				style="border: 1px solid #008000; text-align: center; margin-left: auto; margin-right: auto; border-collapse: collapse; width: 80%;">
				<tr>
					<th></th>
					<!--  <th>ProductId</th> -->
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;"></th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">ProductName</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Description</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Size</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Price</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Quantity</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Availability</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Category</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Discount</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">Tax</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">FinalPrice</th>
					<th
						style="border: 1px solid #008000; text-align: center; background-color: #4CAF50; color: white; padding: 15px;">ImageName</th>


				</tr>
				<c:forEach var="product" items="${listProduct}">
					<tr>
						<td align="center" style="padding: 15px;"><input
							type="checkbox" class="checkboxId" name="productid"
							value="${product.productid}"></td>
						<%--<td align="center"><input type="checkbox" name="productid" value="${product.productid}"></td> --%>
						<%--  <td>${product.productid}</td> --%>
						<td style="padding: 10px;"><spring:url value="/images"
								var="images" /> <img src="${images}/${product.imageName}"
							width="60" height="60" /></td>
						<td style="padding: 15px;">${product.productName}</td>
						<td style="padding: 15px;">${product.description}</td>
						<td style="padding: 15px;">${product.size}</td>
						<td style="padding: 15px;">${product.price}</td>
						<td style="padding: 15px;">${product.quantity}</td>
						<td style="padding: 15px;">${product.isAvailable}</td>
						<td style="padding: 15px;">${product.category}</td>
						<td style="padding: 15px;">${product.discount}</td>
						<td style="padding: 15px;">${product.tax}</td>
						<td style="padding: 15px;">${product.price-product.discount * product.price/100}</td>
						<td style="padding: 15px;">${product.imageName}</td>
					</tr>
				</c:forEach>
			    </table>

			<%--  <div><input class="button button1" type="submit" value="Add" formaction="${pageContext.request.contextPath}/product/newProduct"/>
   <input class="button button1" type="submit" value="Delete" 
                       formaction="${pageContext.request.contextPath}/product/deleteProduct" onclick="return confirm('Are you sure to delete?')" />
   <input class="button button1" type="submit" value="Update" formaction="${pageContext.request.contextPath}/product/editProduct" />
   <input class="button button1" type="submit" value="Search" formaction="${pageContext.request.contextPath}/product/searchProduct" />
   </div>  --%>

			<div style="margin-top: 5px; align-content: center; margin-left: 27%">
				<input type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Add"
					formaction="${pageContext.request.contextPath}/product/newProduct"">
				<input type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Delete"
					formaction="${pageContext.request.contextPath}/product/deleteProduct"
					onclick="return confirm('Are you sure to delete?')"> <input
					type="submit"
					style="width: 200px; cursor: pointer; margin: 5px 5px; font-size: 16px; text-decoration: none; border-radius: 8px; text-align: center; color: white; background-color: #4CAF50; padding: 15px; border: none;"
					value="Edit"
					formaction="${pageContext.request.contextPath}/product/editProduct">
			</div>
		</form>
	</security:authorize>

   <jsp:include page="footer.jsp" />
   
     <script>
function myFunction() {
  var x = document.getElementById("myTopnav");
  if (x.className === "topnav") {
    x.className += " responsive";
  } else {
    x.className = "topnav";
  }
}
</script>
<script>
var close = document.getElementsByClassName("closebtn");
var i;

for (i = 0; i < close.length; i++) {
  close[i].onclick = function(){
    var div = this.parentElement;
    div.style.opacity = "0";
    setTimeout(function(){ div.style.display = "none"; }, 600);
  }
}
</script>
     
     <script>
   function increment() {
      document.getElementById('demoInput').stepUp();
   }
   function decrement() {
      document.getElementById('demoInput').stepDown();
   }
</script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="js/app.js"></script>
   <script>
    $(document).ready(function(){
   $('.food-slider').slick({
      autoplay:true,
     slidesToShow:3,
     slidesToScroll:1,
     prevArrow:".prev-btn",
     nextArrow:".next-btn",
     responsive:[
        {
           breakpoint:992,
           settings:{
            slidesToShow:2,
           }
        },
        {
         breakpoint:768,
         settings:{
          slidesToShow:1,
         }
      }
     ]

   });

   $('.nav-trigger').click(function(){
      $('.site-content-wrapper').toggleClass('scaled');
   })
});
       </script>
       
      <script>
$(document).ready(function(){
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable ").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
});
</script> 

   
</body>
</html>