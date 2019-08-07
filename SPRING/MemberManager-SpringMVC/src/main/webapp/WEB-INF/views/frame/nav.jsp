<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="nav">
	<ul>
		<li><a href="<c:url value='/' />">HOME</a></li>
		<li><c:if test="${loginInfo eq null}"><a href="<c:url value='/member/login' />">LOGIN </a></c:if>
		<c:if test="${loginInfo ne null}"><a href="<c:url value='/member/logout.do' />">LOGOUT</a></c:if></li>
		<li><a href="<c:url value='/member/regist' />">JOIN</a></li>
		<li><a href="<c:url value='/member/mypage' />">MYPAGE</a></li>
		<%-- <li><a href="<c:url value='/member/mypage/mypage.do' />">MYPAGE2</a></li> --%>
		<li><a href="<c:url value='/member/memberList' />">LIST</a></li>
		<%-- <li><a href="<c:url value='/member/memberList' />">LIST2</a></li> --%>
	</ul>
</div>