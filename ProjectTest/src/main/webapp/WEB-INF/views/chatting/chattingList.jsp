<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ page import="java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chatting List</title>
</head>
<body>
	<h1>Chatting List</h1>
	<p>총 ${fn:length(chatList)}개의 채팅이 있습니다.</p>

	<table border="1">
		<tr>
			<th>chat_code</th>
			<th>buy_code</th>
			<th>sell_code</th>
			<th>board_id</th>
		</tr>
		<c:forEach items="${chatList}" var="chat">

			<tr>
				<td>${chat.chat_code}</td>
				<td>${chat.buy_code}</td>
				<td>${chat.sell_code}</td>
				<td>${chat.board_id}</td>

				<td>
					<form action="/testing/inchat" method="post">
						<input type="text" name="chat_code" value="${chat.chat_code}" />
						<button type="submit">채팅</button>
					</form>

					<form action="/testing/deleteChatting" method="post">
						<label for="chat_code">채팅 코드:</label> 
						<input type="text" name="chat_code" id="chat_code" value="${chat.chat_code}" required />
						<label for="buy_code">구매 코드:</label> 
						<input type="text" name="buy_code" id="buy_code" value="${chat.buy_code}" required />
						<button type="submit">채팅 삭제</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>

	<form action="/testing/homePage">
		<button type="submit">메인</button>
	</form>
</body>
</html>