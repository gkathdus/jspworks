<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 	request.setCharacterEncoding("utf-8");
 %>
<title>주소 추가</title>
<link rel="stylesheet" href="../resources/css/style.css">

<!-- AddrBook 클래스의 객체: addrbook(new 한 거임) -->
<jsp:useBean id="addrBook" class="addressbook.AddrBook"/>
<!-- Property의 username: setUsername() 같음-->
<jsp:setProperty property="username" name="addrBook"/>
<jsp:setProperty property="tel" name="addrBook"/>
<jsp:setProperty property="email" name="addrBook"/>
<jsp:setProperty property="gender" name="addrBook"/>
<!-- AddrBookDAO -->
<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"/>
<%
	// 주소 추가
	abDAO.addAddrBook(addrBook);
%>
<div id="container">
	<h2>등록 내용</h2>
	<hr>
	<p>이름: <%=addrBook.getUsername() %> </p>
	<p>전화번호: <%=addrBook.getTel() %> </p>
	<p>이메일: <%=addrBook.getEmail() %> </p>
	<p>성별: <%=addrBook.getGender() %> </p>
	<hr>
	<p><a href="addrList.jsp">목록 보기</a></p>
</div>
</html>