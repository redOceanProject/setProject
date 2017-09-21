<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Huminity HTML Template | Cause Details</title>
<!-- Stylesheets -->
<link href="css/bootstrap.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">

<!--Add Theme Color File To Change Template Color Scheme / Color Scheme Files are Located in root/css/color-themes/ folder-->
<!--<link href="css/color-themes/orange-theme.css" rel="stylesheet">-->

<!--Favicon-->
<link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<!-- Responsive -->
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
<!--[if lt IE 9]><script src="js/respond.js"></script><![endif]-->

<script type="text/javascript">
	$(document).ready(function writeReply() {
		
		var text = $('#text').val();
		
	});

	$.ajax({
		url: ''
		,type: 'post'
		,data: {text : text}
		,success: function () {
			alter('댓글등록');
		}
		,error:	function(e){
				alert('실패 : '+JSON.stringify(e));
		}				
		
	});
	
	
	
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
				<!--메뉴 바 -->
				<div class="auto-container">
					<div class="clearfix">

						<div class="pull-left logo-outer">
							<div class="logo">
								<a href="index"><img src="images/logo.png" alt="" title=""></a>
							</div>
							<!--휴미니티 로고 -->
						</div>

						<div class="nav-outer clearfix">
							<!--메인 메뉴 바  // 로고랑 메뉴랑 div로 좌우 나누어져 있다. -->
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
										<li class="dropdown"><a href="#">Home</a> <!-- Home--></li>
										<li class="dropdown"><a href="#">About</a> <!--about -->
										</li>
										<li class="current dropdown"><a href="#">Causes</a> <!--causes -->
										</li>
										<li><a href="shop.html">Shop</a></li>
										<!--shop -->
										<li class="dropdown"><a href="#">Blog</a> <!--blog  --></li>
										<li><a href="contact.html">Contact us</a></li>
										<!--contact us -->
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
				<!--스크롤 내리면 같이 내려오는 헤더  -->
				<div class="auto-container clearfix">
					<!--하얀 배경의 헤더 -->
					<!--Logo-->
					<div class="logo pull-left">
						<!-- 휴머니티 로고 -->
						<a href="index.html" class="img-responsive"><img
							src="images/logo-small.png" alt="" title=""></a>
					</div>

					<!--Right Col-->
					<div class="right-col pull-right">
						<!-- div로 로고랑 좌우 나눔 -->
						<!-- Main Menu -->
						<nav class="main-menu">
							<div class="navbar-header">
								<!-- Toggle Button -->
								<!-- ??? -->
								<button type="button" class="navbar-toggle"
									data-toggle="collapse" data-target=".navbar-collapse">
									<span class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
							</div>

							<div class="navbar-collapse collapse clearfix">
								<!-- 메뉴 마우스를 가져가면 밑에 딸린 페이지가 나타난다. -->
								<ul class="navigation clearfix">
									<li class="dropdown"><a href="#">Home</a></li>
									<li class="dropdown"><a href="#">About</a></li>
									<li class="current dropdown"><a href="#">Causes</a></li>
									<li><a href="shop.html">Shop</a></li>
									<li class="dropdown"><a href="#">Blog</a></li>
									<li><a href="contact.html">Contact us</a></li>
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

		    <!--Sidebar Page Container-->
    <div class="sidebar-page-container">
    	<div class="auto-container">
        	<div class="row clearfix">
            	
                <!--Content Side--> <!--왼쪽 내용-->
                <div class="content-side col-lg-8 col-md-8 col-sm-12 col-xs-12">
                	<!--Cause Details-->
                	<div class="causes-single">
						<div class="image">
							<c:if test="${not empty mimetype}">
								<img src="download?boardnum=${board.boardnum}"/>
							</c:if>
                        </div>
                        <!--Upper Box-->
                        <div class="upper-box">
                        	<h2>${board.title}</h2>
                            <div class="row clearfix">
                            	<!--Rate Column-->
                            	<div class="rate-column col-md-6 col-sm-6 col-xs-12">
                                	<div class="donate-bar wow fadeIn" data-wow-delay="0ms" data-wow-duration="0ms">
                                        <div class="bar-inner">
                                            <div class="bar" style="width:<fmt:formatNumber value="${(board.blood_present)/(board.goal_blood)*100}" pattern="0"/>%;">
                                                <div class="count-box"><span class="count-text" data-speed="2000" data-stop="<fmt:formatNumber value="${(board.blood_present)/(board.goal_blood)*100}" pattern="0"/>">0</span>%</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="causes-info"><strong>Raised</strong> ${board.blood_present} / <span class="theme_color">${board.goal_blood}</span></div>
                                </div>
                                <div class="btn-column col-md-6 col-sm-6 col-xs-12">
                                	<a href="donate.html" class="theme-btn btn-style-four">cheer up</a>
                                </div>
                            </div>
                        </div>
                        <!--Lower Box-->
                        <div class="lower-box">
                        	<div class="dark-text">${board.content}</div>
                        </div>
                    </div>
                    
                    
                    
                    <c:if test="${email != null}">
                    <!-- Comment Form -->
                    <div class="comment-form"> <!-- 리플 작성 폼 -->
                        <div class="group-title">
                        	<h2>전체 댓글</h2>
                        </div>
                        <!--Comment Form-->
                        <form method="post" action="reply">
                            <div class="row clearfix">
                            
                            	<div class="column col-md-12 col-sm-12 col-xs-12">
                                    <!--Form Group-->
                                    <div class="form-group">
                                    	<input type="hidden" name="boardnum" value="${board.boardnum}">
                                        <textarea class = "content" rows="1" cols="10" name="text" id="text" maxlength="200" placeholder="
저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다."></textarea>
                                    </div>
                                </div>
                                
                                <div class="form-group col-md-12 col-sm-12 col-xs-12"> <!-- 버튼 -->
                                    <button class="theme-btn btn-style-one" type="submit" name="submit-form" onclick="writeReply();">응원하기</button>
                                </div>
                                
                             </div>
                        </form>
                        
                    </div>
                    <!--End Comment Form -->
                    </c:if>
                    
                    
                    <!--Comments Area-->
                    <div class="comments-area">  <!-- 리플부분 -->
                        <!--Comment Outer-->
                        <div class="comment-outer">
                            <!--Comment Box-->
                            <c:forEach var="replyList" items="${replyList}">
                            <div class="comment-box"> 
                                <div class="comment">
                                    <div class="author-thumb"><img src="images/resource/author-8.jpg" alt=""></div>
                                    <div class="comment-inner">
                                        <div class="comment-info clearfix"><strong>${replyList.email}</strong><div class="comment-time">${replyList.inputdate}</div></div>
                                        <div class="text">${replyList.text}</div>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>
                        </div>
                    </div>
                    <!--End Comments Area-->
                    
                </div>
            </div>
        </div>
    </div>
</div>
    <!--End Causes Section-->
    
    
    
    
<!--End pagewrapper-->

<!--Scroll to top--> <!--화면 제일위로 올라가는 화살표 아이콘  -->
<div class="scroll-to-top scroll-to-target" data-target=".main-header"><span class="icon fa fa-long-arrow-up"></span></div>



<!--스크립트  -->
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