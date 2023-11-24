<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.order.domain.OrderDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Show Order</title>
<style>
tr {
	width: 300px;
}
</style>
</head>
<body>
	<h2>주문 목록</h2>


	<c:set var="user" value="${sessionScope.user}" />
	<c:set var="selectedUserList" value="${sessionScope.selectedUser}" />

	<c:if test="${not empty user and not empty selectedUserList}">
		<c:set var="selectedUser" value="${selectedUserList[0]}" />
		<h2>${selectedUser.user_code}:님</h2>

		<table>
			<thead>
				<tr>
					<td>주문 코드</td>
					<td>사용자 코드</td>
					<td>사용자 아이디</td>
					<td>사용자 닉네임</td>
					<td>전화 번호</td>
					<td>게시판 ID</td>
					<td>게시판 제목</td>
					<td>가격</td>
					<td>회원 우편번호</td>
					<td>회원 주소</td>
					<td>상세 주소</td>
					<td>배송 요청</td>
					<td>주문 날짜</td>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${orderList}" var="order">

					<tr>
						<td>${order.order_code}</td>
						<td>${order.user_code}</td>
						<td>${order.user_id}</td>
						<td>${order.user_nickname}</td>
						<td>${order.phone_num}</td>
						<td>${order.board_id}</td>
						<td>${order.board_title}</td>
						<td>${order.board_price}</td>
						<td>${order.member_post}</td>
						<td>${order.member_addr}</td>
						<td>${order.detailed_address}</td>
						<td>${order.delivery_req}</td>
						<td>${order.board_Date}</td>
					</tr>

				</c:forEach>
			</tbody>
		</table>
	</c:if>

</body>
</html>