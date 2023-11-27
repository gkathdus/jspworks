<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유효성 검사</title>
<style type="text/css">
   ul li{list-style: none; margin: 10px;}
</style>
<script type="text/javascript">
	function checkForm(){
		let form = document.loginForm;
		let uid = form.uid.value;
		let pw = form.passwd.value;
		
		if(uid == ""){
			alert("아이디를 입력해주세요");
			form.uid.focus();
			return false;
		}else if(pw == "" || pw.length < 8){
			alert("비밀번호는 8자 이상 입력해주세요");
			form.passwd.focus(); // select 대신 focus를 사용하여 커서를 해당 필드로 이동
			return false;
		}else {
			form.submit();
		}
	}
</script>
</head>
<body>
   <form action="loginProcess.jsp" method="post" name="loginForm">
      <ul>
         <li>
            <label for="uid">아이디 </label>
            <input type="text" id="uid" name="uid">
         </li>
         <li>
            <label for="passwd">비밀번호 </label>
            <input type="password" id="passwd" name="passwd">
         </li>
         <li>
            <!-- <input type="submit" value="로그인"> -->
            <button type="button" onclick="checkForm()">로그인</button>
         </li>
      </ul>
   </form>
</body>
</html>