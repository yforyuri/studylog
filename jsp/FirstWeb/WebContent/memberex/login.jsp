<%@page import="util.CookieBox"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String si = request.getParameter("si"); //saveid

	boolean chk = false;

	if (id.equals(pw)) {
		// 쿠키생성 : 사용자 데이터를 저장
		Cookie c1 = CookieBox.createCookie("LOGIN", "SUCCESS", -1);
		response.addCookie(c1);
		Cookie c2 = CookieBox.createCookie("ID", id, -1);
		response.addCookie(c2);

		//checkbox 조건식
		if (si != null && si.equals("on")) {
			Cookie sc = CookieBox.createCookie("sId", id, 60 * 30);
			response.addCookie(sc);
		}else{
			Cookie sc = CookieBox.createCookie("sId", "", 0);
			response.addCookie(sc);
		}
	}
	chk = true;
%>

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
	<%
		if (chk) {
			out.println("<h1>로그인되었습니다</h1>");
			out.println("<a href=\"loginCheck.jsp\">login check</a>");
		} else {
			out.println("<script> alert(\'로그인 실패\'); history.go(-1); </script>");
	%>
	<%
		}
	%>
</body>
</html>