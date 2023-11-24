<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.order.domain.OrderDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
<h1> kakaoPay api 이용하기 </h1>
 
<form method="post" action="/testing/kakaoPay">

   <input type="hidden" name="boardId" value="${order.board_Id}">
  <input type="text" name="orderCode" value="${order.order_code}">
  <input type="text" name="userNickname" value="${order.user_nickname}">
  <input type="text" name="boardTitle" value="${order.board_title}">
  <input type="text" name="boardPrice" value="${order.board_price}">
  <button>카카오페이로 결제하기</button>
</form>

</body>
</html>