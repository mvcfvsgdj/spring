<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 table{
 width:600px;
 border:1px solid black;
 }
 td{
  border:1px solid black;
 }
</style>
</head>
<body>

<h2>주문정보</h2>

<table>

<c:forEach  var="item" items="${orderList}">
<tr>
<td>${item.goodsNo}</td>
<td>${item.goodsName}</td>
<td>${item.qty}</td>
<td>${item.amount}</td> 
</tr>
 </c:forEach>
</table>

<form  action="/cart/orderFinal" method="post">
<h2>배송지 정보</h2>

<input type="text" name="addr1" >
<input type="text" name="addr2" >
<input type="text" name="tel">
<input type="text" name="name">

<button>결제완료</button>
</form>

</body>
</html>