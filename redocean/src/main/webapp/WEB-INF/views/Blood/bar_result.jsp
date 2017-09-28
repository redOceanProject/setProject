<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>Huminity HTML Template | About</title>
<!-- Stylesheets -->
<link href="css/bootstrap3.css" rel="stylesheet">
<link href="css/style3.css" rel="stylesheet">
<link href="js/bootstrap.min.js" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/bdcard3.css" rel="stylesheet">

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

    
    <!--Default Section-->
    <section class="default-section style-two">
    	<div class="auto-container">
        	<div class="row clearfix">
				
                <!--Video Column-->
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="image">
      					<img src="images/bdcardBlank.png">
      					<div class="textN cardLeft cardLine1">
         					<input type="text" class="cardText" value="${list.name}" readonly>
      					</div>
     					<div class="textBD cardLeft cardLine2">
        					<input type="text" class="cardText" value="${list.bdbirth}" readonly>
     					</div>
      					<div class="textBT cardRight cardLine1">
         					<input type="text" class="cardText" value="${list.consituent} ${list.bloodvolume}" readonly>
      					</div>
      					<div class="textS cardRight cardLine2">
         					<input type="text" class="cardText" value="${list.gender}" readonly>
      					</div>
      					<div class="textDD cardLeft  cardLine3">
         					<input type="text" class="cardText" value="${list.bddate}" readonly>
      					</div>
      					<div class="textCT cardLeft cardLine4">
         					<input type="text" class="cardText" value="${list.bdcenter}" style="width: 170px;" readonly>
      					</div>
      					<div class="Barcode">
         				<input type="text" class="cardBarcode" value="${list.bdbar_num}" readonly>
      					</div>
  					 </div>
                </div>
				
                <!--About Column Two-->
            	<div class="about-column-two col-md-6 col-sm-12 col-xs-12">
                	<div class="inner-box">
                        <h2>${name}님의 헌혈증</h2>
                        <!-- <div class="text">どうもありがとうございます。</div> -->
                        <ul class="list-style-two">
                        	<li>증서를 의료기관에 제출하는 경우, 진료비의 수혈비용 중 본인부담금액을 공제 받습니다.</li>
                        	<li>금전,재산상의 대가적 급부를 주거나 주기로 하고 이 증서를 제공하거나 제공받아서는 아니됩니다.</li>
                        	<li>증서는 재등록이 불가능하오니, 등록에 유의하시기 바랍니다.</li>
                            <!-- <li>등록하면 낙장불입</li>
                            <li>사고팔기 안됩니다</li> -->
                        </ul>
                        <div class="clearfix">
                            <!--Author Info-->
                            <div class="author-info pull-left">
                                <%-- <h4>${name}</h4>
                                <div class="designation">${email}</div> --%>
                            </div>
                            <form method="post" action="register">
                        		<button class="theme-btn btn-style-one" type="submit">등록하기</button>
                        		<input type ="hidden" name="bdnum" value="${list.bdbar_num}">
                        	</form>
                        </div>
                    </div>
				</div>
                
            </div>
        </div>
    </section>
    <!--End Default Section-->
    
</div>
<!--End pagewrapper-->


<script src="js/jquery.js"></script> 
<script src="js/bootstrap.min.js"></script>
<script src="js/jquery.fancybox.pack.js"></script>
<script src="js/jquery.fancybox-media.js"></script>
<script src="js/owl.js"></script>
<script src="js/appear.js"></script>
<script src="js/wow.js"></script>
<script src="js/script.js"></script>

</body>
</html>