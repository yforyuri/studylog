<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	<h3>
		<c:set var="now" value="<%=new java.util.Date()%>" />
		<fmt:formatDate value="${now}" type="date" dateStyle="full" />
		/
		<fmt:formatDate value="${now}" type="date" dateStyle="short" />
		<br>

		<fmt:formatDate value="${now}" type="time" timeStyle="full" />
		/
		<fmt:formatDate value="${now}" type="time" timeStyle="short" />
		<br>
		<fmt:formatDate value="${now}" type="both" />
		<br>
		<fmt:formatDate value="${now}" type="both" dateStyle="short" />
		<br>
		<fmt:formatDate value="${now}" type="both" dateStyle="full" />
		<br>
		<fmt:formatDate value="${now}" pattern="yy/MM/dd H:mm:ss" />
		<c:forEach var="id" items="<%=java.util.TimeZone.getAvailableIDs()%>">${id}<br/>
		</c:forEach>


	</h3>
	<c:set var="price" value="100000" />
	<c:set var="pi" value="3.141592" />

	<fmt:formatNumber value="${price}" type="number" var="numberType" />

	현재 숫자 : ${numberType}
	<br> 통화 :
	<fmt:formatNumber value="${price}" type="currency" />
	<br> % 표현 :
	<fmt:formatNumber value="${price}" type="percent" groupingUsed="false" />
	/
	<fmt:formatNumber value="${pi}" type="percent" />
	<br> pattern :
	<fmt:formatNumber value="${price}" pattern="00,000,000.00" />
	/
	<fmt:formatNumber value="${pi}" pattern="00,000,000.00" />
</body>
</html>