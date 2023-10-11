<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE
html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>Carrot</h2>

	<input type="text" >
	<button>등록</button>
	<table>
		<tr>
			<td>순번</td>
			<td>가격</td>
			<td>정보</td>
			<td>시간</td>
			<td></td>
		</tr>

		<c:forEach var="item" items="${carrotList}">
			<tr>
				<td>${item.id}</td>
				<td>${item.price}</td>
				<td>${item.info}</td>
				<td>${item.newTime}</td>
				<td>
					<button>수정</button>
					<button>삭제</button>
				</td>
			</tr>
		</c:forEach>

	</table>
</body>
</html>