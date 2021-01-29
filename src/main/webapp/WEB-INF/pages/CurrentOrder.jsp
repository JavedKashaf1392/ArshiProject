<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sidebar menu With Sub-menus | Using HTML, CSS & JQuery</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" charset="utf-8"></script>
     
      <style>
      @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  font-family: "Poppins", sans-serif;
}

body{
  /* min-height: 100vh; */
  /*background: url(file:///E:/VeggieFridge_/Sidebar%20Menu%20With%20Sub-Menus%20-%20Using%20HTML,%20CSS%20&%20JQuery/bg.jpg)no-repeat;*/
  background-size: cover;
  background-position: center;
  background: #f5f5f5;
}

.side-bar{
 /* background: rgba(255, 255, 255, 0.1);*/
  /* backdrop-filter: blur(15px); */
  width: 290px;
  height: 100vh;
  position:absolute;
  top: 0;
  left: -100%;
  overflow-y: auto;
  transition: 0.6s ease;
  transition-property: left;
  background-color: white;
  left: 0;
  margin-top:243px; 
  margin-left:17%;  
}

/*.side-bar.active{
  left: 0;
}*/

.side-bar .menu{
  width: 100%;
  margin-top: 80px;
}

.side-bar .menu .item{
  position: relative;
  cursor: pointer;
}

.side-bar .menu .item a{
 /* color: #fff;*/
  font-size: 16px;
  text-decoration: none;
  display: block;
  padding: 5px 30px;
  line-height: 60px;
   color:black;    
}

.side-bar .menu .item a:hover{
  /*background: #8621F8;*/
  transition: 0.3s ease;
 background:gray;    
}

.side-bar .menu .item i{
  margin-right: 15px;
}

.side-bar .menu .item a .dropdown{
  position: absolute;
  right: 0;
  margin: 20px;
  transition: 0.3s ease;
}

.side-bar .menu .item .sub-menu{
 /* background: rgba(255, 255, 255, 0.1);*/
  display: none;
  background-color: gainsboro;
}

.side-bar .menu .item .sub-menu a{
  padding-left: 80px;
}

.rotate{
  transform: rotate(90deg);
}

.close-btn{
  position: absolute;
  font-size: 20px;
  right: 0;
  margin: 25px;
  cursor: pointer;
  color: black;
}

.menu-btn{
  position: absolute;
  font-size: 20px;
  margin: 25px;
  cursor: pointer;
  color: black;
}

.main{
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 50px;
    
}

.main h1{
  color: rgba(255, 255, 255, 0.8);
  font-size: 60px;
  text-align: center;
  line-height: 80px;
}
        
@media (max-width: 900px){
  .main h1{
    font-size: 40px;
    line-height: 60px;
  }
}
.wrapper{
  max-width: 500px;
  width: 100%;
  /* background: #fff; */
  margin: 20px auto;
 /*  box-shadow: 1px 1px 2px rgba(0,0,0,0.125); */
  padding: 30px;
  background-color:white;
}

.wrapper .title{
  font-size: 24px;
  font-weight: 700;
  margin-bottom: 25px;
  color:green;
  text-transform: uppercase;
  text-align: center;
}

.wrapper .form{
  width: 100%;
}

.wrapper .form .inputfield{
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.wrapper .form .inputfield label{
   width: 200px;
   color: #757575;
   margin-right: 10px;
  font-size: 14px;
}

.wrapper .form .inputfield .input,
.wrapper .form .inputfield .textarea{
  width: 100%;
  outline: none;
  border: 1px solid #d5dbd9;
  font-size: 15px;
  padding: 8px 10px;
  border-radius: 3px;
  transition: all 0.3s ease;
}

.wrapper .form .inputfield .textarea{
  width: 100%;
  height: 125px;
  resize: none;
}

.wrapper .form .inputfield .custom_select{
  position: relative;
  width: 100%;
  height: 37px;
}

.wrapper .form .inputfield .custom_select:before{
  content: "";
  position: absolute;
  top: 12px;
  right: 10px;
  border: 8px solid;
  border-color: #d5dbd9 transparent transparent transparent;
  pointer-events: none;
}

.wrapper .form .inputfield .custom_select select{
  -webkit-appearance: none;
  -moz-appearance:   none;
  appearance:        none;
  outline: none;
  width: 100%;
  height: 100%;
  border: 0px;
  padding: 8px 10px;
  font-size: 15px;
  border: 1px solid #d5dbd9;
  border-radius: 3px;
}


.wrapper .form .inputfield .input:focus,
.wrapper .form .inputfield .textarea:focus,
.wrapper .form .inputfield .custom_select select:focus{
  border: 1px solid #fec107;
}

.wrapper .form .inputfield p{
   font-size: 14px;
   color: #757575;
}
.wrapper .form .inputfield .check{
  width: 15px;
  height: 15px;
  position: relative;
  display: block;
  cursor: pointer;
}
.wrapper .form .inputfield .check input[type="checkbox"]{
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}
.wrapper .form .inputfield .check .checkmark{
  width: 15px;
  height: 15px;
  border: 1px solid #fec107;
  display: block;
  position: relative;
}
.wrapper .form .inputfield .check .checkmark:before{
  content: "";
  position: absolute;
  top: 1px;
  left: 2px;
  width: 5px;
  height: 2px;
  border: 2px solid;
  border-color: transparent transparent #fff #fff;
  transform: rotate(-45deg);
  display: none;
}
.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark{
  background: #fec107;
}

.wrapper .form .inputfield .check input[type="checkbox"]:checked ~ .checkmark:before{
  display: block;
}

.wrapper .form .inputfield .btn{
  width: 100%;
   padding: 8px 10px;
  font-size: 15px; 
  border: 0px;
  background:  green;
  color: #fff;
  cursor: pointer;
  border-radius: 3px;
  outline: none;
}

.wrapper .form .inputfield .btn:hover{
  background:green;
}

.wrapper .form .inputfield:last-child{
  margin-bottom: 0;
}

@media (max-width:420px) {
  .wrapper .form .inputfield{
    flex-direction: column;
    align-items: flex-start;
  }
  .wrapper .form .inputfield label{
    margin-bottom: 5px;
  }
  .wrapper .form .inputfield.terms{
    flex-direction: row;
  }
}  

.cancelorder {
	display: inline-block;
	padding: 8px 10px;
	font-size: 12px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	outline: none;
	color: #fff;
	background-color: #DC143C;
	border: none;
	border-radius: 15px;
	box-shadow: 0 5px #999;
}

.cancelorder:hover {
	background-color: #B22222
}

.cancelorder:active {
	background-color: #3e8e41;
	box-shadow: 0 5px #666;
	transform: translateY(4px);
}
.row:after {
	content: "";
	display: table;
	clear: both;
}

.col-75 {
	width: 100%;
	margin-top: 11px;
	color: black;
}

input[type=text], select, textarea {
	width: 90%;
	padding: 8px;
	/* border: 1px solid #008000; */
	border:none;
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
	padding: 10px 14px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: center;
	margin-top: 10px;
}

input[type=submit]:hover {
	background-color: #45a049;
}        
          
</style>
   </head>
  <body>
  <jsp:include page="mainheader.jsp"></jsp:include>
   <!-- <div class="menu-btn">
    <i class="fas fa-bars"></i>
    </div>-->
    <div style="background-color:#f5f5f5;margin-top:10px;">
    <div class="side-bar">
     <!-- <div class="close-btn">
        <i class="fas fa-times"></i>
      </div>-->
      <div class="menu">
        <div class="item"><a href="#"><i class="fas fa-desktop"></i>My Cart</a></div>
        <div class="item">
          <a class="sub-btn"><i class="fas fa-table"></i>Orders<i class="fas fa-angle-right dropdown" style="background-color: gainsboro;border-radius:50%;;padding:10px 10px;"></i></a>
          <div class="sub-menu">
            <a href="#" class="sub-item">Current</a>
            <a href="#" class="sub-item">Delivered</a>
            <a href="#" class="sub-item">Cancel</a>
          </div>
        </div>
        <div class="item"><a href="#"><i class="fas fa-th"></i>Wallet</a></div>
        <div class="item">
          <a class="sub-btn"><i class="fas fa-cogs"></i>My Prfile<i class="fas fa-angle-right dropdown" style="background-color: gainsboro;border-radius:50%;;padding:10px 10px;"></i></a>
          <div class="sub-menu">
            <a href="#" class="sub-item">Change Password</a>
            <a href="#" class="sub-item">Edit Profile</a>
          </div>
        </div>
        <div class="item"><a href="#"><i class="fas fa-info-circle"></i>LogOut</a></div>
      </div>
    </div>
      
    <section class="main" style="margin-left:80px;">
    <!--  <h1>Sidebar Menu With<br>Sub-Menus</h1>-->
    <div class="center"
			style="margin-left:180px; padding: 1px 16px; height: 700px; background-color:white;">

			<h3>Pendings</h3>
			<hr>
			<input type="text" id="myInput" onkeyup="myFunction()"
				placeholder="Search for order.." title="Type in a name"
				style="background-image: url('/css/searchicon.png'); background-position: 10px 10px; background-repeat: no-repeat; width: 45%; font-size: 16px; padding: 10px 20px 12px 40px; border: 1px solid #ddd; margin-bottom: 5px; margin-left: 47%; margin-right: auto; margin-top: 5px;">

			<table id="myTable"
				style="margin-left: auto; margin-right: auto; text-align: center; border-collapse: collapse; width: 100%; border: 1px solid #ddd; font-size: 18px; align-content: center; background-color: white; margin-bottom: 50px; margin-top: %;">

				<tr class="header"
					style="border-bottom: 1px solid #ddd; text-align: center; border-bottom: 1px solid #ddd; text-align: center; background-color: #4CAF50">
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Id</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Date</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Order
						Status</th>
					<th
						style="width: %; color: white; text-align: center; padding: 12px;">Total
						Amount</th>
					<th></th>
				</tr>

				<c:forEach var="orders" items="${pendingOrders}">
					<tr style="border-bottom: 1px solid #ddd;">
						<td style="text-align: center; padding: 16px;"><a
							href="${pageContext.request.contextPath }/order/listOrderItems/${orders.orderid}"
							style="font-size: 100%; color: dodgerblue;">${orders.orderid}</a></td>
						<td style="text-align: center; padding: 16px;">${orders.orderDate}</td>
						<td style="text-align: center; padding: 16px;">${orders.pickupStatus}</td>
						<!-- <i class="fa fa-check-circle" style="color:green"></i> -->
						<td style="text-align: center; padding: 16px;">${orders.orderTotal}</td>
						<td><a href="${pageContext.request.contextPath }/order/cancelOrder/${orders.orderid}"
							style="display: inline-block; padding: 8px 16px; text-align: center; text-decoration: none; color: #ffffff; background-color: #4CAF50; border-radius: 6px; outline: none; margin-top: 6px; font-size: 15px;"
						onclick="return confirm('Are you sure to cancel order?')">cancel</a>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
    </section>
   
  <div style="margin-top:300px">
 <jsp:include page="footer.jsp"></jsp:include>
   </div>
    </div>
    
      

    <script type="text/javascript">
    $(document).ready(function(){
      //jquery for toggle sub menus
      $('.sub-btn').click(function(){
        $(this).next('.sub-menu').slideToggle();
        $(this).find('.dropdown').toggleClass('rotate');
      });

     /* //jquery for expand and collapse the sidebar
      $('.menu-btn').click(function(){
        $('.side-bar').addClass('active');
        $('.menu-btn').css("visibility", "hidden");
      });

      $('.close-btn').click(function(){
        $('.side-bar').removeClass('active');
        $('.menu-btn').css("visibility", "visible");
      });*/
    });
    </script>

  </body>
</html>
