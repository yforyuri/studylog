<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<style>
* {
	padding: 0;
	margin: 0;
	text-align: center;
}
li {
	list-style: none;
	margin:5px;
}
h1 {
	margin: 30px;
}
a, a:visited{
	text-decoration: none;
	color:black;
}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>index page</h1>
	<ul>
		<li><a href="/mvc/hello"> /hello </a></li>
		<li><a href="hello"> /hello </a></li>
		<li><a href="member/login"> /member/login </a></li>
		<li><a href="<c:url value="/member/memberLogin" />">/member/memberLogin </a></li>
		<li><a href="<c:url value="/order/order" />">/order/order</a></li>
		<li><a href="<c:url value="/cookie/makeForm" />">/cookie/makeForm</a></li>
		<li><a href="<c:url value="/cookie/viewCookie" />">/cookie/viewCookie</a></li>
		<li><a href="<c:url value="/header/getHeader" />">/header/getHeader</a></li>
		<li><a href="<c:url value="/search/search" />">/search/search</a></li>
		<li><a href="<c:url value="/fileupload/uploadForm" />">/fileupload/uploadForm</a></li>
		<li><a href="<c:url value="/mail/send" />">/send mail</a></li>
		<li><a href="<c:url value="/mail/send2" />">/send mail2</a></li>
	</ul>
</body>
</html>