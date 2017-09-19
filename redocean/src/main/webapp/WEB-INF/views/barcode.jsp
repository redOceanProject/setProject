<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix ="c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix ="fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix ="fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<link rel="stylesheet" href="./resources/css/style_barcode.css" />
<script type="text/javascript" src="./resources/js/jquery_barcode.js"></script>
<script type="text/javascript" src="./resources/js/barcode.js"></script>
<script type="text/javascript" src = "./resources/js/jquery-3.2.1.min.js"></script>
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

<div id="barcode">
	<video id="barcodevideo" autoplay></video>
	<canvas id="barcodecanvasg" ></canvas>
</div>
<canvas id="barcodecanvas" ></canvas>
<div id="">
<form action="findinfo" id='findinfo' method="post">
<input type= "text" id = "result" value="" name = "num">
<input type ="submit" value = "확인" >&nbsp;
<input type="reset" value="다시 스캔" >
</form>
</div>

</body>
</html>