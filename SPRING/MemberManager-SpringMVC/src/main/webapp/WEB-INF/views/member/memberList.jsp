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
<link href="<c:url value="/css/default.css"/>" rel="stylesheet"
	type="text/css">
<style>
table {
	border-collapse: collapse;
	border: 0;
}

td {
	padding: 3px 10px;
	border: 1px solid #999;
}

div#pagingBox {
	overflow: hidden;
	margin-top: 15px;
}

div#pagingBox>div {
	float: left;
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border: 1px solid #333;
	border-radius: 30px;
	margin: 0 5px;
}

div.searchBox {
	margin: 15px 0;
	width: 500px;
	padding: 15px;
	border: 1px solid #333;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/frame/nav.jsp"%>
	<%@ include file="/WEB-INF/views/frame/header.jsp"%>

	<div id="contents">
		<h2>LIST</h2>
		<hr>
		<div class="searchBox">
			<form>
				search member<br> <select name="stype">
					<option value="both">ID + name</option>
					<option value="id">ID</option>
					<option value="name">name</option>
				</select> <input type="text" name="keyword"><input type="submit"
					value="search">
			</form>
		</div>
		<table>
			<tr>
				<td>no</td>
				<td>ID</td>
				<td>PW</td>
				<td>NAME</td>
				<td>PHOTO</td>
				<td>DATE</td>
				<td>MANAGE</td>
			</tr>
			<c:forEach items="${viewData.memberList }" var="memberInfo"
				varStatus="stat">
				<tr>
					<td>
						<%-- ${memberInfo.idx} / ${stat.index } / ${stat.count } / ${viewData.totalCount }/ ${viewData.totalCount-stat.index } --%>
						${viewData.no-stat.index }
					</td>
					<td>${memberInfo.id}</td>
					<td>${memberInfo.pw}</td>
					<td>${memberInfo.name}</td>
					<td><img
						src="<c:url value='/uploadfile/userphoto/${memberInfo.photo}'/>"
						height="30"></td>
					<td><fmt:formatDate value="${memberInfo.regDate}"
							pattern="yyyy.MM.dd" /></td>
					<td><a href="memberEdit?memberId=${memberInfo.idx}">EDIT</a> |
						<a href="#" onclick="delMember(${memberInfo.idx})">DELETE</a></td>
				</tr>
			</c:forEach>
		</table>
		<c:if test="${viewData.totalCount>0 }">
			<div id="pagingBox">
				<c:forEach begin="1" end="${viewData.pageTotalCount }" var="num">
					<div>
						<a href="memberList?p=${num }">${num }</a>
					</div>
				</c:forEach>
			</div>
		</c:if>
	</div>

	<%@ include file="/WEB-INF/views/frame/footer.jsp"%>

<script>
	function delMember(idx) {
		
		if(confirm("삭제하시겠습니까?")){
			location.href = 'memberDelete?memberId='+idx;
		}
		
	}
</script>
</body>
</html>