<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<form method="post">
	상품 1 - id : <input type="text" name="orderItes[0].itemId">
	상품 1 - 수 : <input type="text" name="orderItems[0].number">
	상품 1 - 주의 : <input type="text" name="orderItems[0].remark">
	<br>
	상품 2 - id : <input type="text" name="orderItems[1].itemId">
	상품 2 - 수 : <input type="text" name="orderItems[1].number">
	상품 2 - 주의 : <input type="text" name="orderItems[1].remark">
	<br>
	상품 3 - id : <input type="text" name="orderItems[2].itemId">
	상품 3 - 수 : <input type="text" name="orderItems[2].number">
	상품 3 - 주의 : <input type="text" name="orderItems[2].remark">
	<br>
	배송지 <br>
	우편번호 : <input type="text" name="address.zipcode">
	주소1 : <input type="text" name="address.address1">
	주소2 : <input type="text" name="address.address2">
	<br>
	<input type="submit" value="주문">
	</form>
</body>
</html>