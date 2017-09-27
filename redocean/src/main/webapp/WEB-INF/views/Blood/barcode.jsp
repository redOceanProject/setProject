<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<!-- 바코드 -->
<link rel="stylesheet" href="css/style_barcode.css" />
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->
<script type="text/javascript" src="js/jquery_barcode.js"></script>
<script type="text/javascript" src="js/barcode.js"></script>
<script type="text/javascript" src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	var sound = new Audio("./resources/js/barcode.wav");

	$(document).ready(function() {
		barcode.config.start = 0.1;
		barcode.config.end = 0.9;
		barcode.config.video = '#barcodevideo';
		barcode.config.canvas = '#barcodecanvas';
		barcode.config.canvasg = '#barcodecanvasg';
		barcode.setHandler(function(barcode) {
			$('#result').val(barcode);
			$('#findinfo').submit();
			//console.log("바코드 출력 : " + barcode);
			//alert("바코드 출력 : " + barcode);#
		});

		barcode.init();

		$('#result').bind('DOMSubtreeModified', function(e) {
			sound.play();
		});

	});

	function test1() {

	}
</script>
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


		<!--Donate Section-->
		<section class="donate-section">
			<div class="auto-container">
				<div class="donate-form-section">
					<div class="donation-form-outer">
						<!--Form Portlet-->
						<div class="form-portlet">
							<div class="row clearfix"></div>
						</div>
						<!--Form Portlet-->
						<div class="form-portlet" style="text-align: center;">
							<div class="row clearfix" style="text-align: center;">

								<div id="barcodebk">
									<div id="barcode">
										<video id="barcodevideo" autoplay></video>
										<canvas id="barcodecanvasg"></canvas>
									</div>
									<canvas id="barcodecanvas"></canvas>
								</div>
								<br>
								<form action="findinfo" id="findinfo" method="post">
									<input type="text" id="result" name="num" value="">
									<!-- <input type="submit" value="확인">&nbsp; <input type="reset" value="다시 스캔"> -->
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--End Donate Section-->
	</div>
	<!--End pagewrapper-->

	<!--Scroll to top-->
	<div class="scroll-to-top scroll-to-target" data-target=".main-header">
		<span class="icon fa fa-long-arrow-up"></span>
	</div>




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