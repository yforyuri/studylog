<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 쿠키 이름이 name인 쿠키 데이터를 변경
	// 기본 이름의 쿠키 객체를 생성: 새로운 데이터로 등록
	// Cookie c = new Cookie("name", "이강인");
	Cookie c = CookieBox.createCookie("name", "이강인");
	response.addCookie(c);
	
	// Cookie c1 = new Cookie("code", "zero");
	Cookie c1 = CookieBox.createCookie("code", "zero");
	response.addCookie(c1);
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
	<h1>쿠키 정보가 변경되었습니다.</h1>
	<a href="viewCookie2.jsp">view cookie</a>
</body>
</html>