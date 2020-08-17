<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
    <%@ taglib  uri="http://www.springframework.org/tags" prefix="spring"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.12.1/css/all.min.css">
   
   <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com    @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title> edit profile page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
    <style type="text/css">
    	body{
    margin-top:20px;
    background:#f8f8f8
}
</style>
</head>
<body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
<div class="row flex-lg-nowrap">
  <div class="col-12 col-lg-auto mb-3" style="width: 200px;">
    <div class="card p-3">
      <div class="e-navlist e-navlist--active-bg">
        <ul class="nav">
          <li class="nav-item"><a class="nav-link px-2 active" href="./overview.html"><i class='fas fa-wallet' style="color:green;"></i> <span style="color:#4CAF50;">Wallet</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${pageContext.request.contextPath }/home/myCart"><i class="fa fa-shopping-cart" style="color:green;"> </i> <span style="color:#4CAF50;">MyCart</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="./settings.html"><i class='fas fa-user-friends' style="color:green;"></i> <span style="color:#4CAF50;">Membership</span></a></li>
          <li class="nav-item"><a class="nav-link px-2" href="${pageContext.request.contextPath }/home/editProfile"><i class="fa fa-edit" style="color:green;"> </i> <span style="color:#4CAF50;">EditProfile</span></a></li>
        </ul>
      </div>
    </div>
  </div>

  <div class="col">
    <div class="row">
      <div class="col mb-3">
        <div class="card">
          <div class="card-body">
            <div class="e-profile">
              <div class="row">
                <div class="col-12 col-sm-auto mb-3">
                  <div class="mx-auto" style="width: 140px;">
                    <!-- <div class="d-flex justify-content-center align-items-center rounded" style="height: 140px; background-color: rgb(233, 236, 239);">
                      <span style="color: rgb(166, 168, 170); font: bold 8pt Arial;">140x140</span>
                    </div> -->
    <spring:url value="/images" var="images" />
    <img src="${images}/logo.jpg" width="150" height="115" style= margin-top:2%;"/>
                  
                  
                </div>
                </div>
                <div class="col d-flex flex-column flex-sm-row justify-content-between mb-3">
                  <div class="text-center text-sm-left mb-2 mb-sm-0">
                    <h4 class="pt-sm-2 pb-1 mb-0 text-nowrap" style="color:green;font-size:30px;">Arshi Qureshi</h4>
                    <p class="mb-0">Arshi@gmail.com</p>
                    <div class="text-muted"><small>Last login 2 hours ago</small></div>
                    <div class="mt-2">
                      <!-- <button class="btn btn-primary" type="button" style="color:#4CAF50;">
                        <i class="fa fa-fw fa-camera"></i>
                        <span style="background-color: green;">Change Photo</span>
                      </button> -->
                    </div>
                  </div>
                  <div class="text-center text-sm-right">
                    <span class="badge badge-secondary"style="background-color:green;">administrator</span>
                    <div class="text-muted"><small>Joined 09 Dec 2017</small></div>
                  </div>
                </div>
              </div>
              <ul class="nav nav-tabs">
                <li class="nav-item"><a href="" class="active nav-link">Settings</a></li>
              </ul>
              <div class="tab-content pt-3">
                <div class="tab-pane active">
                  <form class="form" novalidate="">
                    <div class="row">
                      <div class="col">
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label style="color:green;">First Name</label>
                              <input class="form-control" type="text" name="name" placeholder="John " value="John Smith">
                            </div>
                          </div>
                          <div class="col">
                            <div class="form-group">
                              <label style="color:green;">Last Name</label>
                              <input class="form-control" type="text" name="username" placeholder="smith" value="johnny.s">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label style="color:green;">Email</label>
                              <input class="form-control" type="text" placeholder="user@example.com">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col mb-3">
                            <div class="form-group">
                             <label style="color:green;">Mobile Nm</label>
                              <input class="form-control" type="text" placeholder="1234567890">
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-12 col-sm-6 mb-3">
                        <div class="mb-2"><b style="color:green;">Change Password</b></div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label style="color: green;">Current Password</label>
                              <input class="form-control" type="password" placeholder="••••••">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label style="color: green;">New Password</label>
                              <input class="form-control" type="password" placeholder="••••••">
                            </div>
                          </div>
                        </div>
                        <div class="row">
                          <div class="col">
                            <div class="form-group">
                              <label style="color: green;">Confirm <span class="d-none d-xl-inline" style="color:green;">Password</span></label>
                              <input class="form-control" type="password" placeholder="••••••"></div>
                          </div>
                        </div>
                      </div>
                      <div class="col-12 col-sm-5 offset-sm-1 mb-3">
                      <div class="mb-2"><b style="color:green;">Keeping in Touch</b></div>
                      <div class="row">
                            <div class="col">
                            <label>Email Notifications</label>
                            <div class="custom-controls-stacked px-2">
                              <div class="custom-control custom-checkbox" >
                                <input type="checkbox" class="custom-control-input" id="notifications-blog" checked="">
                                <label class="custom-control-label" for="notifications-blog">Blog posts</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="notifications-news" checked="">
                                <label class="custom-control-label" for="notifications-news">Newsletter</label>
                              </div>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" id="notifications-offers" checked="" style="">
                                <label class="custom-control-label" for="notifications-offers">Personal Offers</label>
                              </div>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
        <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 10px 50px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Save Changes</a>
        </div>
                    </div>
                  </form>

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="col-12 col-md-3 mb-3">
        <div class="card mb-3">
          <div class="card-body">
            <div class="px-xl-3">
                <!-- <button class="btn btn-block btn-secondary"> -->
              <!--   <i class="fa fa-sign-out"></i> -->
                <a href="${pageContext.request.contextPath}/login/logout" style="display: inline-block;
        padding: 8px 40px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;">Log Out</a>
                <!-- <span>Logout</span> -->
               <!--  </button> -->
            </div>
          </div>
        </div>
        
        <div class="card">
          <div class="card-body">
            <h6 class="card-title font-weight-bold">Support</h6>
            <p class="card-text">Get fast, free help from our friendly assistants.</p>
             <a href="${pageContext.request.contextPath}/cart/registerdhome" style="display: inline-block;
        padding: 8px 30px;
        text-align: center;
        text-decoration: none;
        color: #ffffff;
        background-color: #4CAF50;
        border-radius: 6px;
        outline: none;margin-top:6px">Contact Us</a>
        </div>
          </div>
        </div>
      </div>
    </div>

  </div>
</div>
</div>
<script src="http://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
</script>
</body>
</html>

