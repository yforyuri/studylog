<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
h1 {
	text-align: center;
}

div {
	padding: 10px;
	width: 40%;
	float: left;
}
</style>
</head>
<body>
	<h1>include 지시어</h1>
	<hr>
	<!-- 메뉴시작 -->
	<%@ include file="include/top.jsp"%>
	<!-- 메뉴 끝 -->
	<!-- left 시작 -->
	<%@ include file="include/left.jsp"%>
	<!-- left 끝 -->
	<!-- right 시작 -->
	<%@ include file="include/right.jsp"%>
	<!-- right 끝 -->

	<jsp:include page="include/footer.jsp">
	<jsp:param value="010-1111-2222" name="tel" />
	<jsp:param value="test@test.bit" name="email" />
	</jsp:include>

</body>
</html>