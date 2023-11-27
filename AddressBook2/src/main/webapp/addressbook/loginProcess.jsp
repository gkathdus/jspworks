<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"/>

<%
	String email = request.getParameter("email");
	boolean result = abDAO.checkLogin(email);
	
	if(result){
		session.setAttribute("sessionId", email);
		response.sendRedirect("addrList.jsp");
	}else {
		out.println("<script>");
		out.println("alert('아이디나 비밀번호가 일치하지 않습니다')");
		out.println("history.go(-1)");
		out.println("</script>");
	}
%>