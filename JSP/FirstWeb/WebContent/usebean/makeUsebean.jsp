<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="userInfo" class="member.UserInfo" />
<!--
1. 해당 영역(page)에userInfo 이름의 member.UserInfo타입의 객체가 있는지 확인
2. 있다면 현재 지정되어있는 객체를 반환
3. 없다면 UserInfo ui = new member.UserInfo(); 새로운 객체를 생성
3-1. pageCOntext.setAttribute("userInfo", ui); 
 -->

<<jsp:setProperty property="name" value="hot" name="userInfo" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>
<body>
	<%
		userInfo.setId("cool");
	%>
	<%=userInfo.getId()%><br>
	<%=userInfo.getName()%>

</body>
</html>