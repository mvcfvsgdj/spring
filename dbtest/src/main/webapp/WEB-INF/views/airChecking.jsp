<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<style>
img {
	width: 100px;
	height: 100px;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<c:forEach var="item" items="${list }">
		<div class="wrap">
			<h2>${item.informCause }</h2>
			<h2>${item.dataTime }</h2>
			<h2>${item.informGrade }</h2>

		</div>
	</c:forEach>
</body>
</html>