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
	<form action="page.jsp" method="get">
	
	No <input type="text" name="No" value="0">
	Name <input type="text" name="uName">
	
		Page Type 
		<select name="type">
			<option>선택하세요</option>
			<option value="a">A</option>
			<option value="b">B</option>
			<option value="c">C</option>
		</select> 
		<input type="submit" value="보내기">
		
		
	</form>
</body>
</html>