<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<title>Huminity HTML Template | Donate</title>
<!-- Stylesheets -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style4.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--Add Theme Color File To Change Template Color Scheme / Color Scheme Files are Located in root/css/color-themes/ folder-->
<link href="css/color-themes/red-theme.css" rel="stylesheet">

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
</head>
<style>
.backimg {
    margin-top: 25px;
    font-size: 21px;
    text-align: center;


            animation: fadein 2s;
}

@keyframes fadein {
    from { opacity: 0; }
    to   { opacity: 1; }
}

</style>
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
							<div class="logo">
								<a href="index.html"><img src="images/cheer-logo.png" alt="" title=""></a>
							</div>
						</div>

						<div class="nav-outer clearfix">
							<!-- Main Menu -->
							<nav class="main-menu">
								<div class="navbar-header">
									<!-- Toggle Button -->
									<button type="button" class="navbar-toggle"
										data-toggle="collapse" data-target=".navbar-collapse">
										<span class="icon-bar"></span> <span class="icon-bar"></span>
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
											<li><a href="myPage">마이페이지</a></li>
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

		</header>
		<!--End Main Header -->


		<!--End Page Title-->

		<!--Donate Section-->
		<section class="donate-section">
			<div class="auto-container">
				<div class="donate-form-section">
					<div class="donation-form-outer">
						<!--Form Portlet-->
						<div class="form-portlet">
							<div class="row clearfix">
								<div id="wrapper1" style="padding: 35px; padding-left: 67px;">
									<div class="container">
										<div class="title1" style="text-align: center; width: 80%; padding-bottom: 20px;">
											<h2>나의 사연</h2>
										</div>
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="#all">전체사연</a></li>
											<li><a data-toggle="tab" href="#ing">진행중</a></li>
											<li><a data-toggle="tab" href="#complete">완료</a></li>
										</ul>

										<div class="tab-content">
											<!-- 전체사연 -->
											<div id="all" class="tab-pane fade in active">
												<div class="bcSector" style="padding-top: 30px;">
													<c:forEach var="myList" items="${myList}">
            											<div class="causes-block col-md-6 col-sm-4 col-xs-4">
                											<div class="inner-box">
                    											<div class="image">
																	<a href="boardDetail?boardnum=${myList.boardnum}"><img src="download?boardnum=${myList.boardnum}"/></a><!-- 이미지 -->
																	
																	<c:if test="${myList.blood_present == myList.goal_blood}">
																	<img class="backimg" src="images/complete.png" style="position:absolute; z-index:1; top: 20%; width: 70%; height: auto;"></img>
																	</c:if>
																	
                        										</div>
                        										<div class="lower-box">
                        											<div class="content">
                                										<h3><a href="boardDetail?boardnum=${myList.boardnum}">${myList.title}</a></h3> <!--제목-->
                                										<div class="text">${myList.content}...</div><!--내용 미리보기-->
                                										<div class="donate-bar wow fadeIn" data-wow-delay="0ms" data-wow-duration="0ms">
                                    										<div class="bar-inner"> <!--프로그래스 바-->
                                        										<div class="bar" style="width:<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>%;">
                                            										<div class="count-box"><span class="count-text" data-speed="2000" data-stop="<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>"></span>%</div>
                                        										</div>
                                    										</div>
                                										</div>
                                										<div class="causes-info"><strong>헌혈증</strong> ${myList.blood_present} / <span class="theme_color">${myList.goal_blood}</span>
                                											&nbsp;<strong>마감날짜 : </strong><span class="theme_color"> ${myList.goal_date}</span>
                                										</div>
                            										</div>
                        										</div>
                    										</div>
               											 </div>
                									</c:forEach>
												</div>
											</div><!-- end 전체사연 -->
											
											<!-- 진행중 -->
											<div id="ing" class="tab-pane fade">
												<div class="bcSector" style="padding-top: 30px;">
													<c:forEach var="myList" items="${myList}">
													<c:if test="${myList.blood_present != myList.goal_blood}">
            											<div class="causes-block col-md-6 col-sm-4 col-xs-4">
                											<div class="inner-box">
                    											<div class="image">
																	<a href="boardDetail?boardnum=${myList.boardnum}"><img src="download?boardnum=${myList.boardnum}"/></a><!-- 이미지 -->
                        										</div>
                        										<div class="lower-box">
                        											<div class="content">
                                										<h3><a href="boardDetail?boardnum=${myList.boardnum}">${myList.title}</a></h3> <!--제목-->
                                										<div class="text">${myList.content}</div><!--내용 미리보기-->
                                										<div class="donate-bar wow fadeIn" data-wow-delay="0ms" data-wow-duration="0ms">
                                    										<div class="bar-inner"> <!--프로그래스 바-->
                                        										<div class="bar" style="width:<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>%;">
                                            										<div class="count-box"><span class="count-text" data-speed="2000" data-stop="<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>"></span>%</div>
                                        										</div>
                                    										</div>
                                										</div>
                                										<div class="causes-info"><strong>헌혈증</strong> ${myList.blood_present} / <span class="theme_color">${myList.goal_blood}</span>
                                											&nbsp;<strong>마감날짜 : </strong><span class="theme_color"> ${myList.goal_date}</span>
                                										</div>
                            										</div>
                        										</div>
                    										</div>
               											</div>
               										</c:if>	 
                									</c:forEach>
												</div>
											</div><!-- end ing -->
											
											
											<!-- 완료 -->
											<div id="complete" class="tab-pane fade">
												<div class="bcSector" style="padding-top: 30px;">
													<c:forEach var="myList" items="${myList}">
													<c:if test="${myList.blood_present == myList.goal_blood}">
            											<div class="causes-block col-md-6 col-sm-4 col-xs-4">
                											<div class="inner-box">
                    											<div class="image">
																	<a href="boardDetail?boardnum=${myList.boardnum}"><img src="download?boardnum=${myList.boardnum}"/></a><!-- 이미지 -->
                        										 
                											    <img class="backimg" src="images/complete.png" style="position:absolute; z-index:1; top: 20%; width: 70%; height: auto;"></img>
                    											
                        										</div>
                        										<div class="lower-box">
                        											<div class="content">
                                										<h3><a href="boardDetail?boardnum=${myList.boardnum}">${myList.title}</a></h3> <!--제목-->
                                										<div class="text">${myList.content}</div><!--내용 미리보기-->
                                										<div class="donate-bar wow fadeIn" data-wow-delay="0ms" data-wow-duration="0ms">
                                    										<div class="bar-inner"> <!--프로그래스 바-->
                                        										<div class="bar" style="width:<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>%;">
                                            										<div class="count-box"><span class="count-text" data-speed="2000" data-stop="<fmt:formatNumber value="${(myList.blood_present)/(myList.goal_blood)*100}" pattern="0"/>"></span>%</div>
                                        										</div>
                                    										</div>
                                										</div>
                                										<div class="causes-info"><strong>헌혈증</strong> ${myList.blood_present} / <span class="theme_color">${myList.goal_blood}</span>
                                											&nbsp;<strong>마감날짜 : </strong><span class="theme_color"> ${myList.goal_date}</span>
                                										</div>
                            										</div>
                        										</div>
                    										</div>
               											</div>
               										</c:if>	
                									</c:forEach>
												</div>
											</div><!-- end 완료 -->
											
											
										</div><!-- end tab-content -->
									</div><!-- end container -->
								</div>
							</div>
						</div><!-- end form-portlet -->
					</div>
				</div>
			</div><!-- end auto-container -->
		</section>
		<!--End Donate Section-->




	</div>
	<!--End pagewrapper-->

	<!--Scroll to top-->
	<div class="scroll-to-top scroll-to-target" data-target=".main-header">
		<span class="icon fa fa-long-arrow-up"></span>
	</div>




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