<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>Title</title>
  <!--   <link rel="stylesheet" th:href="@{/style.css}"/> -->
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css"/>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<style>
.register{
    background: -webkit-linear-gradient(left, #3931af, #00c6ff);
    margin-top: 3%;
    padding: 3%;
}
.register-left{
    text-align: center;
    color: #fff;
    margin-top: 4%;
}
.register-left input{
    border: none;
    border-radius: 1.5rem;
    padding: 2%;
    width: 60%;
    background: #f8f9fa;
    font-weight: bold;
    color: #383d41;
    margin-top: 30%;
    margin-bottom: 3%;
    cursor: pointer;
}
.register-right{
    background: #f8f9fa;
    border-top-left-radius: 10% 50%;
    border-bottom-left-radius: 10% 50%;
}
.register-left img{
    margin-top: 15%;
    margin-bottom: 5%;
    width: 25%;
    -webkit-animation: mover 2s infinite  alternate;
    animation: mover 1s infinite  alternate;
}
@-webkit-keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
@keyframes mover {
    0% { transform: translateY(0); }
    100% { transform: translateY(-20px); }
}
.register-left p{
    font-weight: lighter;
    padding: 12%;
    margin-top: -9%;
}
.register .register-form{
    padding: 10%;
    margin-top: 10%;
}
.btnRegister {
    border: none;
    border-radius: 1.5rem;
    background: #0062cc;
    color: #fff;
    font-weight: 600;
    width: 55%;
    cursor: pointer;
    padding: 1%;
    font-size: xx-large;
 /*   margin-top: 3px;*/
 margin:auto;
  display:block
}
.register .nav-tabs{
    margin-top: 3%;
    border: none;
    background: #0062cc;
    border-radius: 1.5rem;
    width: 28%;
    float: right;
}
.register .nav-tabs .nav-link{
    padding: 2%;
    height: 34px;
    font-weight: 600;
    color: #fff;
    border-top-right-radius: 1.5rem;
    border-bottom-right-radius: 1.5rem;
}
.register .nav-tabs .nav-link:hover{
    border: none;
}
.register .nav-tabs .nav-link.active{
    width: 100px;
    color: #0062cc;
    border: 2px solid #0062cc;
    border-top-left-radius: 1.5rem;
    border-bottom-left-radius: 1.5rem;
}

.register-heading {
    /* text-align: center; */
    /* margin-top: 8%; */
    margin-bottom: -15%;
    color: #495057;
    float: left;
    /* margin-left: 0px; */
    padding-left: 75px;
}
</style>

<%-- "${pageContext.request.contextPath}/payment/pgredirect" --%>
<body>
<form method="post" action="${pageContext.request.contextPath}/payment/pgredirect">
    <div class="container register">
        <div class="row">
            <div class="col-md-3 register-left">
                <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                <h3>Welcome</h3>
                <p>Get paid instantly with Paytm Payment !</p>
            </div>
            <div class="col-md-9 register-right">
                <div class="tab-content" id="myTabContent">
                    <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                        <h3 class="register-heading">Welcome to Paytm Payment</h3>
                        <div class="row register-form">
                            <div class="col-md-10">
                                <div class="form-group">
                                    <input id="ORDER_ID" tabindex="1" maxlength="20" size="20"
                                           name="ORDER_ID" autocomplete="off" class="form-control" >
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Customer ID" value=""
                                           name="CUST_ID"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="INDUSTRY_TYPE_ID" value=""
                                           name="INDUSTRY_TYPE_ID"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Channel" value=""
                                           name="CHANNEL_ID"/>
                                </div>
                                <div class="form-group">
                                    <input type="text" class="form-control" placeholder="Amount" value=""
                                           name="TXN_AMOUNT"/>
                                </div>
                                <!--  <input type="submit" class="btnRegister"  value="Pay with Paytm"/>   -->
                                <button type="submit" class="btnRegister" style="align : center">Pay with Paytm</button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>
</form>
</body>
</html>