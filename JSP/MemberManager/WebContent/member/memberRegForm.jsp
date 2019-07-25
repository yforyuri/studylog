<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>

<!-- header -->
<%@ include file="../frame/header.jsp" %>

<!-- nav -->
<%@ include file="../frame/nav.jsp" %>

<!-- con -->
<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<form action="memberReg2.jsp" method="post">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td><input type="email" name="uId" required> </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="uPw" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName" required> </td>
			</tr>
			<tr>
				<td>사진</td>
				<td><input type="file" name="uPhoto"> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원가입"> </td>
			</tr>
		</table>
	</form>
</div>

<!-- footer -->
<%@ include file="../frame/footer.jsp" %>

</body>
</html>