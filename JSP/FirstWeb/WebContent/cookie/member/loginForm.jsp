<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	ID <input type="text" name="id"> <br> 
	password <input type="password" name="pw"> <br>
	<input type="submit" value="login">
	</form>
	<br>
	<a href="loginCheck.jsp">login check</a>
</body>
</html>