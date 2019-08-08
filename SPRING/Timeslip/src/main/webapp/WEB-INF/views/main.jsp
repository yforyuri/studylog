<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<c:if test="${loginInfo ne null}"><%@ include file="/WEB-INF/views/frame/nav.jsp" %></c:if>
<div id="main">
<%@ include file="/WEB-INF/views/frame/header.jsp" %>
<div class="mbtn">
<c:if test="${loginInfo eq null}"><a href="<c:url value="/member/regist" />"><input type="button" value="JOIN"></a></c:if>
<c:if test="${loginInfo eq null}"><a href="<c:url value="/member/login" />"><input type="button" value="LOGIN"></a></c:if>
</div>
</div>
</body>
</html>