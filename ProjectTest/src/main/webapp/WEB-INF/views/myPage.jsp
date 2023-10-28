<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="com.sh.login.LoginDTO"%>

<!DOCTYPE html>
<html>

<style>
tr ,th, td{
border: 1px solid black;
}
</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <h2>마이페이지</h2>
<%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
    if (user != null && selectedUser != null) {
%>
    <h2> <%= selectedUser.getUser_nickname() %>:님</h2>
    
    <table style="border: 1px solid black;">
        <tr>
            <th>User Code</th>
            <th>User ID</th>
            <th>Password</th>
            <th>Address</th>
            <th>Phone Number</th>
            <th>Member Post</th>
            <th>Member Address</th>
            <th>Detailed Address</th>
            <th>Birthdate</th>
            <th>Nickname</th>
            <th>User Image</th>
            <th>User Heat</th>
        </tr>
        <tr>
            <td><%= selectedUser.getUser_code() %></td>
            <td><%= selectedUser.getUser_id() %></td>
            <td><%= selectedUser.getUser_pw() %></td>
            <td><%= selectedUser.getAddress() %></td>
            <td><%= selectedUser.getPhone_num() %></td>
            <td><%= selectedUser.getMember_post() %></td>
            <td><%= selectedUser.getMember_addr() %></td>
            <td><%= selectedUser.getDetailed_address() %></td>
            <td><%= selectedUser.getUser_birth() %></td>
            <td><%= selectedUser.getUser_nickname() %></td>
            <td><%= selectedUser.getUser_image() %></td>
            <td><%= selectedUser.getUser_heat() %></td>
        </tr>
    </table>
<%
    }
%>
<form action="/testing/update">
<button type="submit">정보수정하기</button></form>

</body>
</html>