<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// Cookie c1 = new Cookie("name", "");
	// c1.setMaxAge(0);  //setMaxAge(시간정보 : 초 단위) : 60*60*24*365 => 1년
	Cookie c1 = CookieBox.createCookie("name", "", 0); // 0초 설정은 쿠키 삭제와 같다
	response.addCookie(c1);
	
	// Cookie c2 = new Cookie("code", "");
	// c2.setMaxAge(0);
	Cookie c2 = CookieBox.createCookie("code", "", 0);
	response.addCookie(c2);
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
	<h1>쿠키 정보가 삭제되었습니다.</h1>
	<a href="viewCookie2.jsp">view cookie</a>
</body>
</html>