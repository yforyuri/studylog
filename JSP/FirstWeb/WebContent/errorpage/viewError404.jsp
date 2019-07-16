<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>
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
	<h1>
		요청하신 페이지를 찾을 수 없습니다.<br>
		주소를 올바르게 입력해주세요.
	</h1>

	<a href="<%=request.getContextPath()%>">홈으로 이동</a> 
	
	<p>
	에러 타입:<%=exception.getClass().getName()%><br> 
	에러 메시지:<b><%=exception.getMessage()%></b>
	</p>

</body>
</html>