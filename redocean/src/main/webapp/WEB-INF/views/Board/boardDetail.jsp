<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<title>Huminity HTML Template | Cause Details</title>
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
<script src="js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		listReply2(); // ** json 리턴방식

		// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
		$("#btnReply").click(function() {
			var email = $("#email").val();
			var text = $("#text").val();
			var boardnum = $("#boardnum").val();
			$.ajax({
				type : "post",
				url : "enroll",
				data : {email : email , text : text, boardnum : boardnum},
				success : function() {
					alert("댓글이 등록되었습니다.");
					listReply2();
				}
			});
		});
	});

	
	// RestController방식 (Json)
	// **댓글 목록2 (json)
	function listReply2(boadnum) {
				alert(result);
		$.ajax({
			type : "post",
			//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
			data: boardnum,
			url : "getreply",
			success : function(result) {
				var output = "<div>";
				for ( var i in result) {
					output += "<div> ";
					output += "<div> ";
					output += "<div> ";
					output += "<div> ";
					output += "<div>";
					output += "<strong>"+result[i]+email+"</strong>";
					output += "<div>"+result[i]+inputdate+"</div>";
					output += "</div>";
					output += "<div>"+result[i]+text+"</div>";
					output += "</div>";
					output += "</div>";
					output += "</div>";
					output += "</div>";
				}
				output += "</div>";
				$("#listReply").html(output);
			}
		});
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
                    	<div class="logo"><a href="index.html"><img src="images/logo.png" alt="" title=""></a></div>
                    </div>
                    
                    <div class="nav-outer clearfix">
                        <!-- Main Menu -->
                        <nav class="main-menu">
                        
                    		<div class="navbar-header"><!-- 반응형 -->
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
                                		<li><a href="logout">로그아웃</a></li>
                                		<li><a href="#">마이페이지</a></li>
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
                                	<li><a href="logout">로그아웃</a></li>
                                	<li><a href="#">마이페이지</a></li>
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
                                    <div class="causes-info"><strong>헌혈증</strong> ${board.blood_present} / <span class="theme_color">${board.goal_blood}</span>
                                    	&nbsp;<strong>마감날짜 : </strong><span class="theme_color"> ${board.goal_date}</span>
                                    </div>
                                </div>
                                <div class="btn-column col-md-6 col-sm-6 col-xs-12">
                                	<a href="donate.html" class="theme-btn btn-style-four">cheer up</a>
                                </div>
                            </div>
                            <ul class="count">
                            	<li>
                            		<span class="icon fa fa-comment-o"></span>13&nbsp;&nbsp;
                          			<span class="icon fa fa-heart-o"></span>128&nbsp;&nbsp;
                          			<c:if test="${email != null}">
                          				<a href="boardUpdate?boardnum=${board.boardnum}"><span class="icon fa fa-pencil"></span></a>&nbsp;&nbsp;
                          				<a href="boardDelete?boardnum=${board.boardnum}"><span class="icon fa fa-trash-o"></span></a>
                          			</c:if>
                          		</li>
                            </ul>
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
                            <div class="row clearfix">
                            
                            	<div class="column col-md-12 col-sm-12 col-xs-12">
                                    <!--Form Group-->
                                    <div class="form-group">
                                    	<input type="hidden" name="email" id="email" value = "${email}">
                                    	<input type="hidden" name="boardnum"  id="boardnum" value="${board.boardnum}">
                                        <textarea class = "content" rows="1" cols="10" name="text" id="text" maxlength="200" placeholder="저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받을 수 있습니다. 건전한 토론문화와 양질의 댓글 문화를 위해, 타인에게 불쾌감을 주는 욕설 또는 특정 계층/민족, 종교 등을 비하하는 단어들은 표시가 제한됩니다."></textarea>
                                    </div>
                                </div>
                                
                                <div class="form-group col-md-12 col-sm-12 col-xs-12"> <!-- 버튼 -->
                                    <button class="theme-btn btn-style-one" type="button" id="btnReply">댓글작성</button>
                                </div>
                                
                             </div>
                        
                    </div>
                    <!--End Comment Form -->
                    </c:if>
                    
                    
                    <!--Comments Area-->
                    <div class="comments-area" id="listReply">  <!-- 리플부분 -->
                        <!--Comment Outer-->
                        <div class="comment-outer">
                            <!--Comment Box-->
                            <%-- <c:forEach var="replyList" items="${replyList}"> --%>
                            <div class="comment-box"> 
                                <div class="comment">
                                    <!-- <div class="author-thumb"><img src="images/resource/author-8.jpg" alt=""></div> -->
                                    <div class="comment-inner">
                                        <div class="comment-info clearfix"><strong></strong><div class="comment-time"></div></div>
                                        <div class="text"></div>
                                    </div>
                                </div>
                            </div>
                            <%-- </c:forEach> --%>
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