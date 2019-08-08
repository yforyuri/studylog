<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
<style>

</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>
	<div id="contents">
		<h2>My Page</h2>
		<div id="info">
			<img class="mp"src="<c:url value='/uploadfile/userphoto/${loginInfo.photo}' />"><br>
			NAME : ${loginInfo.name} <br> 
			ID   : ${loginInfo.id}<br> 
			DATE : ${loginInfo.regDate}<br>
		</div>
	</div>
	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

</body>
</html>