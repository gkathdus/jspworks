<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="login" class="bean.LoginBean" />
<jsp:setProperty property="uid" name="login"/>
<jsp:setProperty property="passwd" name="login"/>

<% 
	// 아이디나 비번을 입력하지 않았을 때 처리
	String id = request.getParameter("uid");
	String pw = request.getParameter("passwd");
	
	if(id == "" || pw == ""){
		out.println("<script>");
		out.println("alert('아이디나 비밀번호를 입력해주세요')");
		out.println("history.back()");
		out.println("/<script>");
	}else {
		
		boolean result = login.checkUser();
		if(result){
			out.println("로그인 성공");
		}else {
			out.println("로그인 실패");
		}
		
	}

%>

<p>아이디: <%=login.getUid() %></p>
<p>아이디: <%=login.getPasswd() %></p>