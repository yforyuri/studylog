<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Edit Name</h1>
	<hr>
	<form action="editEmp.jsp" method="post">
	No. <input type="text" name="empno" required> <br>
	Name <input type="text" name="ename" required> <br>
	<input type="submit" name="edit">
	</form>
</body>
</html>