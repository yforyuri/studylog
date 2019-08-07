<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>

<div id="contents">
	<h2>LOGIN</h2>
	<form method="post">
		<table>
			<tr>
				<td>ID</td>
				<td><input type="email" id="id" name="id" required> </td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="LOGIN"> </td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

</body>
</html>