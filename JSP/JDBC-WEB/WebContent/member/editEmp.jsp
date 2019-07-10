<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String empno = request.getParameter("empno");
	String ename = request.getParameter("ename");

	int eno = Integer.parseInt(empno);

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs= null;
	int resultCnt = 0;

	try {
		// 1. load DB
		Class.forName("com.mysql.jdbc.Driver");

		// 2. connect DB
		conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/project?serverTimezone=UTC", "root",
				"admin1111");

		// 3. make  'preparedStatement'
		// SQL for update user info
		String sql = "update emp set ename=? where empno=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, ename);
		pstmt.setInt(2, eno);
		
		// 4. run SQL 
		resultCnt = pstmt.executeUpdate();

		// 5. print result
	} catch (ClassNotFoundException ce) {

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
</head>
<body>

<h1>Edit Name</h1>
<h3><%= resultCnt %> updated! </h3>
<h3><a href="empList.jsp">EMP LIST</a>/h3>
</body>
</html>