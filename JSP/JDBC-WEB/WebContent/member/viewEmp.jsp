<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String empno = request.getParameter("empno");
	// int eno = Integer.parseInt(empno);
	// sql문에서 같이 출력  

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	// JDBC url
	String jdbcUrl = "jdbc:mysql://localhost:3306/project?serverTimezone=UTC";
	String user = "root";
	String pw = "admin1111";

	try {
		// 1. load Driver 
		Class.forName("com.mysql.jdbc.Driver");

		// 2. connect DB
		conn = DriverManager.getConnection(jdbcUrl, user, pw);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="../css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<h1>EMP Information</h1>
	<hr>

	<%
		// 3. make 'Statement'
			stmt = conn.createStatement();

			// 사원 리스트를 구하기위한 SQL작성 
			String sql = "select * from emp where empno=" + empno;

			// 4. run SQL
			// select 결과 받기 
			rs = stmt.executeQuery(sql);

			// 5. print result 
			if (rs.next()) {
	%>
	<ul>
		<li>No. : <%=rs.getInt("empno")%></li>
		<li>Name : <%=rs.getString("ename")%></li>
		<li>Job : <%=rs.getString("job")%></li>
		<li>Sal : <%=rs.getInt("sal")%></li>
	</ul>

	<%
		}
	%>
	<a href="editForm.jsp">edit Information</a>
	<a href="empList.jsp">EMP LIST</a>

</body>
</html>
<%
	} catch (ClassNotFoundException ce) {
		ce.printStackTrace();
	} catch (SQLException se) {
		se.printStackTrace();
	} finally {

		// 6. used obj close()
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

			}
		}
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException e) {

			}
		}
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}
	}
%>