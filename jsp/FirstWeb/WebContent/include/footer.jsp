<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="footer">
	이메일: <%= request.getParameter("email") %><br> 
	전화번호: <%= request.getParameter("tel") %>
</div>