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
<h3>write message</h3>
	<div id="wbox">
	<form action="write" method="post">
		<table>
			<tr>
				<td>name</td>
				<td><input type="text" name="guestname"></td>
			</tr>
			<tr>
				<td>pw</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>message</td>
				<td><textarea rows="3" cols="30" name="message"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="write" name="submit"></td>
			</tr>
		</table>
	</form>
	</div>
</div>
</body>
</html>