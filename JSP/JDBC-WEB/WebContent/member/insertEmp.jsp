<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="member.Emp"/>
<jsp:setProperty property="*" name="member" />
<% 
	Connection conn = null;
	PreparedStatement pstmt = null;
	int resultCnt = 0;

	try {
		// 1. load DB
		//Class.forName("com.mysql.jdbc.Driver");

		// 2. connect DB
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "root", "admin1111");

		// 3. make  'preparedStatement'
		// SQL for update user info
		String sql = "insert into emp (empno, ename, job) values(?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, member.getEmpno());
		pstmt.setString(2, member.getEname());
		pstmt.setString(3, member.getJob());

		
		// 4. run SQL 
		resultCnt = pstmt.executeUpdate();

		// 5. print result
	//} catch (ClassNotFoundException ce) {

	} catch (SQLException se) {

	} finally {
		// 6. close objs
		if (pstmt != null) {
			try {
				pstmt.close();
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
	<h3><%= resultCnt %> updated!</h3>
	<a href="empList.jsp">EMP LIST</a>
</body>
</html>