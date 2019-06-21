<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
* {
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
}

hr {
	margin: 20px auto;
	border: 1px solid black;
}

table {
	border: 0;
	border-collapse: collapse;
	margin: 0 auto;
	line-height: 30px;
	width:500px;
}

table>tbody>tr>td {
	border: 1px solid grey;
	padding: 10px;
}

select {
	height: 25px;
}
table tr:last-child {
	text-align: center;
}
</style>
</head>
<body>
	<h1>Request Form Test</h1>
	<hr>
	<form action="request_result.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="uName"></td>
			</tr>
			<tr>
				<td>직업</td>
				<td><select name="job">
						<option value="none">무직</option>
						<option value="stu">학생</option>
						<option value="prg">프로그래머</option>
				</select></td>
			</tr>
			<tr>
				<td>관심분야</td>
				<td>
				<input type="checkbox" value="java" name="fav"> java 
				<input type="checkbox" value="html5" name="fav"> html5
				<input type="checkbox" value="JSP" name="fav"> JSP
				<input type="checkbox" value="CSS" name="fav"> CSS
				<input type="checkbox" value="j query" name="fav"> j query
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="확인"> <input
					type="reset"></td>
			</tr>
		</table>
	</form>
</body>
</html>