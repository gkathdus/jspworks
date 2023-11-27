<%@page import="addressbook.AddrBook"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록 목록</title>
<link rel="stylesheet" href="../resources/css/style.css">
</head>
<body>
	<jsp:useBean id="abDAO" class="addressbook.AddrBookDAO" scope="application"/>
	<%
		//로그인 안 된 경우 로그인하도록 알림 창 뜨움
		String sessionId = (String)session.getAttribute("sessionId");
		if(session.getAttribute("sessionId") != null){ // 로그인된 경우
			// 세션 가져와서 유지함
			sessionId = (String)session.getAttribute("sessionId");
		}else {
			out.println("<script>");
			out.println("alert('로그인 해')");
			out.println("location.href='loginForm.jsp' ");
			out.println("</script>");
		}
	%>
	<div id="container">
		<h2>주소 목록</h2>
		<hr>
		<p>
			<a href="addrForm.jsp">[주소 추가]</a>&nbsp;&nbsp;
			<a href="logout.jsp">
			
			<span class="accent">
				<b>(<%=session.getAttribute("sessionId") %>님)</b>
			</span>
			[로그 아웃]
			</a>
		</p>
		<table id="tbl_list">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>전화번호</th>
				<th>이메일</th>
				<th>성별</th>
				<th>등록일</th>
				<th>보기</th>
			</tr>
		</thead>
		<tbody>
			<%
				for(int i=0; i<abDAO.getListAll().size(); i++){
					AddrBook addrBook = abDAO.getListAll().get(i);
				
			%>
			<tr>
				<td><%=addrBook.getBnum() %></td>
				<td><%=addrBook.getUsername() %></td>
				<td><%=addrBook.getTel() %></td>
				<td><%=addrBook.getEmail() %></td>
				<td><%=addrBook.getGender() %></td>
				<td><%=addrBook.getRegDate() %></td>
				<td>
					<a href="addrView.jsp?bnum=<%=addrBook.getBnum() %>">
					<button type="button">보기</button>
					</a>
				</td>
			</tr>
			<%
				}
			%>
		</tbody>
		</table>
	</div>
</body>
</html>