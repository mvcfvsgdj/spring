<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.LoginDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h2>Welcome Page</h2>
 	
<%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
    if (user != null && selectedUser != null) {
%>
    <h2>Welcome, <%= selectedUser.getUser_nickname() %></h2>
<%
    }
%>
<form action="/testing/myPage" >
<button type="submit">마이페이지이동</button></form>
<form action="/testing/products" >
<button type="submit">상품조회</button></form>
</body>
</html>