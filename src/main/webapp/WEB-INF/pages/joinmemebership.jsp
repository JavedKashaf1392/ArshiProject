<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>

<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE HTML>
<html lang="en" dir="ltr">
<head>

<title>VeggieFridge</title>

<meta charset="utf-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.1/jquery.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home screen of VeggieFridge</title>
<script>
	document.getElementsByTagName("html")[0].className += " js";
</script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
	<!-- <link rel="icon" type="image/x-icon" href="favicon.png"> -->
    <style>
    .galleryContainer{
    width: 100%;
    height: 500px;
    max-width: 2000px;
    margin: auto;
    user-select: none;
    box-shadow: 0px 0px 3px 1px #00000078;
    padding: 10px;
    box-sizing: border-box;
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
.galleryContainer .slideShowContainer .rightArrow{
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
</style>    
</head>

<body>
<div class="galleryContainer">
    <div class="slideShowContainer">
        <div id="playPause" onclick="playPauseSlides()"></div>
        <div onclick="plusSlides(-1)" class="nextPrevBtn leftArrow"><span class="arrow arrowLeft"></span></div>
        <div onclick="plusSlides(1)" class="nextPrevBtn rightArrow"><span class="arrow arrowRight"></span></div>
        <div class="captionTextHolder"><p class="captionText slideTextFromTop"></p></div>
        <div class="imageHolder">
     <spring:url value="/images" var="images" />
	<img src="${images}/img_1.jpg"/>1366X768
            <p class="captionText">Caption Text-01</p>
        </div>
        <div class="imageHolder">
            <spring:url value="/images" var="images" />
	<img src="${images}/img_2.jpg" />
            <p class="captionText">Caption Text-02</p>
        </div>
        <div class="imageHolder">
            <spring:url value="/images" var="images" />
	<img src="${images}/img_3.jpg" />
            <p class="captionText">Caption Text-03</p>
        </div>
        <div class="imageHolder">
           <spring:url value="/images" var="images" />
	<img src="${images}/img_4.jpg" />
            <p class="captionText">Caption Text-04</p>
        </div>
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
</body>
</html>