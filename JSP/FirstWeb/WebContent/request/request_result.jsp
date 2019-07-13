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

</style>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	%>

	<h1>Request result Form Test</h1>
	<hr>
	<table>
		<tr>
			<td>이름</td>
			<td><%=request.getParameter("uName")%>></td>
		</tr>
		<tr>
			<td>직업</td>
			<td><%=request.getParameter("job")%></td>
		</tr>
		<tr>
			<td>관심분야</td>
			<td>
				<%
					String[] fav = request.getParameterValues("fav");
					if (fav != null) {
						for(int i =0; i<fav.length; i++){
							out.println(fav[i]+"<br>");
						}
					}
				%>
			</td>
		</tr>

	</table>
</body>
</html>