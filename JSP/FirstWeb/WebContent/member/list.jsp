<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.Calendar" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
img{
width:300px;
}
</style>
</head>

<body>

	<%
		Calendar c= Calendar.getInstance();
	%>
<h1>회원 리스트 <%= c.get(Calendar.YEAR)%>년<%= c.get(Calendar.MONTH) %>월 <%= c.get(Calendar.DATE) %>일 </h1>
<a href="memberReg.jsp">회원 가입</a>
<img alt="버즈" src="../images/buzz.png">
<a href="file.jsp">파일</a>

</body>
</html>