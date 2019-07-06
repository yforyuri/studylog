<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userData" class="member.UserInfo" scope="reuquest" />
<!--  request.getAttributr("userData") -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<h1>포워드 된 페이지이고, usebean을 통한 데이터 공유</h1>
	<h1>
		<%=userData%>
	</h1>
</body>
</html>