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
</style>
</head>
<body>

<%@ include file="/WEB-INF/views/frame/nav.jsp" %>
<%@ include file="/WEB-INF/views/frame/header.jsp" %>

<div id="contents">
	<h2>Member register page</h2>
	<form id="regform" method="post" enctype="multipart/form-data">
		<table>
			<tr>
				<td>ID</td>
				<td>
				<input type="email" id="id" name="id" required><input type="checkbox" id="idcheck"> <span id="idcheckmsg"></span> </td>
			</tr>
			<tr>
				<td>PW</td>
				<td><input type="password" name="pw" required> </td>
			</tr>
			<tr>
				<td>NAME</td>
				<td><input type="text" name="name" required> </td>
			</tr>
			<tr>
				<td>PHOTO</td>
				<td><input type="file" name="photo"> </td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="JOIN"> </td>
			</tr>
		</table>
	</form>
</div>

<%@ include file="/WEB-INF/views/frame/footer.jsp" %>

<script>
	/* 
	$(document).ready(function(){
		
		$('#uId').focusout(function(){
			
			// aJax 비동기 통신 id 전송 사용 유무에 대한 결과 값을 반환
			
			$.ajax({
				url: 'idCheck.do',
				type: 'get',
				data: {id: $(this).val() },
				success: function(data){
					alert(data);
					
					$('#idcheckmsg').html('');
					$('#idcheckmsg').removeClass('color_red');
					$('#idcheckmsg').removeClass('color_blue');
					
					if(data == 'Y'){
						$('#idcheck').prop('checked', true);
						$('#idcheckmsg').html('사용가능한 멋진 아이디 입니다.');
						$('#idcheckmsg').addClass('color_blue');
					} else {
						$('#idcheck').prop('checked', false);
						$('#idcheckmsg').html('사용중인 아이디 이거나 탈퇴한 아이디 입니다.');
						$('#idcheckmsg').addClass('color_red');
					}
					
				}
			});
			
			$('#regform').submit(function(){
				
				if(!$('#idcheck').prop('checked')){
					alert('아이디 중복확인이 필요합니다.');
					return false;
				}
				
				
			});
			
		});		
		
	});
 */
</script>

</body>
</html> 