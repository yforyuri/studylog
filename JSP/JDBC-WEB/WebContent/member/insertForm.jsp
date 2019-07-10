<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>Insert Employee</h1>
	<hr>
	<form action="insertEmp.jsp" method="post">
	<table>
	<tr>
	<td>No. </td>
	<td><input type="text" name="empno" required></td>
	</tr>
	<tr>
	<td>Name</td>
	<td><input type="text" name="ename" required></td>
	</tr>
	<tr>
	<td>Job</td>
	<td><input type="text" name="job" required></td>
	</tr>
	<tr>
	<td colspan="2"><input type="submit" name="submit"></td>
	</tr>
	</table>
	</form>
</body>
</html>