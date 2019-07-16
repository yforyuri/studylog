<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pType = request.getParameter("type");
	String No = request.getParameter("No");
	String uName = request.getParameter("uName");
	
	Member member = new Member(uName, pType, No);
	
	request.setAttribute("result", member);
	
	session.setAttribute("user", member);
	
	/* request.setAttribute("name", uname); */

	if (pType == null) {
		pType = "a";
	}

	if (No == null) {
		No = "0";
	}

	if (uName == null) {
		uName = "noname";
	}

	if (pType.equals("a")) {
%>
<jsp:forward page="page_a.jsp"/>
<%
	} else if (pType.equals("b")) {
%>
<jsp:forward page="page_b.jsp"/>
<%
	} else {
%>
<jsp:forward page="page_c.jsp"/>
<%
	}
%>