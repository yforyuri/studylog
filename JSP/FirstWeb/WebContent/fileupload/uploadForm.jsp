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
	<h1>과제 제출</h1>
	<hr>
	<form action="fileUpload.jsp" method="post" enctype="multipart/form-data">
		이름 : <input type="text" name="uName"> <br>
		학번 : <input type="text" name="sNumber"> <br>
		과제 : <input type="file" name="report"> <br>
		<input type="submit" value="upload">

	</form>
</body>
</html>