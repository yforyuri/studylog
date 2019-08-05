<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
div {
	border: 2px solid #333;
	margin: 5px 0px;
	width: 200px;
}
</style>
</head>
<body>

<h1>방명록</h1>

<a href="writeForm">글쓰기</a>
<c:if test="${viewData.messageTotalCount>0}"> 
<c:forEach items="${viewData.messageList}" var="message">
<div>
		메세지 번호 : ${message.id}<br> 
		작성자 : ${message.guestname}<br> 
		메세지 : ${message.message}<br> 
		<a href="delete?messageId=${message.id}">삭제하기</a>
</div>
</c:forEach>

<c:forEach begin="1" end="${viewData.pageTotalCount}" step="1" var="num">
<a href="guestList?page=${num}">[${num}]</a>
</c:forEach>
</c:if>
</body>
</html>