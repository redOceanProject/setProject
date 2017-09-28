<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Huminity HTML Template | Home Style One</title>
<!-- Stylesheets -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/revolution-slider.css" rel="stylesheet">
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

			<!--Sticky Header-->
			<div class="sticky-header">
				<div class="auto-container clearfix">
					<!--Logo-->
					<div class="logo pull-left">
						<a href="index.html" class="img-responsive"><img src="images/cheer-logo.png" alt="" title=""></a>
					</div>

					<!--Right Col-->
					<div class="right-col pull-right">
						<!-- Main Menu -->
						<nav class="main-menu">

							<div class="navbar-collapse collapse clearfix">
								<ul class="navigation clearfix">
									<c:if test="${email == null}">
										<li><a href="login" style="top: 15px;">로그인</a></li>
									</c:if>
									<c:if test="${email != null}">
										<li><a href="logout" style="top: 15px;">${name}..로그아웃</a></li>
										<li><a href="myPage" style="top: 15px;">마이페이지</a></li>
										<li><a href="write" style="top: 15px;">사연 올리기</a></li>
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

		<!--Main Slider-->
		<section class="main-slider" data-start-height="700" data-slide-overlay="yes">
			<div class="tp-banner-container">
				<div class="tp-banner">
					<div class="overlay-slide">
						<iframe width="100%" height="100%" src="https://www.youtube.com/embed/X8QyN-ndnUc?rel=0&autoplay=1&showinfo=0&controls=0;playlist=X8QyN-ndnUc"></iframe>
					</div>
				</div>
			</div>
		</section>
		<!--End Main Slider-->
<!--Causes Section-->
		<section class="causes-section dark-bg">
			<div class="auto-container">

				<div class="sec-title clearfix">
					<!-- 제목 줄 -->
					<div class="pull-left">
						<h2>최근 사연</h2>
						<!-- <div class="text">새로운 사연입니다.</div> -->
					</div>
					<div class="pull-right">
						<a href="boardList" class="theme-btn btn-style-four">모든 사연 보기</a>
					</div>
				</div>

				<div class="row clearfix">
					<!--Causes Block-->
					<!-- 사연1 -->
					<c:forEach var="mainboard" items="${list}" begin="0" end="2">
						<div class="causes-block col-md-4 col-sm-6 col-xs-12">
							<div class="inner-box">
								<div class="image">
									<a href="boardDetail?boardnum=${mainboard.boardnum}"><img
										src="download?boardnum=${mainboard.boardnum}" /></a>
									<!-- 이미지 -->
								</div>
								<div class="lower-box">
									<div class="content">
										<h3>
											<a href="boardDetail?boardnum=${mainboard.boardnum}">${mainboard.title}</a>
										</h3>
										<!--제목-->
										<div class="text">${mainboard.content}…</div>
										<!--내용 미리보기-->
										<div class="donate-bar wow fadeIn" data-wow-delay="0ms"
											data-wow-duration="0ms">
											<div class="bar-inner">
												<!--프로그래스 바-->
												<div class="bar"
													style="width:<fmt:formatNumber value="${(mainboard.blood_present)/(mainboard.goal_blood)*100}" pattern="0"/>%;">
													<div class="count-box">
														<span class="count-text" data-speed="2000"
															data-stop="<fmt:formatNumber value="${(mainboard.blood_present)/(mainboard.goal_blood)*100}" pattern="0"/>"></span>%
													</div>
												</div>
											</div>
										</div>
										<div class="causes-info">
											<strong>헌혈증</strong> ${mainboard.blood_present} / <span
												class="theme_color">${mainboard.goal_blood}</span> &nbsp;<strong>마감날짜
												: </strong><span class="theme_color"> ${mainboard.goal_date}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>

			</div>
		</section>
		<!--End Causes Section-->
		<!--Services Section-->
		<!-- 방식 -->
		<section class="services-section">
			<div class="auto-container">
				<!--Services Title-->
				<div class="services-title">
					<div>
						<h2>사람과 사람을 이어</h2>
					</div>
					<div>
						<h2>
							<span> 따뜻함 </span>과 <span> 뿌듯함 </span>을 만들다
						</h2>
					</div>
				</div>
				<div class="clearfix">

					<!--Services Style One-->
					<div class="services-style-one col-md-4 col-sm-6 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<img src="images/icons/index-barcode.png" style="padding-bottom: 5px;">
							</div>
							<h3>
								<a href="">바코드 활용</a>
							</h3>
							<div class="text">헌혈증 바코드로<br>등록·보관</div>
						</div>
					</div>

					<!--Services Style One-->
					<div class="services-style-one col-md-4 col-sm-6 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<img src="images/icons/index-group.png" style="padding-bottom: 10px;">
							</div>
							<h3>
								<a href="">크라우드 펀딩</a>
							</h3>
							<div class="text">
								[기부형]크라우드 펀딩 방식으로 <br>헌혈증을 선택적 기부
							</div>
						</div>
					</div>

					<!--Services Style One-->
					<div class="services-style-one col-md-4 col-sm-6 col-xs-12">
						<div class="inner-box">
							<div class="icon-box">
								<img src="images/icons/index-time.png" style="padding-bottom: 10px;">
							</div>
							<h3>공간적·시간적 제약 해소</h3>
							<div class="title"></div>
							<div class="text">
								시공간을 초월한<br>헌혈증 기부<br>
							</div>
						</div>
					</div>

				</div>
			</div>
		</section>
		<!--End Services Section-->

		


		<footer class="main-footer">
			<!--Footer Bottom-->
			<div class="footer-bottom">
				<div class="auto-container">
					<div class="row clearfix">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="copyright">
								All Right Researved <a href="#">Cheer's</a> &copy; 2017
							</div>
						</div>
						<div class="col-md-6 col-sm-6 col-xs-12">
							<ul class="footer-nav">
								<!-- <li><a href="#">Home</a></li>
								<li><a href="#">Contact Us</a></li>
								<li><a href="#">FAQ's</a></li> -->
							</ul>
						</div>
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
	<script src="js/revolution.min.js"></script>
	<script src="js/jquery.fancybox.pack.js"></script>
	<script src="js/jquery.fancybox-media.js"></script>
	<script src="js/owl.js"></script>
	<script src="js/appear.js"></script>
	<script src="js/wow.js"></script>
	<script src="js/script.js"></script>
	<!-- <script src="js/color-settings.js"></script> -->

</body>
</html>