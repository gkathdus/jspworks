<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<% 
	String num = request.getParameter("num");
	String regex = "[0-9]+";
	String result = "";
	
	if(num == ""){
		out.println("<script>");
		out.println("alert('숫자를 입력해주세요')");
		out.println("history.back()");
		out.println("</script>");
	}else{
		int n = Integer.parseInt(num);
		
		if(n % 2 == 0){
			result = "짝수";
		}else{
			result = "홀수";
		}
	}
%>

<p>결과는: <%=result %>입니다</p>