<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String ctgy = request.getParameter("ctgy");

	if (ctgy.equals("1")) {
%>
<ul>
	<l1>회사소개</l1>
	<l1>회사위치</l1>
</ul>
<%
	} else if(ctgy.equals("2")){
%>
<ul>
<li>서비스소개</li>
<li>소개</li>
</ul>
<%
	}
%>