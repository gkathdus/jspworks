<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>상품 목록 페이지</title>
</head>
<body>
    <h3>상품 목록</h3>
    <ul>
        <c:forEach var="product" items="${products}">
            <li>${product}</li>
        </c:forEach>
    </ul>
</body>
</html>