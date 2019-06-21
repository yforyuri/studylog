<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String pType = request.getParameter("type");
	String No = request.getParameter("No");
	String uName = request.getParameter("uName");

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
<jsp:forward page="page_a.jsp">
	<jsp:param value="<%=No%>" name="num" />
	<jsp:param value="<%=uName%>" name="username" />
</jsp:forward>
<%
	} else if (pType.equals("b")) {
%>
<jsp:forward page="page_b.jsp">
	<jsp:param value="<%=No%>" name="num" />
	<jsp:param value="<%=uName%>" name="username" />
</jsp:forward>
<%
	} else {
%>
<jsp:forward page="page_c.jsp">
	<jsp:param value="<%=No%>" name="num" />
	<jsp:param value="<%=uName%>" name="username" />
</jsp:forward>
<%
	}
%>