 <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>

<!DOCTYPE html>
<html lang="en">
<head>

  <%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
  <%-- <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> --%>
  <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
  <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>VeggieFridge</title>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" /> 
<link rel="stylesheet" href="./css/style.css">
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
 @import url('https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&family=Roboto:wght@300;400;500;700;900&display=swap');
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
      background:#4CAF50;
     /*  background:var(--secondary); */
      color:var(--pure);
      font-family:"Raleway-semibold";
      padding:0.75rem 0;
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
/* ..............Product............. */
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
</style>
</head>
<body>
    <div class="main-wrapper">
        <div class="nav-background">
            <div class="mobile-logo">
                <img src="./icons/logo.svg" alt="">
            </div>
            <div class="mobile-nav">
                <div class="cart">
                    <div class="flex items-center">
                        <img src="./icons/cart-dark.svg" alt="">
                        <a href="#">0 Items - ($0.00)</a>
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
                        <li>
                            <a href="#">Log in</a>
                        </li>
                        <li>
                            <a href="#">Register</a>
                        </li>
                    </ul>
                </div>
                <div class="contact flex items-center">
                    <img src="./icons/phone.svg" alt="">
                    <div>
                        <h5>Call us: (+84) 123 456 789</h5>
                        <h6>E-mail : support@freshmeal.com</h6>
                    </div>
                </div>
                <div class="time flex items-center">
                    <img src="./icons/clock.svg" alt="">
                    <div>
                        <h5>Working Hours:</h5>
                        <h6>Mon - Sat (8.00am - 12.00am)</h6>
                    </div>
                </div>
            </div>
        </div>
        <div class="site-content-wrapper">
            <div class="nav-trigger">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none"
                    stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                    class="feather feather-bar-chart">
                    <line x1="12" y1="20" x2="12" y2="10" />
                    <line x1="18" y1="20" x2="18" y2="4" />
                    <line x1="6" y1="20" x2="6" y2="16" /></svg>
            </div>
            <div class="site-content">
                <header class="topbar">
                    <div class="container flex justify-between items-center">
                        <div class="icons">
                            <a href="#"><img src="./icons/facebook.svg" alt=""></a>
                            <a href="#"><img src="./icons/twitter.svg" alt=""></a>
                            <a href="#"><img src="./icons/google.svg" alt=""></a>
                            <a href="#"><img src="./icons/instagram.svg" alt=""></a>
                            <a href="#"><img src="./icons/search.svg" alt=""></a>
                        </div>
                        <div class="auth flex items-center">
                            <div>
                            <spring:url value="/images" var="images" />
   <img src="${images}/user-icon.svg"  width="15" height="15" alt=""/>
                              <!--   <img src="./icons/user-icon.svg" alt=""> -->
                                <a href="#">Log in</a>
                            </div>
                            <span class="divider">|</span>
                            <div>
                            <spring:url value="/images" var="images" />
   <img src="${images}/edit.svg"  width="15" height="15" alt=""/>
                              <!--   <img src="./icons/edit.svg" alt=""> -->
                                <a href="#">Register Now</a>
                            </div>
                            <span class="divider">|</span>
                            <div>
                             <spring:url value="/images" var="images" />
   <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                               <!--  <img src="./icons/cart.svg" alt=""> -->
                                <a href="#">0 Items - ($0.00)</a>
                            </div>
                        </div>
                    </div>
                </header>

                <nav>
                    <div class="top">
                        <div class="container flex justify-between">
                            <div class="contact flex items-center">
                            <%-- <spring:url value="/images" var="images" />
   <img src="${images}/phone.svg"  width="25" height="25" alt=""/>
                               <!--  <img src="/images/phone.svg" alt=""> -->
                                <div>
                                    <h5>Call US: (+84) 123 456 789</h5>
                                    <h6>E-mail : support@freshmeal.com</h6>
                                </div> --%>
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
  left:90%;">
  <input type="search" value="" placeholder="Search" class="search-input">
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
                                    <h5>Call US: (+84) 123 456 789</h5>
                                    <h6>E-mail : support@freshmeal.com</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="navbar magic-shadow">
                        <div class="container flex justify-center">
                            <a href="#" class="active">Home</a>
                            <a href="#">About us</a>
                            <a href="#">Products</a>
                            <a href="#">Blog</a>
                            <a href="#">Shop</a>
                            <a href="#">Services</a>
                            <a href="#">Gallery</a>
                            <a href="#">Contact us</a>
                        </div>
                    </div>
                </nav>

                <header class="hero flex items-center">
                    <div class="container" style="background-image: url('images/Blur.png');">
                        <div class="welcome flex items-center">
                            <span>Welcome to</span>
                              <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
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
                         <img src="${images}/vegies.png"  width="300" height="300" alt=""/>
                            <!-- <img src="./images/straw.png" alt=""> -->
                        </div>
                    </div>
                </header>
              <!--   </div>
                </div>
                </div> -->
              
    <!-- Products   -->
	
	<div class = "products">
            <div class = "container" style="max-width:1388px;margin: 0 auto;">
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
    <spring:url value="/images" var="images" />
	<img src="${images}/bringal.jpg" width="100%";/>
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
                        <div class = "product-info">
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
                            <p class = "product-price">Rs ${product.price}</p>
                      MRP: <p class = "product-price">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price}"/></p>
                       <p class = "product-price">&#8377;<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${product.price-product.discount * product.price/100}"/></p>
                       <p class = "product-price">Rs ${product.price-product.discount * product.price/100}</p>
                            
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

       <div class = "product-collection">
            <div class = "container" style="max-width:1388px;margin: 0 auto;">
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
                 <!--    ..........end.......... -->
            </div>
            </div>
        
        <jsp:include page="footer.jsp" /> 
              </div>
              </div>
              </div>
                
      
             <!--    <section class="top-products">
                    <div class="container">
                        <h1 class="section-heading">Top products</h1>
                        <div class="slider">
                            <button class="slider-btn prev-btn"><img src="./icons/pre.svg" alt=""></button>
                            <button class="slider-btn next-btn"><img src="./icons/next.svg" alt=""></button>
                            <div class="food-slider">
                                <div class="food-card magic-shadow-sm">
                                    <div class="product-image flex items-center justify-center">
                                        <img src="./images/plate-1.png" alt="">
                                    </div>
                                    <hr>
                                    <div>
                                        <h2 class="text-center">Summer Salad</h2>
                                        <div class="stars flex justify-center items-center">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                        </div>
                                        <div class="price text-center">
                                            $ 1.25
                                        </div>
                                        <div class="flex justify-center">
                                            <button>
                                                <img src="./icons/cart-2.svg" alt="">
                                                <span>Add to cart</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="food-card magic-shadow-sm">
                                    <div class="product-image flex items-center justify-center">
                                        <img src="./images/plate-2.png" alt="">
                                    </div>
                                    <hr>
                                    <div>
                                        <h2 class="text-center">Russian Salad</h2>
                                        <div class="stars flex justify-center items-center">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                        </div>
                                        <div class="price text-center">
                                            $ 1.25
                                        </div>
                                        <div class="flex justify-center">
                                            <button>
                                                <img src="./icons/cart-2.svg" alt="">
                                                <span>Add to cart</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="food-card magic-shadow-sm">
                                    <div class="product-image flex items-center justify-center">
                                        <img src="./images/plate-3.png" alt="">
                                    </div>
                                    <hr>
                                    <div>
                                        <h2 class="text-center">Greek Salad</h2>
                                        <div class="stars flex justify-center items-center">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                        </div>
                                        <div class="price text-center">
                                            $ 1.25
                                        </div>
                                        <div class="flex justify-center">
                                            <button>
                                                <img src="./icons/cart-2.svg" alt="">
                                                <span>Add to cart</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="food-card magic-shadow-sm">
                                    <div class="product-image flex items-center justify-center">
                                        <img src="./images/plate-3.png" alt="">
                                    </div>
                                    <hr>
                                    <div>
                                        <h2 class="text-center">Cottage pie</h2>
                                        <div class="stars flex justify-center items-center">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/start-filled.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                            <img src="./icons/star-grey.svg" alt="">
                                        </div>
                                        <div class="price text-center">
                                            $ 1.25
                                        </div>
                                        <div class="flex justify-center">
                                            <button>
                                                <img src="./icons/cart-2.svg" alt="">
                                                <span>Add to cart</span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="text-center btn-wrapper">
                            <button class="btn btn-secondary">View More</button>
                        </div>
                    </div>
                </section>
                <section class="about-meal">
                    <div class="container">
                        <h1 class="section-heading">About Fresh Meal</h1>
                        <div class="about-meal-wrap flex">
                            <div class="flex-1">
                                <img src="./images/yogurt.png" alt="">
                            </div>
                            <div class="flex-1">
                                <h2>Freshmeal is a long established fact that a reader will be distracted</h2>
                                <p>Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a
                                    piece of
                                    classical Latin literature from 45 BC, making it over 2000 years old. Richard
                                    McClintock, a
                                    Latin professor at Hampden Sydney College in Virginia, The standard chunk of Lorem
                                    Ipsum used
                                    since the 1500s is reproduced below for those interested.</p>
                                <button class="btn btn-secondary">Read More</button>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="our-services">
                    <div class="container">
                        <h1 class="section-heading">Our services</h1>
                        <div class="card-wrapper flex">
                            <div class="service-card magic-shadow-sm">
                                <img class="icon" src="./icons/transport.svg" alt="">
                                <h2>Free Home delivery</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                <button class="btn btn-secondary">Read More</button>
                            </div>
                            <div class="service-card magic-shadow-sm">
                                <img class="icon" src="./icons/bag.svg" alt="">
                                <h2 class="text-primary">30 Days ReturnServices</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                <button class="btn btn-primary">Read More</button>
                            </div>
                            <div class="service-card magic-shadow-sm">
                                <img class="icon" src="./icons/usd.svg" alt="">
                                <h2>Money Back Guaranted</h2>
                                <p>Lorem Ipsum is simply dummy text of the printing and typesetting industry.</p>
                                <button class="btn btn-secondary">Read More</button>
                            </div>
                        </div>
                    </div>
                </section>
                <section class="big-deal">
                    <div class="container">
                        <h1 class="section-heading text-pure">Big Deals of the Week</h1>
                        <div class="timer">
                            <div>
                                <span>02</span>
                                <span>Days</span>
                            </div>
                            <div>
                                <span>24</span>
                                <span>Hours</span>
                            </div>
                            <div>
                                <span>55</span>
                                <span>Minutes</span>
                            </div>
                            <div>
                                <span>58</span>
                                <span>Seconds</span>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="latest-news">
                    <div class="container">
                        <h1 class="section-heading">Lastest News from Blog</h1>
                        <div class="article-wrapper">
                            <article class="card magic-shadow-sm">
                                <div>
                                    <img src="./images/coffee.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <div class="post-meta flex items-center justify-between">
                                        <span>July 03, 2017</span>
                                        <div>
                                            <span>Posted by <strong>FreshMeal</strong></span>
                                            <span class="comment-count">12 Comments</span>
                                        </div>
                                    </div>

                                    <h2>Lorem Ipsum is simply dummy text of the printing</h2>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content of a
                                        page when looking at its layout. The point of using Lorem Ipsum is that it has a
                                        more
                                        letters.</p>
                                </div>
                            </article>
                            <article class="card magic-shadow-sm">
                                <div>
                                    <img src="./images/donut.jpg" alt="">
                                </div>
                                <div class="card-content">
                                    <div class="post-meta flex items-center justify-between">
                                        <span>July 03, 2017</span>
                                        <div>
                                            <span>Posted by <strong>FreshMeal</strong></span>
                                            <span class="comment-count">12 Comments</span>
                                        </div>
                                    </div>

                                    <h2>Lorem Ipsum is simply dummy text of the printing</h2>
                                    <p>It is a long established fact that a reader will be distracted by the readable
                                        content of a
                                        page when looking at its layout. The point of using Lorem Ipsum is that it has a
                                        more
                                        letters.</p>
                                </div>
                            </article>
                        </div>
                        <div class="text-center btn-wrapper">
                            <button class="btn btn-secondary">View All</button>
                        </div>
                    </div>
                </section>

                <section class="subscribe">
                    <div class="container flex items-center">
                        <div>
                            <img src="./images/rasberry.png" alt="">
                        </div>
                        <div>
                            <h1>Subscribe to your newsletter</h1>
                            <p>Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many
                                web sites
                                still in their infancy.</p>
                            <div class="input-wrap">
                                <input type="email" placeholder="email@freshmeal.com">
                                <button>Subscribe</button>
                            </div>
                        </div>
                    </div>
                </section>

                <section class="contact-us flex">
                    <div class="contact-info-wrapper">
                        <h1 class="section-heading">Contact us</h1>
                        <div class="contact-info">
                            <div>
                                <div>
                                    <img src="./icons/phone-2.svg" alt="">
                                    <div>
                                        <span>Call us:</span>
                                        <span>(+84) 123 456 789</span>
                                    </div>
                                </div>
                                <div>
                                    <img src="./icons/bag-2.svg" alt="">
                                    <div>
                                        <span>E-mail ::</span>
                                        <span>support@freshmeal.com</span>
                                    </div>
                                </div>
                                <div>
                                    <img src="./icons/clock-2.svg" alt="">
                                    <div>
                                        <span>Working Hours:</span>
                                        <span>Mon - Sat (8.00am - 12.00am)</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="map">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d206253.45012861438!2d-115.31508258571672!3d36.124918453865035!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x80beb782a4f57dd1%3A0x3accd5e6d5b379a3!2sLas%20Vegas%2C%20NV%2C%20USA!5e0!3m2!1sen!2sru!4v1580850940897!5m2!1sen!2sru"
                            width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>
                </section>

                <footer>
                    <div class="container">
                        <div class="box">
                            <h3>About us</h3>
                            <p>It was popularised in the 1960 with the release of Latest sheets containing Lorem Ipsum
                                passage.</p>
                            <button class="btn btn-secondary">Read More</button>
                        </div>
                        <div class="box">
                            <h3>Quik Links</h3>
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
                                    <a href="#">Services</a>
                                </li>
                                <li>
                                    <a href="#">Gallery</a>
                                </li>
                                <li>
                                    <a href="#">Contact us</a>
                                </li>

                            </ul>
                        </div>
                        <div class="box">
                            <h3>Follow Us</h3>
                            <div>
                                <ul>
                                    <li>
                                        <a href="https://www.facebook.com/codersgyan">
                                            <img src="./icons/facebook.svg" alt="">
                                            <span>Facebook</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://twitter.com/CoderGyan">
                                            <img src="./icons/twitter.svg" alt="">
                                            <span>Twitter</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="#">
                                            <img src="./icons/google.svg" alt="">
                                            <span>Google +</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a href="https://www.instagram.com/codersgyan/">
                                            <img src="./icons/instagram.svg" alt="">
                                            <span>Instagram</span>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="box instagram-api">
                            <h3>Instagram</h3>
                            <div class="post-wrap">
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                                <div>
                                    <img src="./images/food-table.jpg" alt="">
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
                <footer class="copyright">
                    <div>
                        Copyright © 2020 .All rights reserved by <a href="https://www.instagram.com/codersgyan/">Coder's Gyan</a>.
                    </div>
                </footer> -->
           <!--  </div>
        </div> 
    </div> -->
    
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
</body>

    
    
</html>