<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;

	// JDBC url
	String jdbcUrl = "jdbc:mysql://localhost:1521";
	String user = "root";
	String pw = "admin1111";

	try {
		// 1. load Driver 
		// Class.forName("com.mysql.jdbc.Driver");

		// 2. connect DB
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "root", "admin1111");
		System.out.println("mysql 데이터베이스에 접속했습니다.");

		/* 		
		Connection pool 사용시 
		String jdbcDriver = "jdbc:apache:commons:dbcp:pool";
		conn = DriverManager.getConnection(jdbcDriver); */
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
	<h1>EMP LIST</h1>
	<h3>
		<a href="insertForm.jsp">Insert employee</a>
	</h3>
	<hr>
	<table>
		<tr>
			<td>No.</td>
			<td>Name</td>
			<td>Job</td>
		</tr>
		<!--  테이블 행 반복-->
		<%
			// 3. make 'Statement'
				stmt = conn.createStatement();

				// 사원 리스트를 구하기위한 SQL작성 
				String sql = "select * from emp order by empno";

				// 4. run SQL
				// select 결과 받기 
				rs = stmt.executeQuery(sql);

				// 5. print result 
				while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getInt("empno")%></td>
			<td><a href="viewEmp.jsp?empno=<%=rs.getInt("empno")%>"><%=rs.getString("ename")%></a></td>
			<td><%=rs.getString("job")%></td>
		</tr>
		<%
			}
		%>
	</table>
</body>
</html>
<%
	// 	} catch (ClassNotFoundException ce) {
		//		ce.printStackTrace();
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