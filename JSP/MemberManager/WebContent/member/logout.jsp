<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 현재 session 객체를 소멸 
	request.getSession(false).invalidate();
	response.sendRedirect(request.getContextPath());
%>