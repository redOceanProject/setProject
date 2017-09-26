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
<link href="css/bootstrap3.css" rel="stylesheet">

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
										<li><a href="myPage">마이페이지</a></li>
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
						<!--Form Portlet-->
						<div class="form-portlet">
							<div class="row clearfix">
								<div id="wrapper1" style="padding: 35px; padding-left: 67px;">

									<div class="container">
										<div class="title1"
											style="text-align: center; width: 80%; padding-bottom: 20px;">
											<h2>내 헌혈증</h2>
										</div>
										<ul class="nav nav-tabs">
											<li class="active"><a data-toggle="tab" href="selectDonation">기부
													현황</a></li>
											<!-- <li><a data-toggle="tab" href="#menu1">등록한 헌혈증</a></li>
											<li><a data-toggle="tab" href="#menu2">보낸 헌혈증</a></li>
											<li><a data-toggle="tab" href="#menu3">받은 헌혈증</a></li> -->
										</ul>

										<div class="tab-content">
											<!-- 전체 -->
											<div id="home" class="tab-pane fade in active">
												<!--Causes Section-->
												<section class="causes-section causes-grid-page">
													<!-- 사연 부분 -->
													<div class="auto-container">
														<div class="row clearfix">
															<!--Causes Block-->
															<!-- 사연1 -->
															<c:forEach var="boardList" items="${boardList}">
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
																				<div class="donate-bar wow fadeIn"
																					data-wow-delay="0ms" data-wow-duration="0ms">
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
																					&nbsp;<strong>마감날짜 : </strong><span
																						class="theme_color"> ${boardList.goal_date}</span>
																				</div>
																			</div>
																		</div>
																	</div>
																</div>
															</c:forEach>
														</div>


														<!-- Styled Pagination -->
														<!--다음 페이지-->
														<div class="styled-pagination text-center" style="text-align:center; right: 80px;">
															<ul class="clearfix">
																<li><a href="#" class="active">1</a></li>
																<li><a href="#">2</a></li>
																<li><a href="#">3</a></li>
																<li><a class="next" href="#">Next</a></li>
															</ul>
														</div>
													</div>
												</section>

											</div>

											<div id="menu1" class="tab-pane fade"></div>
											<div id="menu2" class="tab-pane fade"></div>
											<div id="menu3" class="tab-pane fade in active"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--End Donate Section-->



		<!--Main Footer-->
		<footer class="main-footer">

			<!--Footer Bottom-->
			<div class="footer-bottom">
				<div class="auto-container">
					<div class="row clearfix">
						<div class="col-md-6 col-sm-6 col-xs-12">
							<div class="copyright">
								All Right Researved <a href="#">RedOceans</a> &copy; 2017
							</div>
						</div>
					</div>
				</div>
			</div>

		</footer>

	</div>

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