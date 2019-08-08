<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
</head>
<body>
<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<%@ include file="/WEB-INF/views/frame/header.jsp" %>

	<div id="contents">
		<h2>LIST</h2>
		<hr>
		<div id="search">
			<form>
				search member<br>
				<select name="">
					<option value="both">ID + name</option>
					<option value="id">ID</option>
					<option value="name">name</option>
				</select>
				<input type="text" name="keyword"><input type="submit" value="search">
			</form>
		</div>
		<table>
		<tr>
		<td>no</td>
		<td>ID</td>
		<td>PW</td>
		<td>NAME</td>
		<td>PHOTO</td>
		<td>DATE</td>
		</tr>
		</table>
	</div>
	
	
	
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>
</body>
</html>