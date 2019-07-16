<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%
	String id = request.getParameter("id");
	// out.print(id);

	if (!id.equals("admin")) {
		out.print("Y");
	} else {
		out.print("사용할 수 없는 아이디입니다.");
	}
%>