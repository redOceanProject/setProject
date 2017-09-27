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
<link href="css/bdcard5.css" rel="stylesheet">
<link href="css/cordLine.css" rel="stylesheet">
<link href="css/animate2.css" rel="stylesheet">

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
		$.ajax({
			type : "post",
			//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
			data: ${board.boardnum},
			url : "getreply?boardnum=${board.boardnum}",
			success : function(result) {
				var output = "<div>";
				for ( var i in result) {
					//output += "<div class=comments-area>";
					output += "<div class=comment-outer>";
					output += "<div class=comment-box>";
					output += "<div class=comment>";
					output += "<div class=comment-inner>";
					output += "<div class=comment-info clearfix>"
					output += "<strong>"+result[i].email+"</strong>";
					output += "<div class=comment-time>"+result[i].inputdate+"</div>";
					output += "</div></div>";
					output += "<div class=text>"+result[i].text+"</div>";
					output += "</div>";
					output += "</div>";
					output += "</div>";
					//output += "</div>";
				}
				output += "</div>";
				$("#listReply").html(output);
			}
		});
	}
</script>
<script src="js/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function() {
	$('#bt6').on('click', selectBdlist2);
	$('#cheerUpButton').on('click', sendSlcBdc);
});

function selectTable(bdbar_num) {
	var input = $('#'+bdbar_num+'c').val();
	$('#'+bdbar_num).html(input); 
	$('#'+bdbar_num+'s').remove();
	$('#'+bdbar_num+'c').remove(); 
}


// 선택한 테이블 붙이기
function appendTable(bdbar_num) {
	var hiddenTable = $('#' + bdbar_num).html()
	var selectedTable = '<div class="CLdiv"><table id="'+bdbar_num+'s" class="cordLine" onclick="selectTable('+bdbar_num+')">'
		selectedTable+= '<tr><td class="cordLineTd1"></td><td class="cordLineTd2" name="slcBdcnum">'+bdbar_num+'</td></tr></table>';
		selectedTable+= '<input type="hidden" id="'+bdbar_num+'c"></div>';
	$('#selectedTable').append(selectedTable);
	$('#'+bdbar_num+'c').val(hiddenTable);
	$('#'+bdbar_num).html(''); 
}

// 헌혈증 목록 출력
function selectBdlist2() {
	$.ajax({
		url : 'selectBdlist2',
		type : 'GET',
		dataType : 'json',
		success : function(msg) {
			var txt = "";
			for(var i in msg.bd) {
				txt += '<div id="'+msg.bd[i].bdbar_num+'" class="mimage animated bounceInDown" onclick="appendTable('+msg.bd[i].bdbar_num+')">';
				txt += '<img src="images/bdcardBlank.png" style="width: 300px; height: auto;">';
				txt += '<div class="mtextN mcardLeft mcardLine1">';
				txt += '<input type="text" class="mcardText" value="'+msg.bd[i].name+'" readonly></div>';
				txt += '<div class="mtextBD mcardLeft mcardLine2">';
				txt+= '<input type="text" class="mcardText" value="'+msg.bd[i].bdbirth+'" readonly></div>';
				txt += '<div class="mtextBT mcardRight mcardLine1">';
				txt += '<input type="text" class="mcardText" value="'+msg.bd[i].consituent+''+msg.bd[i].bloodvolume+'" readonly></div>';
				txt += '<div class="mtextS mcardRight mcardLine2">';
				txt += '<input type="text" class="mcardText" value="'+msg.bd[i].gender+'" readonly></div>';
				txt += '<div class="mtextDD mcardLeft  mcardLine3">';
				txt += '<input type="text" class="mcardText" value="'+msg.bd[i].bddate+'" readonly></div>';
				txt += '<div class="mtextCT mcardLeft mcardLine4">';
				txt += '<input type="text" class="mcardText" value="'+msg.bd[i].bdcenter+'" style="width: 170px;" readonly></div>';
				txt += '<div class="mBarcode"><input type="text" class="mcardBarcode" value="'+msg.bd[i].bdbar_num+'" readonly></div></div>';
				txt += "<br><br>";
				}
 		$('#output').append(txt);
		$('#bt6').attr("disabled", true); // 버튼 한 번 누르면 못 누르게
		},
		error : function(e) {
			alert('실패 : ' + JSON.stringify(e));
		}
	});
}

//배열로 만들어서 보내기
function sendSlcBdc() {
	var fields = document.getElementsByName("slcBdcnum");
	var test = [];
	var toEmail = '${board.email}';
	var boardnum = '${board.boardnum}';
	
	for (var i = 0; i < fields.length; i++) {
		 alert(fields[i].innerHTML);
		 test.push(fields[i].innerHTML);
	}
	
	console.log(test);
	console.log(toEmail);
	
	$.ajaxSettings.traditional = true;
	
	$.ajax({
		url: 'send',
		type: 'post',
		data: {
			"valueArrTest": test, toEmail : toEmail, boardnum : boardnum
		},
		dataType: 'String',
		success : function checkBlood() {
						 alert('가나다');
						      var present = '${board.blood_present}';
						      var goal = '${board.goal_blood}';
						      if (present==goal) {
						         $.ajax({
						            url : 'change',
						            type : 'GET',
						            success : function(msg){
						               alert('기부 완료되었습니다. 감사합니다.');
						            }
						         });
						      }
						   }
		,
		error : function(request,status,error) {
			alert(JSON.stringify(request,status,error));
		}
	});
	// 이메일만 따로 보내보기
/* 	alert('${board.email}')
	$.ajax({
		url: 'send2',
		type: 'post',
		data: 
			{toEmail : '${board.email}'}
		,
		success : function() {
			alert('저장되옸소');
		},
		error : function(request,status,error) {
			alert(JSON.stringify(request,status,error));
		}
	}); */
	
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
                                	<li><a href="myPage">마이페이지</a></li>
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
                                        <div class="bar-inner" >
                                            <div class="bar" style="width:<fmt:formatNumber value="${(board.blood_present)/(board.goal_blood)*100}" pattern="0"/>%;">
                                                <div class="count-box"><span class="count-text" data-speed="2000" data-stop="<fmt:formatNumber value="${(board.blood_present)/(board.goal_blood)*100}" pattern="0"/>">0</span>%</div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="causes-info"><strong>헌혈증</strong> ${board.blood_present} / <span class="theme_color">${board.goal_blood}</span>
                                    	&nbsp;<strong>마감날짜 : </strong><span class="theme_color"> ${board.goal_date}</span>
                                    </div>
                                </div>
                                <!-- 선택된 헌혈증 번호 리스트 출력 -->
                                <div class="btn-column col-md-6 col-sm-6 col-xs-12">
<!--                                 	<div class="btn-column col-md-6 col-sm-6 col-xs-12" style="vertical-align: top;"> -->
									<div id="selectedTable" style="float: left;">
									
									</div>
									
										<div><input id="cheerUpButton" type="button" class="theme-btn btn-style-four" style="float:right;" value="cheer up"></div>
<!-- 									</div> -->
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
                            <div class="comment-box"> 
                                <div class="comment">
                                    <div class="comment-inner">
                                        <div class="comment-info clearfix"><strong></strong><div class="comment-time"></div></div>
                                        <div class="text"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--End Comments Area-->
                    
                </div>
                
                
                <!-- 내 헌혈증 리스트가 나오는 곳 -->
                <div class="sidebar-side col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<aside class="sidebar default-sidebar">
						<!--보유 헌혈증 리스트-->
						<div class="sidebar-widget sidebar-blog-category">
						<!-- <div class="sidebar-title">
								<h2>내 헌혈증</h2>
								<a href="bdDonateform">bdDonateform</a>
							</div> -->
							<input type="button" id="bt6" value="내 헌혈증 보기"> <br>
							<div id="output"></div>
						</div>
					</aside>
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