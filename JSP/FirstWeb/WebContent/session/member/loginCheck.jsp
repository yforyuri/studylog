<%@page import="member.LoginInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//세션에 저장되어있는 id 받기.
	//String id = (String)session.getAttribute("id");
	LoginInfo loginInfo = (LoginInfo)session.getAttribute("LoginInfo");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style></style>
</head>
<body>
		<%
			if(loginInfo != null) {
		%>
			<h1><%= loginInfo.getName() %>님 로그인 상태입니다.</h1>
			<h3>
				id = <%= loginInfo.getId() %> <br>
				nickname = <%= loginInfo.getNickname() %> <br>
				grade = <%= loginInfo.getGrade() %> <br>
				photo = <%= loginInfo.getPhoto() %> <br>
				phone = <%= loginInfo.getpNum() %> <br>

			</h3>
					
			<a href="logout.jsp">logout</a>	
		<%	} else { %>
		<script>
			alert('로그인이 필요한 페이지 입니다.\n로그인 페이지로 이동합니다. ');
			location.href = 'loginForm.jsp';
		</script>
		<%	} %>
</body>
</html>