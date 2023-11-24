<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.LoginDTO"%>
    <%@ page import="java.util.*"%>
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
    List<LoginDTO> selectedUserList = (List<LoginDTO>) session.getAttribute("selectedUser");
    if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
        LoginDTO selectedUser = selectedUserList.get(0); 
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