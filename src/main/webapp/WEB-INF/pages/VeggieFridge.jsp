<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
	
<!DOCTYPE html>
<html>
<head>
<link rel = "icon" href = "images/VeggieFridge.ico" type = "image/x-icon">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<title>VeggieFridge</title> 
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
/* <style>  */

:root{  
    --white-light: rgba(255, 255, 255, 0.5);
    --alice-blue: #f8f9fa;
  /*   --carribean-green: #40c9a2; */
    --carribean-green:green;
    --gray: #ededed;
}

*{
   /*  padding: 0;
    margin: 0; */
    box-sizing: border-box;
}
body{
    font-family: 'Quicksand', sans-serif;
}

/* Utility stylings */
img{
    /* width: 100%; */
   /*  width:35%;  */
    display: block;
}
.container{
   max-width: 1388px;
   /*  width: 88vw; */
    margin: 0 auto;
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
.flex{
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
    .flex{
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
 </style>
 </head>
	<body>
	                   
 <c:if test="${not empty message}">
<div class="alert">
  <span class="closebtn">&times;</span>  
  <strong></strong>${message}
</div>
	    <%-- <h3 class="text-center">${message}</h3> --%>
</c:if>
	    <%-- <h3 class="text-center">${message}</h3> --%>

	<jsp:include page="userheader.jsp" />
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

<!-- Products   -->
	 <div class = "products">
            <div class = "container">
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

            <div class = "product-collection">
            <div class = "container">
            <h1 class = "show-ad-title">Shop By Catogary</h1>
            <div class = "product-collection-wrapper">
                    <!-- product col left -->
                    <div class = "product-col-left flex">
                        <div class = "product-col-content">
                            <h2 class = "sm-title">Fresh Milk </h2>
                            <h2 class = "md-title">Fresh Milk </h2>
                            <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                            <button type = "button" class = "btn-dark">Shop now</button>
                        </div>
                    </div>

                    <!-- product col right -->
                    <div class = "product-col-right">
                        <div class = "product-col-r-top flex">
                            <div class = "product-col-content">
                                <h2 class = "sm-title">Fruit Vegetables </h2>
                                <h2 class = "md-title">Fruit Vegetables </h2>
                                <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                                <button type = "button" class = "btn-dark">Shop now</button>
                            </div>
                        </div>

                        <div class = "product-col-r-bottom">
                            <!-- left -->
                            <div class = "flex">
                                <div class = "product-col-content">
                                    <h2 class = "sm-title">OFFERS </h2>
                                    <h2 class = "md-title">Leafy Vegetables </h2>
                                    <p class = "text-light">Lorem ipsum dolor sit, amet consectetur adipisicing elit. Molestiae consequatur facilis eligendi quibusdam voluptatibus exercitationem autem voluptatum, beatae architecto odit, quisquam repellat. Deleniti, architecto ab.</p>
                                    <button type = "button" class = "btn-dark">Shop now</button>
                                </div>
                            </div>
                            <!-- right -->
                            <div class = "flex">
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
        
       <%--  <div style="width:1388px;margin: 0 auto;margin-bottom:10px;">
  <table>
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/prod1.jpg"
							width="350" height="300" />
					</a></th>
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/prod2.jpg"
							width="340" height="300" />
					</a></th>
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/prod3.webp"
							width="340" height="300" />
					</a></th>
					<th><a href="abc.htm"> <spring:url value="/images"
								var="images" /> <img src="${images}/prod4.webp"
							width="350" height="300" />
					</a></th>
				</table>
  </div> --%>
       <!--  <div class="map">
                        <iframe
                            src="https://www.google.com/maps/place/MIHAN,+Nagpur,+Nagpur,+Maharashtra/@21.0782376,78.9862947,13z/data=!3m1!4b1!4m5!3m4!1s0x3bd4be284cdf7abd:0x60d4ced04aace457!8m2!3d21.0590381!4d79.0195161https://www.google.com/maps/place/MIHAN,+Nagpur,+Nagpur,+Maharashtra/@21.0782376,78.9862947,13z/data=!3m1!4b1!4m5!3m4!1s0x3bd4be284cdf7abd:0x60d4ced04aace457!8m2!3d21.0590381!4d79.0195161"
                            width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
                    </div>  -->
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
     function myFunction() {
         var input, filter, ul, li, a, i, txtValue;
         input = document.getElementById("myInput");
         filter = input.value.toUpperCase();
         ul = document.getElementById("myUL");
         li = ul.getElementsByTagName("li");
         for (i = 0; i < li.length; i++) {
             a = li[i].getElementsByTagName("a")[0];
             txtValue = a.textContent || a.innerText;
             if (txtValue.toUpperCase().indexOf(filter) > -1) {
                 li[i].style.display = "";
             } else {
                 li[i].style.display = "none";
             }
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
     
    

	</body>
</html>