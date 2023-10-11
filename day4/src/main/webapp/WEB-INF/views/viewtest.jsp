<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<script>
	
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach var="item" items="${list}">
		<h2>${item.title }</h2>
		<img src="${item.image}" style="width: 300px; , height: 300px;">
		<a href="${item.link}">링크</a>
		<a href="${item.lprice }">가격
			</p>
	</c:forEach>
</body>
</html>