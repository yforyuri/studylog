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
		<h1>GUESTBOOK</h1>

		<a href="writeForm">✔️write message</a>
		<c:if test="${viewData.messageTotalCount>0}">
			<c:forEach items="${viewData.messageList}" var="message">
				<div id="msgbox">
					no     : ${message.id}<br> 
					writer : ${message.guestname}<br>
					message: ${message.message}<br> 
					<a href="delete?messageId=${message.id}">delete message✔️</a>
				</div>
			</c:forEach>

			<c:forEach begin="1" end="${viewData.pageTotalCount}" step="1"
				var="num">
				<a href="list?page=${num}">${num}</a>
			</c:forEach>
		</c:if>
	</div>
</body>
</html>