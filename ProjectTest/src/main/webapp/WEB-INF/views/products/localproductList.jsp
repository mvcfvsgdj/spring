<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Local Product List</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<c:set var="user" value="${sessionScope.user}" />
<script>
	let userId = "${user.user_id}";
	console.log("현재 로그인한 사용자 ID: " + userId);
</script>
</head>
<body>
	<c:set var="selectedUserList" value="${sessionScope.selectedUser}" />
	<c:set var="selectedUser" value="${selectedUserList[0]}" />
	<c:set var="detailLoc" value="${sessionScope.detail_loc}" />
	<c:set var="products" value="${sessionScope.products}" />

	<h2>${selectedUser.user_code}님</h2>
	<h2>Local Product List for ${detail_loc}</h2>
	<p>현재 로그인한 사용자 ID: ${user.user_id}</p>

	<table border="1">
		<thead>
			<tr>
				<th>작성자 ID</th>
				<th>제목</th>
				<th>날짜</th>
				<th>닉네임</th>
				<th>지역</th>
				<th>지역(상세)</th>
				<th>가격</th>
				<th>조회수</th>
				<th>이미지</th>
				<th>내용</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="item" items="${products}">
				<tr>
					<td><a
						href="/testing/products/detail?boardId=${item.board_Id}">${item.board_Id}</a></td>
					<td>${item.board_Title}</td>
					<td>${item.board_Date}</td>
					<td>${item.user_nickname}</td>
					<td>${item.loc_code}</td>
					<td>${item.detail_loc}</td>
					<td>${item.board_Price}</td>
					<td>${item.board_Click}</td>
					<td>${item.board_Img}</td>
					<td>${item.board_Text}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>