<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>삭제 페이지</title>
</head>
<body>


<h3>삭제 페이지</h3>

<%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    List<LoginDTO> selectedUserList = (List<LoginDTO>) session.getAttribute("selectedUser");
    if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
        LoginDTO selectedUser = selectedUserList.get(0); 
%>

    <form action="/testing/delete" method="post">
        <input type="hidden" name="user_code" value="<%= selectedUser.getUser_code() %>">
        <input type="hidden" name="user_id" value="<%= selectedUser.getUser_id() %>">

        <p>아래 사용자를 삭제하시겠습니까?</p>
        <p>User ID: <%= selectedUser.getUser_id() %></p>
        <p>Password: <%= selectedUser.getUser_pw() %></p>

        <button type="submit">삭제</button>
    </form>

<%
    }
%>

<form action="/testing/myPage">
    <button type="submit">이전으로</button>
</form>

</body>
</html>