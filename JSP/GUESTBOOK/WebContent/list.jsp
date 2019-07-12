
<%@page import="guestbook.model.Message"%>
<%@page import="guestbook.model.MessageListView"%>
<%@page import="guestbook.service.GetMessageService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pageNumberStr = request.getParameter("page");

	int pageNumber = 1;

	if (pageNumberStr != null) {
		pageNumber = Integer.parseInt(pageNumberStr);
	}

	//핵심 처리 할 서비스 객체 
	GetMessageService service = GetMessageService.getInstance();

	//응답 데이터의 결과
	MessageListView viewData = service.getMessageListView(pageNumber);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
div {
	border: 2px solid #333;
	margin: 5px 0px;
	width: 300px;
}
</style>
</head>
<body>
	<h3>방명록 글쓰기</h3>
	<hr>
	<form action="writeMessage.jsp" method="post">
		<table>
			<tr>
				<td>이름</td>
				<td><input type="text" name="guestname"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td>메세지</td>
				<td><textarea rows="3" cols="30" name="message"></textarea></td>
			</tr>
			<tr>
				<td><input type="submit" value="등록" name="submit"></td>
			</tr>
		</table>
	</form>
	<hr>
	<%
		if (viewData.isEmpty()) {
	%>
	<h3>등록된 메세지가 없습니다.</h3>
	<%
		} else {
			for (Message message : viewData.getMessageList()) {
	%>
	<div>
		메세지 번호 : <%=message.getId()%><br> 
		작성자 : <%=message.getGuestname()%><br> 
		메세지 : <%=message.getMessage()%><br> 
		<a href="confirmDeletion.jsp?messageId=<%=message.getId()%>">삭제하기</a>
	</div>
	<%
		}
		}
		//페이지 넘버링: [1][2][3] 형식으로 게시판 페이지 보여주기 
		for (int i = 1; i <= viewData.getPageTotalCount(); i++) {
	%>

	<a href="list.jsp?page=<%=i%>">[<%=i%>] </a>

	<%
		}
	%>
</body>
</html>