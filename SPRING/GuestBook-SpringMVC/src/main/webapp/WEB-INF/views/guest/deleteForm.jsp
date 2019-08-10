<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<div id="contents">
	<h1>delete message</h1>
	<div id="dbox">
	<form method="post">
		insert password for delete ${param.messageId}th message <br> 
		<input type="hidden" name="messageId" value="${param.messageId}">
		pw <input type="password" name="password" required><br>
		<input type="submit" value="delete">
	</form>
	</div>
</div>
</body>
</html>