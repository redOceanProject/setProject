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
<link href="css/style.css" rel="stylesheet">
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
								<a href="index.html"><img src="images/logo.png" alt=""
									title=""></a>
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
											<li><a href="mypage">마이페이지</a></li>
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
						<a href="index.html" class="img-responsive"><img
							src="images/logo-small.png" alt="" title=""></a>
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
										<li><a href="#">마이페이지</a></li>
										<li><a href="write">사연 올리기</a></li>
									</c:if>
								</ul>
							</div>
						</nav>
						<!-- Main Menu End-->
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
							<div class="form-portlet" style="text-align: center;">
								<h3>Written My story</h3>
							</div>

							<!--Form Portlet-->
							<div class="form-portlet">
								<div class="row clearfix">
									<div class="form-group col-xs-6 col-md-1">
										<a href="">전체 사연</a>
									</div>
									<div class="form-group col-xs-6 col-md-2" style="text-align: center;">
										<a href="">진행 중</a>
									</div>
									<div class="form-group col-xs-6 col-md-1">
										<a href="">완료</a>
									</div>
								</div>

								<!--Causes Section-->
								<section class="causes-section causes-grid-page">
									<!-- 사연 부분 -->
									<div class="auto-container">

										<div class="row clearfix">
											<!--Causes Block-->
											<!-- 사연1 -->
											<c:forEach var="boardList" items="${myList}">
												<div class="causes-block col-md-4 col-sm-6 col-xs-12">
													<div class="inner-box">
														<div class="image">
															<a href="boardDetail?boardnum=${boardList.boardnum}"><img
																src="download?boardnum=${boardList.boardnum}" /></a>
															<!-- 이미지 -->
														</div>
														<div class="lower-box">
															<div class="content">
																<h3>
																	<a href="boardDetail?boardnum=${boardList.boardnum}">${boardList.title}</a>
																</h3>
																<!--제목-->
																<div class="text">${boardList.content}</div>
																<!--내용 미리보기-->
																<div class="donate-bar wow fadeIn" data-wow-delay="0ms"
																	data-wow-duration="0ms">
																	<div class="bar-inner">
																		<!--프로그래스 바-->
																		<div class="bar"
																			style="width:<fmt:formatNumber value="${(boardList.blood_present)/(boardList.goal_blood)*100}" pattern="0"/>%;">
																			<div class="count-box">
																				<span class="count-text" data-speed="2000"
																					data-stop="<fmt:formatNumber value="${(boardList.blood_present)/(boardList.goal_blood)*100}" pattern="0"/>"></span>%
																			</div>
																		</div>
																	</div>
																</div>
																<div class="causes-info">
																	<strong>헌혈증</strong> ${boardList.blood_present} / <span
																		class="theme_color">${boardList.goal_blood}</span>
																	&nbsp;<strong>마감날짜 : </strong><span class="theme_color">
																		${boardList.goal_date}</span>
																</div>
															</div>
														</div>
													</div>
												</div>
											</c:forEach>
										</div>
									</div>
								</section>

							</div>
						</form>
					</div>

				</div>

			</div>
		</section>
		<!--End Donate Section-->



		<!--Main Footer-->
		<footer class="main-footer">
			<!-- <div class="auto-container">
            <div class="row clearfix">
            
    			ë¡ê³ + Quick Link
                big column
                <div class="big-column col-md-7 col-sm-12 col-xs-12">
                    <div class="row clearfix">
                    
                        Footer Column
                        <div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-widget logo-widget">
                                <div class="widget-content">
                                    <div class="logo-box">
                                        <a href="index.html"><img src="images/footer-logo.png" alt="" /></a>
                                    </div>
                                    <div class="text">Lorem ipsum dolor sit amet, vix an natu tur eleifend, mel amet laorit menandri. Ei item  justo complectitur duo. </div>
                                    <ul class="social-icon-two">
                                        <li><a href="#"><span class="fa fa-facebook"></span></a></li>
                                        <li><a href="#"><span class="fa fa-twitter"></span></a></li>
                                        <li><a href="#"><span class="fa fa-google-plus"></span></a></li>
                                        <li><a href="#"><span class="fa fa-pinterest-p"></span></a></li>
                                        <li><a href="#"><span class="fa fa-vimeo"></span></a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                        Footer Column / Links Widget
                        <div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-widget links-widget">
                                <h2>Quick Links</h2>
                                <div class="widget-content">
                                	<div class="row clearfix">
                                        <ul class="list col-md-7 col-sm-6 col-xs-12">
                                            <li><a href="#">About us </a></li>
                                            <li><a href="#">Recent projects</a></li>
                                            <li><a href="#">Our Mission</a></li>
                                            <li><a href="#">FAQâs</a></li>
                                            <li><a href="#">Privacy & plicy</a></li>
                                        </ul>
                                        <ul class="list col-md-5 col-sm-6 col-xs-12">
                                            <li><a href="#">Help center</a></li>
                                            <li><a href="#">Android App</a></li>
                                            <li><a href="#">Internships</a></li>
                                            <li><a href="#">Press</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                Photo Gallery + Our Address
                big column
                <div class="big-column col-md-5 col-sm-12 col-xs-12">
                    <div class="row clearfix">
                    	
                        Footer Column
                        <div class="footer-column col-lg-6 col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-widget gallery-widget">
                                <h2>Photo Gallery</h2>
                                <div class="widget-content">
                                    <div class="images-outer clearfix">
                                        Image Box
                                        <figure class="image-box"><a href="images/resource/blog-3.jpg" class="lightbox-image" title="Image Title Here" data-fancybox-group="footer-gallery"><img src="images/gallery/footer-gallery-thumb-1.jpg" alt=""></a></figure>
                                        Image Box
                                        <figure class="image-box"><a href="images/resource/causes-10.jpg" class="lightbox-image" title="Image Title Here" data-fancybox-group="footer-gallery"><img src="images/gallery/footer-gallery-thumb-2.jpg" alt=""></a></figure>
                                        Image Box
                                        <figure class="image-box"><a href="images/resource/causes-11.jpg" class="lightbox-image" title="Image Title Here" data-fancybox-group="footer-gallery"><img src="images/gallery/footer-gallery-thumb-3.jpg" alt=""></a></figure>
                                        Image Box
                                        <figure class="image-box"><a href="images/resource/causes-7.jpg" class="lightbox-image" title="Image Title Here" data-fancybox-group="footer-gallery"><img src="images/gallery/footer-gallery-thumb-4.jpg" alt=""></a></figure>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        Footer Column
                        <div class="footer-column col-md-6 col-sm-6 col-xs-12">
                            <div class="footer-widget address-widget">
                                <h2>Our Address</h2>
                                <div class="widget-content">
                                    <ul class="list-style-one">
                                        <li><span class="icon flaticon-location-pin"></span>60 Grant Ave. Central New Road 0708, UK</li>
                                        <li><span class="icon flaticon-technology-1"></span>+880 1723 801 729</li>
                                        <li><span class="icon flaticon-e-mail-envelope"></span>Huminityus@gmail.com</li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        
                    </div>
                </div>
                
            </div>
        </div> -->
			<!--Footer Bottom-->
			<div class="footer-bottom">
				<div class="auto-container">
					<div class="row clearfix">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="copyright">
								All Right Researved <a href="#">RedOceans</a> &copy; 2017
							</div>
						</div>
						<!-- <div class="col-md-6 col-sm-6 col-xs-12">
                    	<ul class="footer-nav">
                        	<li><a href="#">Home</a></li>
                            <li><a href="#">Contact Us</a></li>
                            <li><a href="#">FAQ's</a></li>
                        </ul>
                    </div> -->
					</div>
				</div>
			</div>

		</footer>

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