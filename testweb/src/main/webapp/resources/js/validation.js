		
function checkForm() {
	let form = document.member;
	let id = form.id.value;
	let pw1 = form.passwd.value;
	let pw2 = form.passwd2.value;
	let name = form.name.value;
	
	let regexPw1 = /[0-9]+/; 
	let regexPw2 = /[a-zA-Z]+/; 
	let regexPw3 = /[~!@#$%^&*()_+]+/; 

	let regexName = /^[가-힣]+$/;
	
	if(id.length < 5 || id.length > 12){
		alert("아이디는 5 ~ 12자까지 입력해주세요");
		id.select;
		return false;
	}else if(pw1.length < 7 || !regexPw1.test(pw1) || 
			!regexPw2.test(pw1) || !regexPw3.test(pw1)){
		alert("영문자, 숫자, 특수문자 포함 7자 이상 입력 가능");
		pw1.select;
		return false;
	}else if(pw1 != pw2){
		alert("비밀번호를 동일하게 입력해 주세요");
		pw2.select;
		return false;
	}else if(!regexName.test(name)){
		alert("이름은 숫자로 시작할 수 없습니다.");
		name.select;
		return false;
	}else{
		form.submit(); 
	}	
}
	
function checkId() {
    if (document.getElementById("uid").value == "") {
        alert("아이디를 입력해 주세요");
        document.getElementById("uid").focus();
        return false;
    } else {
        document.member.action = "/joinForm";
        document.member.method = "get";
        document.member.submit();
    }
}