<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Cookie c1 = CookieBox.createCookie("LOGIN", "", 0);
	response.addCookie(c1);
	Cookie c2 = CookieBox.createCookie("ID", "", 0);
	response.addCookie(c2);
	Cookie sc = CookieBox.createCookie("si", "", 0);
	response.addCookie(sc);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
</style>
</head>
<body>
	<h1>로그아웃되었습니다</h1>
	<a href="loginForm.jsp"></a>
	<a href="loginForm.jsp">로그인 화면으로 돌아가기</a>
</body>
</html>