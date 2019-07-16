<%@page import="member.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String pType = request.getParameter("type");
	String No = request.getParameter("no");
	String uName = request.getParameter("uname");

	Member member = new Member(uName, pType, No);

	request.setAttribute("result", member);

	session.setAttribute("user", member);

	// request.setAttribute("name", uname);
%>
<!-- 
	pType parameter 값을 비교 null값을 비교
	no parameter 값을 비교 null값을 비교
	uname parameter 값을 비교 null값을 비교 
-->

<c:set value="${param.type}" var="pageType" scope="request" />
<c:if test="${pageType eq null or pageType == ''}">
	<c:set value="a" var="pageType" scope="request" />
</c:if>

<c:set value="${param.no}" var="pNo" scope="request" />
<c:if test="${pNo eq null or pNo == ''}">
	<c:set value="0" var="pNo" scope="request" />
</c:if>

<c:set value="${param.uname}" var="userName" scope="request" />
<c:if test="${userName == null or userName == ''}">
	<c:set value="noname" var="userName" scope="request" />
</c:if>


<%-- <c:if test="${pageType == 'a'}">
	<c:set value="page_a.jsp" var="uri" />
</c:if>
<c:if test="${pageType == 'b'}">
	<c:set value="page_b.jsp" var="uri" />
</c:if>
<c:if test="${pageType == 'c'}">
	<c:set value="page_c.jsp" var="uri" />
</c:if>
 --%>

<c:choose>
	<c:when test="${ pageType == 'a'}">
		<c:set value="page_a.jsp" var="uri" />
	</c:when>
	<c:when test="${ pageType == 'b'}">
		<c:set value="page_b.jsp" var="uri" />
	</c:when>
	<c:when test="${ pageType == 'c'}">
		<c:set value="page_c.jsp" var="uri" />
	</c:when>
	<c:otherwise>
		<c:set value="page_a.jsp" var="uri" />
	</c:otherwise>
</c:choose>

<jsp:forward page="${uri}"/>
<%-- <jsp:forward page="page_${pageType}.jsp" /> --%>


<%
	/* 
		if (pType == null) {
			pType = "a";
		}
	
		if (No == null) {
			No = "0";
		}
	
		if (uName == null) {
			uName = "noname";
		} */

	if (pType.equals("a")) {
%>
<jsp:forward page="page_a.jsp" />
<%
	} else if (pType.equals("b")) {
%>
<jsp:forward page="page_b.jsp" />
<%
	} else {
%>
<jsp:forward page="page_c.jsp" />
<%
	}
%>