<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>FILE UPLOAD using @RequestParam</h2>
	<hr>
	<form action="upload1" method="post" enctype="multipart/form-data" >
		student number : <input type="text" name="sno">
		file : <input type="file" name="report">
		<input type="submit" value="submit">
	</form>
	<hr>
	
	
	
	<h2>FILE UPLOAD using MultipartHttpServletRequest</h2>
	<hr>
	<form action="upload2" method="post" enctype="multipart/form-data" >
		student number : <input type="text" name="sno">
		file : <input type="file" name="report">
		<input type="submit" value="submit">
	</form>
	<hr>
	
	
	
	<h2>FILE UPLOAD using obj command</h2>
	<hr>
	<form action="upload3" method="post" enctype="multipart/form-data" >
		student number : <input type="text" name="sno">
		file : <input type="file" name="report">
		<input type="submit" value="submit">
	</form>
	<hr>
	
</body>
</html>