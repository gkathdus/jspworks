<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ajax 예제</title>
<script src="../resources/js/jquery-3.7.1.js"></script>
<script>
	$(document).ready(function(){
		//alert("test");
		$("h3").css("color", "blue");
	});
	
	// 전송 버튼을 누르면 메시지 박스에 메시지를 출력함
	function fnProcess(){
		// ajax로 구현함
		// 자바 스크립트 객체(key: value)
		// 서블릿에 요청(매핑 주소)
		$.ajax({
			type: "get",
			dataType: "text",
			url: "http://localhost:8080/jwbook2/ajax/ajax1",
			data: {message: "<p>Hello~ Ajax!</p>"}, // message 속성이 서블릿에 전달됨
			success: function(data){ // 서블릿에서 응답이 오면 데이터를 출력함
				$("#message").append(data);
				//$("#message").text(data);
			},
			error: function() {
				alert("에러 발생!");
			}
		});
	}
</script>
</head>
<body>
	<h3>ajax(에이젝스) 텍스트</h3>
	<button type="button" onclick="fnProcess()">전송</button>
	<div id="message"></div>
</body>
</html>