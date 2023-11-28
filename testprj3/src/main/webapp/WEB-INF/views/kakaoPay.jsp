<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <html xmlns:th="http://www.thymeleaf.org">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1> kakaoPay api 이용하기 </h1>
 
	<form method="post" action="/prac/kakaoPay">
        <input type="text"  name="partner_order_id" >
        <input type="text"  name="partner_user_id" >;
        <input type="text"  name="item_name">
        <input type="text"  name="quantity">
        <input type="text"  name="total_amount">
    <button>카카오페이로 결제하기</button>
</form>

</body>
</html>