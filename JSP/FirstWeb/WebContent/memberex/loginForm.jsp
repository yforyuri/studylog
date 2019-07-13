<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String sId = "";
	CookieBox cookieBox = new CookieBox(request);
	if(cookieBox.exists("sId")){
 		sId = cookieBox.getValue("sId");
 	}
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
	<h1>LOGIN</h1>
	<hr>
	<form action="login.jsp" method="post">
		ID <input type="text" name="id" value=<%=sId%>> <br> 
		password <input type="password" name="pw"> <br> 
		<input type="checkbox" name="si" id="si"> 아이디 기억하기<br> 
		<input type="submit" value="login">
	</form>
	<br>
	<a href="loginCheck.jsp">login check</a>
</body>
</html>