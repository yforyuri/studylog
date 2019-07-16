<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	// 브라우저가 서버로 요청할 때 모든 쿠키정보를 함께 전송
	Cookie[] cookies = request.getCookies();
%>
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
<h1>Cookie Data</h1>

<h3>EL을 이용한 cookie 참조</h3>
<h4>name : ${cookie.name.value}</h4>
<h4>id : ${cookie.id.value}</h4>
<h4>email : ${cookie.email.value}</h4>
<h4>code : ${cookie.code.value}</h4>
<hr>


	<%
		if (cookies != null && cookies.length > 0) {
			for (int i = 0; i < cookies.length; i++) {
				
			//	if(cookies[i].getName().equals("name"))
	%>
	<h3>
		<%=cookies[i].getName()%> :
		<%=cookies[i].getValue()%><br>
	</h3>
	<%
		}
		}
	%>
	<a href="editCookie.jsp">edit cookie</a><br>
	<a href="deleteCookie.jsp">delete cookie</a>
</body>
</html>