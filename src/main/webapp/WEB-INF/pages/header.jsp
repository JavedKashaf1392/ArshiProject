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

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
        <script type="text/javascript">
        $(document).ready(function(){
            $('#prodId').on('change', function() {
                this.form.submit();
            });
        });
        </script>

<title>VeggieFridge</title> 
<meta charset="utf-8">

<style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;600&display=swap');

*{
	list-style: none;
	font-family: 'Montserrat', sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
} 
/* colors */

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
/* Reset  */

*{
    padding:0;
    margin:0;
    box-sizing: border-box;
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
       /*  position: fixed; */   
      background:#4CAF50;
     /*  background:var(--secondary); */
      color:var(--pure);
      /* font-family:"Raleway-semibold"; */
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
     /*  margin-top:40px;  */
  }
  nav .top .contact h5,  nav .top .time h5{
      /* font-family:"Raleway-black"; */
      margin-bottom:0.25rem;
  }
  nav .top .contact h6, nav .top .time h6{
    /* font-family:"Raleway-medium"; */
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
    /* font-family:"Raleway-semibold"; */
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
    font-family: 'Montserrat', sans-serif;
}
.magic-shadow:after{
    content:'';
    display:block;
    width:100%;
    height:69px;
    /* background-image:url(../images/shadow.svg); */
   /*  background-image:url("images/shadow.svg"); */
    background-repeat: no-repeat;
    background-position: center;
    position: absolute;
    bottom:-22px;
    z-index:-1;
    box-shadow: 0px 0px 3px 1px #00000078;
    font-family: Montserrat;font-weight:300px;" 
    
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
   /*  background-image:url("/images/shadow-sm.svg"); */
   /*  background-repeat: no-repeat; */
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
    box-shadow: 0px 0px 3px 1px #00000078;
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
    /* font-family:"Raleway-bold"; */
    color:var(--secondary);
    margin-right:0.75rem;

}
header.hero h1{
   /*  font-family:"Raleway-extrabold"; */
    color:var(--secondary);
    font-size: 2.5rem;
    margin-bottom:0.75rem;
}
header.hero h1 span{
    color:var(--primary);
}
header.hero p{
    /* font-family: "Raleway-medium"; */
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
       /* margin-top:11px;  */
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

.dropdown:hover .dropbtn {background-color: ;
    border-bottom: 3px solid white;}
 

/* ........Profile Menu css Close........... */
</style>


</head>
<!-- ***************Body Code***************** -->

<body>

<!-- ......... HeadSection........ -->
 <div class="main-wrapper">

            <div class="nav-background">
            <div class="mobile-logo">
   <spring:url value="/images" var="images" />
   <img src="${images}/VeggieFridge.ico"  width="150" height="100" alt=""/>
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
                      <h5>Call Us: (+91) 982 357 6042  </h5>
                      <h6>E-mail : support@veggiefridge.com</h6>
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
    <a href="#" class="dropbtn">Hello, ${customerModel.firstName}</a>
    
   <div class="dropdown-content" style="color: black;">
   
   <c:forEach var="menu" items="${requestScope.listprofileMenu}">
   <a style="color: black;" href="${pageContext.request.contextPath }/${menu.url}"> <spring:url value="/images" var="images" />
   <img src="${images}/${menu.imageName}"  width="15" height="15" alt=""/>${menu.menues}</a> 
  
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
                           <a href="${pageContext.request.contextPath}/cart/listCustomerCartItem">${customerModel.cartpage.cartitem} Items - (${repee_sign}<fmt:formatNumber type="number" minFractionDigits="2" maxFractionDigits="2" value="${customerModel.cartpage.grandTotal}"/>)</a>
                           </div>
                           </security:authorize>
                           
                            <security:authorize access="isAnonymous()">
                           <div>
                           <spring:url value="/images" var="images" />
                           <img src="${images}/cart.svg"  width="15" height="15" alt=""/>
                           <!--  <img src="./icons/cart.svg" alt=""> -->
                           <a href="#">0 Items - (${repee_sign}0.00)</a>
                           </div>
                           </security:authorize>
                        </div>
                    </div>
                </header>
                <nav>                    
                <div class="top">
                        <div class="container flex justify-between">
                           <div class="contact flex items-center">
                       
                               <div>
                                <table>
					<%-- <th><a href="abc.htm"> <spring:url value="/images" var="images" />
   <img src="${images}/vf-leaf.png"  width="90" height="75" alt=""/>
					</a></th> --%>
					<th><a href="abc.htm">  <spring:url value="/images" var="images" />
   <img src="${images}/logo2.jpg"  width="200" height="50" alt=""/>
					</a></th>
				</table>

   
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
                    <security:authorize access="isAnonymous() or hasRole('USER')">
                    
                    <div class="navbar magic-shadow" style="font-family: Montserrat;font-weight:300px;">
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

    <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.0.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
   
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