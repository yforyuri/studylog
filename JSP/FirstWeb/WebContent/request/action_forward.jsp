<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

	<%
		request.setAttribute("code", "code-0");
		request.setAttribute("name", request.getParameter("name"));
		request.setAttribute("type", "A-Type");
	%>
</body>
</html>
<jsp:forward page="form2_result.jsp">
	<%-- <jsp:param value="A-Type" name="type" />
	<jsp:param value='<%= request.getParameter("name") %>' name="name"/> --%>
</jsp:forward>