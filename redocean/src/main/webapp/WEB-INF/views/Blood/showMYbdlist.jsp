<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Huminity HTML Template | Donate</title>
<!-- Stylesheets -->
<link href="css/bootstrap3.css" rel="stylesheet">
<link href="css/style3.css" rel="stylesheet">
<!-- <link href="css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="js/jquery.min.js" rel="stylesheet"> -->
<link href="js/bootstrap.min.js" rel="stylesheet">
<link href="css/responsive.css" rel="stylesheet">
<link href="css/color-themes/red-theme.css" rel="stylesheet">
<link href="css/bdcard3.css" rel="stylesheet">
<!-- tap -->
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
                    	<a href="index.html"><img src="images/cheer-logo.png" alt="" title=""></a>
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
                                    <li><a href="login">로그인</a></li>
                                </c:if>
                                <c:if test="${email != null}">
                                	<li><a href="logout">${name}..로그아웃</a></li>
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
											<li class="active"><a data-toggle="tab" href="#home">보유 헌혈증</a></li>
											<li><a data-toggle="tab" href="#menu1">등록한 헌혈증</a></li>
											<li><a data-toggle="tab" href="#menu2">보낸 헌혈증</a></li>
											<li><a data-toggle="tab" href="#menu3">받은 헌혈증</a></li>
											<li><a href="barcode">헌혈증 등록하기</a></li>
										</ul>

										<div class="tab-content">
											<!-- 전체 -->
											<div id="home" class="tab-pane fade in active">
												<div class="bcSector" style="padding-top: 30px;">
													<table id="table_id">
														<tr>
															<c:forEach var="bd" items="${list}" varStatus="s">
																<td>
																	<div class="mimage">
																		<c:if test="${bd.status==0}">
																			<a href="barcode"><img src="images/bdcardBlank.png"
																				style="width: 500px; height: auto;"></a>
																		</c:if>
																		<c:if test="${bd.status==1}">
																			<img src="images/bdcardBlank.png"
																				style="width: 500px; height: auto;" class="black1">
																		</c:if>
																		<c:if test="${bd.status==2}">
																			<img src="images/bdcardBlank.png"
																				style="width: 500px; height: auto;" class="red1">
																		</c:if>
																		<div class="mtextN mcardLeft mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.name}" readonly>
																		</div>
																		<div class="mtextBD mcardLeft mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.bdbirth}" readonly>
																		</div>
																		<div class="mtextBT mcardRight mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.consituent} ${bd.bloodvolume}" readonly>
																		</div>
																		<div class="mtextS mcardRight mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.gender}" readonly>
																		</div>
																		<div class="mtextDD mcardLeft  mcardLine3">
																			<input type="text" class="mcardText"
																				value="${bd.bddate}" style="width: 170px; top:5px;" readonly>
																		</div>
																		<div class="mtextCT mcardLeft mcardLine4">
																			<input type="text" class="mcardText"
																				value="${bd.bdcenter}" style="width: 50px; top:7px;"
																				readonly>
																		</div>
																		<div class="mBarcode">
																			<input type="text" class="mcardBarcode"
																				value="${bd.bdbar_num}" readonly>
																		</div>

																	</div>
																</td>
																<c:if test="${s.count%3==0 }">
																	<tr></tr>
																</c:if>
															</c:forEach>
														</tr>

													</table>
												</div>
											</div>

											<!-- 등록한 헌혈증 -->
											<div id="menu1" class="tab-pane fade">
												<div class="bcSector" style="padding-top: 30px;">
													<table id="table_id">
														<tr>
															<c:forEach var="bd" items="${RegisterList}" varStatus="s">
																<td>
																	<div class="mimage">

																		<img src="images/bdcardBlank.png" class="Red1">
																		<div class="mtextN mcardLeft mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.name}" readonly>
																		</div>
																		<div class="mtextBD mcardLeft mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.bdbirth}" readonly>
																		</div>
																		<div class="mtextBT mcardRight mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.consituent} ${bd.bloodvolume}" readonly>
																		</div>
																		<div class="mtextS mcardRight mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.gender}" readonly>
																		</div>
																		<div class="mtextDD mcardLeft  mcardLine3">
																			<input type="text" class="mcardText"
																				value="${bd.bddate}" style="width: 170px; top:5px;" readonly>
																		</div>
																		<div class="mtextCT mcardLeft mcardLine4">
																			<input type="text" class="mcardText"
																				value="${bd.bdcenter}" style="width: 50px; top:7px;"
																				readonly>
																		</div>
																		<div class="mBarcode">
																			<input type="text" class="mcardBarcode"
																				value="${bd.bdbar_num}" readonly>
																		</div>
																	</div>
																</td>
																<c:if test="${s.count%3==0 }">
																	<tr></tr>
																</c:if>
															</c:forEach>
														</tr>
													</table>
												</div>
											</div>


											<!--보낸 헌혈증  -->
											<div id="menu2" class="tab-pane fade">
												<div class="bcSector" style="padding-top: 30px;">
													<table id="table_id">
														<tr>
															<c:forEach var="bd" items="${usedList}" varStatus="s">
															<c:set var="bdt" value='TO:  '></c:set>
																<td><div class="mimage">
																		<img src="images/bdcardBlank.png"
																			style="width: 500px; height: auto;">
																		<div class="mtextN mcardLeft mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.name}" readonly>
																		</div>
																		<div class="mtextBD mcardLeft mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.bdbirth}" readonly>
																		</div>
																		<div class="mtextBT mcardRight mcardLine1">
																			<input type="text" class="mcardText"
																				value="${bd.consituent} ${bd.bloodvolume}" readonly>
																		</div>
																		<div class="mtextS mcardRight mcardLine2">
																			<input type="text" class="mcardText"
																				value="${bd.gender}" readonly>
																		</div>
																		<div class="mtextDD mcardLeft  mcardLine3">
																			<input type="text" class="mcardText"
																				value="${bd.bddate}" style="width: 170px; top:5px;" readonly>
																		</div>
																		<div class="mtextCT mcardLeft mcardLine4">
																			<input type="text" class="mcardText"
																				value="${bd.bdcenter}" style="width: 50px; top:7px;"
																				readonly>
																		</div>
																		<div class="mBarcode">
																			<input type="text" class="mcardBarcode"
																				value="${bd.bdbar_num}" readonly>
																		</div>
																		<div>
																			<input type="text" class="toemailText"
																				value="${bdt} ${bd.toemail}" style="text-align: center; font-weight:bold;
																				width: 100%; left:5px; font-size: 15px;" readonly>
																		</div>
																	</div></td>
																<c:if test="${s.count%3==0 }">
																	<tr>
																	</tr>
																</c:if>
															</c:forEach>
														</tr>

													</table>
												</div>
											</div>
											
											
										<!-- 받은 헌혈증 -->
                                 <div id="menu3" class="tab-pane fade">
                                    <div class="bcSector" style="padding-top: 30px;">
                                       <table id="table_id">
                                          <tr>
                                             <c:forEach var="bd" items="${getlist}" varStatus="s">
                                             <c:set var="bdt" value='FROM:  '></c:set>
                                                <td>
                                                   <div class="mimage">
                                                         <img src="images/bdcardBlank.png"
                                                            style="width: 500px; height: auto;">
                                                      <div class="mtextN mcardLeft mcardLine1">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.name}" readonly>
                                                      </div>
                                                      <div class="mtextBD mcardLeft mcardLine2">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.bdbirth}" readonly>
                                                      </div>
                                                      <div class="mtextBT mcardRight mcardLine1">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.consituent} ${bd.bloodvolume}" readonly>
                                                      </div>
                                                      <div class="mtextS mcardRight mcardLine2">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.gender}" readonly>
                                                      </div>
                                                      <div class="mtextDD mcardLeft  mcardLine3">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.bddate}" style="width: 170px; top:5px;" readonly>
                                                      </div>
                                                      <div class="mtextCT mcardLeft mcardLine4">
                                                         <input type="text" class="mcardText"
                                                            value="${bd.bdcenter}" style="width: 50px; top:7px;"
                                                            readonly>
                                                      </div>
                                                      <div class="mBarcode">
                                                         <input type="text" class="mcardBarcode"
                                                            value="${bd.bdbar_num}" readonly>
                                                      </div>
                                                      <div>
                                                        
                                                      <input type="text" class="toemailText"
                                                            value="${bdt} ${bd.email}" style="text-align: center; font-weight:bold;
                                                            width: 100%; left:5px; font-size: 15px;" readonly>
                                                      </div>
                                                      

                                                   </div>
                                                </td>
                                                <c:if test="${s.count%3==0 }">
                                                   <tr></tr>
                                                </c:if>
                                             </c:forEach>
                                          </tr>

                                       </table>
                                    </div>
                                 </div>
                                 
                                 
                                 
											
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