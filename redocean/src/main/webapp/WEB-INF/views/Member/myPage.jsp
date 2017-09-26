<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<title>Huminity HTML Template | Donate</title>
<!-- Stylesheets -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--Add Theme Color File To Change Template Color Scheme / Color Scheme Files are Located in root/css/color-themes/ folder-->
<link href="css/color-themes/red-theme.css" rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
</head>

<body>
<div class="page-wrapper">
 	
    <!-- Preloader -->
		<div class="preloader"></div>

		<!-- Main Header-->
		<header class="main-header header-type-one">

    	<!--Header-Upper-->
        <div class="header-upper">
        	<div class="auto-container">
            	<div class="clearfix">
                	
                	<div class="pull-left logo-outer">
                    	<div class="logo"><a href="index.html"><img src="images/logo.png" alt="" title=""></a></div>
                    </div>
                    
                    <div class="nav-outer clearfix">
                        <!-- Main Menu -->
                        <nav class="main-menu">
                        	 <div class="navbar-header">
                                <!-- Toggle Button -->    	
                                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                    <span class="icon-bar"></span>
                                </button>
                            </div>
                            <div class="navbar-collapse collapse clearfix">
                                <ul class="navigation clearfix">
                                	<c:if test="${email == null}">
                                    	<li><a href="login">로그인</a></li>
                                	</c:if>
                                	<c:if test="${email != null}">
                                		<li><a href="logout">${name}..로그아웃</a></li>
                                		<li><a href="barcode">헌혈증 등록</a></li>
                                    	<li><a href="write">사연 올리기</a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </nav>
                	</div>
                </div>
            </div>
        </div>
        <!--End Header Upper-->

			 <!--Sticky Header-->
        <div class="sticky-header">
        	<div class="auto-container clearfix">
            	<!--Logo-->
            	<div class="logo pull-left">
                	<a href="index.html" class="img-responsive"><img src="images/logo-small.png" alt="" title=""></a>
                </div>
                
                <!--Right Col-->
                <div class="right-col pull-right">
                	<!-- Main Menu -->
                    <nav class="main-menu">
                        
                        <div class="navbar-collapse collapse clearfix">
							<ul class="navigation clearfix">
                               <c:if test="${email == null}">
                                    <li><a href="login">로그인</a></li>
                                </c:if>
                                <c:if test="${email != null}">
                                	<li><a href="logout">${name}..로그아웃</a></li>
                                	<li><a href="barcode">헌혈증 등록</a></li>
                                   	<li><a href="write">사연 올리기</a></li>
                                </c:if>
                            </ul>
                        </div>
                    </nav><!-- Main Menu End-->
                </div>
                
            </div>
        </div>
        <!--End Sticky Header-->

		</header>
		<!--End Main Header -->
    
    
    <!--End Page Title-->
    
    <!--Donate Section-->
    <section class="donate-section">
    	<div class="auto-container">
        	
            
            <div class="donate-form-section">
            	
                <div class="donation-form-outer">
            	<form method="post" action="contact.html">
                	
                    <!--Form Portlet-->
                    <div class="form-portlet" style="text-align : center; padding-bottom:5px; border-bottom: 1px solid #eee" >
                    	<h3>MyPage</h3>
                    </div>
                    
                    <!--Form Portlet-->
                    <div class="form-portlet" style="color:black;">
                        <div class="row clearfix">
                            <div class="row" style="padding-top:60px;">
	                            
                            <div class="row">
	                            <div class="form-group col-md-6 ">
	                            	<!-- <div class="field-label">My BloodCard <span class="required">*</span></div> -->
	                            	<div class="field-label"><a href="showMYbdlist">내 헌혈증</a></div>
	                            </div>
                            </div>
                            <div class="row">
	                            <div class="form-group col-md-6">
	                            	<div class="field-label"><a href="myDonation">기부 현황</a></div>
	                            </div>
                            </div>
                            <div class="row">
	                            <div class="form-group col-md-6">
	                            	<div class="field-label"><a href="myStory">나의 사연</a></div>
	                            </div>
                            </div>
	                        <div class="row">    
	                            <div class="form-group col-md-6">
	                            	<div class="field-label"><a href="unRegistered">회원탈퇴</a></div>
	                            </div>
                            </div>
                        </div>
                    </div>
                   </div>
                </form>
            </div>
                
            </div>
            
        </div>
    </section>
    <!--End Donate Section-->
    
    
    
    
</div>
<!--End pagewrapper-->





<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/owl.js"></script>
<script src="js/appear.js"></script>
<script src="js/wow.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/script.js"></script>

</body>
</html>