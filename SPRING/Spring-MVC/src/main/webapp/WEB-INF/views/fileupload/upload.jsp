<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>FILE UPLOAD</h2>
<hr>
<h4>
student number : ${sno} ${report.sno} <br>
report : ${fileName} ${report.fileName} (${fileSize} ${report.fileSize}byte)<br>
</h4>
</body>
</html>