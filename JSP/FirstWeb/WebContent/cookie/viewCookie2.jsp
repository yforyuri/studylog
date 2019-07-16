<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 브라우저가 서버로 요청할 때 모든 쿠키정보를 함께 전송
	// Cookie[] cookies = request.getCookies();

	CookieBox cBox = new CookieBox(request);
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
	<h1>Cookie Data</h1>
	
	<h3>
	name : <%= cBox.getValue("name") %>
	nickname : <%=cBox.getValue("nickname") %>
	pw : <%=cBox.getValue("pw") %>
	</h3>
	
	<a href="editCookie2.jsp">edit cookie</a>
	<a href="deleteCookie2.jsp">delete cookie</a>

</body>
</html>