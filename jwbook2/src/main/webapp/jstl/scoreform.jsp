<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>점수 입력</title>
<script>
	function check() {
		//alert("test");
		let form = document.form1;
		let value = form.score.value;
		
		// 값이 입력되지 않았을 때, 문자가 입력됐을 때 처리
		if(score == "" || isNaN(score)){
			alert("숫자를 입력해주세요");
			score.focus();
			return false;
		}else {
			form.submit();
		}
		
	}
</script>
</head>
<body>
	<h3>점수 입력해봐</h3>
	<form action="core02.jsp" method="post">
		<p>점수 <input type="text" name="score">
				<input type="submit" value="전송" onclick="check()"></p>
	</form>
</body>
</html>