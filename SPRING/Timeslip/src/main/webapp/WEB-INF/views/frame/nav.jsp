<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">HOME</a></li>
		<c:if test="${loginInfo eq null}"><li><a href="<c:url value='/member/login' />">LOGIN</a></li></c:if>
		<c:if test="${loginInfo eq null}"><li><a href="<c:url value='/member/regist' />">JOIN</a></li></c:if>
		<li><a href="<c:url value='/member/mypage' />">MY PAGE</a></li>
		<c:if test="${loginInfo.id eq 'admin@admin'}"><li><a href="<c:url value='/member/memberList' />">LIST</a></li></c:if>
		<li><a href="<c:url value='#' />">BOARD</a></li>
		<c:if test="${loginInfo ne null}"><li><a href="<c:url value='/member/logout.do' />">LOGOUT</a></li></c:if>
	</ul>
</div>