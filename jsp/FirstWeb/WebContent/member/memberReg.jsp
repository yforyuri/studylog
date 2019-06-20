<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    String str = new String("member register form");
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
img{
width:300px;
}
</style>
</head>
<body>
<h1><%= str %></h1>
<a href="/web/member/list.jsp">회원리스트</a>
<img alt="버즈!" src="/web/images/buzz.png">
<script>
$(document).ready(function(){
	alert('회원가입 페이지 입니다');
});
</script>
</body>
</html>