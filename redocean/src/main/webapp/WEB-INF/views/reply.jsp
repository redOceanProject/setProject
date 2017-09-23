<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>reply</title>
<script type="text/javascript" src="resources/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		alert('gngn');
		//listReply(); // **댓글 목록 불러오기
		listReply2(); // ** json 리턴방식

		// ** 댓글 쓰기 버튼 클릭 이벤트 (ajax로 처리)
		$("#btnReply").click(function() {
			var email = $("#email").val();
			var text = $("#text").val();
			var boardnum = '3';
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

	//Controller방식
	// **댓글 목록1
	function listReply() {
		$.ajax({
			type : "get",
			url : "${path}/reply/list.do?bno=${dto.bno}",
			success : function(result) {
				// responseText가 result에 저장됨.
				$("#listReply").html(result);
			}
		});
	}
	// RestController방식 (Json)
	// **댓글 목록2 (json)
	function listReply2() {
		$.ajax({
			type : "post",
			//contentType: "application/json", ==> 생략가능(RestController이기때문에 가능)
			url : "getreply",
			success : function(result) {
				alert(result);
//				console.log(result);
				var output = "<table>";
				for ( var i in result) {
					output += "<tr>";
					output += "<td>" + result[i].email;
					output += "<br>";
					output += result[i].text + "</td>";
					output += "<tr>";
				}
				output += "</table>";
				$("#listReply").html(output);
			}
		});
	}
</script>
</head>
<body>
	<table>
		<tr>
			<td>이름</td>
			<td>내용</td>
			<td>글쓴 날짜</td>

		</tr>
		<tr>
			<td><input type="text" name="email" id="email" value = "${email }"></td>
			<td><input type="text" name="text" id="text">
			<input type= "hidden" name = "${boardnum}" id = "${boardnum }"></td>
			<td><button type="button" id="btnReply">댓글작성</button></td>
		</tr>
	</table>
	
	
	<div id ="listReply"></div>
</body>
</html>