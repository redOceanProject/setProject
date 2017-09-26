<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html><head>
<meta charset="utf-8">
<title>Huminity HTML Template | Donate</title>
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
                	
                	<div class="logo-outer">
                    	<a href="index.html"><img class="img-responsive center-block" src="images/logo.png" alt="" title=""></a>
                    </div>
                    
                </div>
            </div>
        </div>
        <!--End Header Upper-->
        
    </header>
    <!--End Main Header -->
    
    
    <!--Donate Section-->
    <section class="donate-section">
    	<div class="auto-container">
            <div class="donate-form-section">
            	
            	<form method="post" action="write" enctype="multipart/form-data">
            	 <div class="text-center">
    				<div>${name}</div>
    			</div>
            	
                <div class="donation-form-outer">
            	
                	
                    <!--Form Portlet-->
                    <div class="form-portlet">
                        <div class="row clearfix">
                        	
                        	<div class="form-group col-lg-12 col-md-12 col-xs-12 clearfix">
                        		<div class="field-label">제목을 입력해주세요.</div>
                             	<input type="text" name = "title" placeholder="제목을 입력해주세요.">
                            </div>
                    
                            
                            <div class="form-group col-lg-6 col-md-6 col-xs-12">
                            	<div class="field-label">목표 헌혈증</div>
                                <input type="text" name="goal_blood" placeholder="예) 10" required>
                            </div>
                            
                            <div class="form-group col-lg-6 col-md-6 col-xs-12">
                            	<div class="field-label">마감날짜</div>
                                <input type="date" name="goal_date" required>
                            </div>
                            
                            <div class="form-group col-lg-6 col-md-6 col-xs-12">
                            	<div class="field-label">대표이미지</div>
                                <input type = "file" name="upload">
                            </div>
                            
                            <div class="form-group col-lg-12 col-md-6 col-xs-12">
                            	<div class="field-label">사연을 입력해주세요.</div>
                                <textarea class = "content" rows="1" cols="30" name="content"></textarea>
                            </div>
                            
                        </div>
                    </div>
                    <div class="text-center"><button type="submit" class="theme-btn btn-style-one">Submit</button></div>
                    
               
            	</div>
                </form>
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