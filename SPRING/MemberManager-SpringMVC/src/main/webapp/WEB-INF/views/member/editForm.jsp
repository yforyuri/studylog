<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link href="<c:url value="/css/default.css"/>" rel="stylesheet" type="text/css">
<style>
	#idcheck {
		display: none;
	}
	
	.color_red {
		color : red;
	}
	.color_blue {
		color : blue;
	}
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/frame/header.jsp" %>

<%@ include file="/WEB-INF/views/frame/nav.jsp" %>

<div id="contents">
	<h3>회원가입 페이지</h3>
	<hr>
	<form id="regform" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>아이디(이메일)</td>
				<td>
				<input type="hidden" name="idx" value="${editData.idx}">
				<input type="checkbox" id="idcheck">
				<input type="email" id="id" name="id" required value="${editData.id}"> <span id="idcheckmsg"></span> </td>
				
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pw" required> </td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" required  value="${editData.name}"> </td>
			</tr>
			<tr>
				<td>사진</td>
				<td>저장된 파일 :  ${editData.photo} [삭제는 aJax로 삭제 처리]<br>
					<input type="hidden" name="oldFile" value="${editData.photo}" readonly> name="oldFile" 신규 파일이 없다면 이전 파일 이름을 저장합니다.<br>
					<input type="file" name="photo"> 신규 파일을 업로드하면 기존 파일을 덮어씁니다.
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="회원수정"> </td>
			</tr>
		</table>
	</form>
</div>
 
<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

</body>
</html>