<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html xmlns:th="http://www.thymeleaf.org">
<%@ page import="com.sh.saveUser.domain.UserDTO" %>
<%@ page import="com.sh.address.domain.AddressDTO" %>
<%@ page import="com.sh.login.domain.LoginDTO" %>
<%@ page import="com.sh.product.domain.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
 <c:set var="user" value="${sessionScope.user}" />
    <c:set var="selectedUserList" value="${sessionScope.selectedUser}" />
<%
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	List<LoginDTO> selectedUser = (List<LoginDTO>) session.getAttribute("selectedUser");
	List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
	if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
		LoginDTO firstSelectedUser = selectedUser.get(0);
	%>
   
    
<h1> kakaoPay api 이용하기 </h1>
    <c:forEach items="${products}" var="singleProduct">
    <form method="post" action="/testing/kakaoPayGo1">
    
   <input type="text" name="board_id" value="${singleProduct.board_Id}" readonly>
   <input type="text" name="board_title" value="${singleProduct.board_Title}" readonly>
   <input type="text" id="user_nickname" name="user_nickname" value="${selectedUser.user_nickname}" readonly/>
   <input type="text" name="board_price" value="${singleProduct.board_Price}" readonly>

 	<input id="delivery_req" name="delivery_req" type="text" value="${delivery_req}" >
    <input id="member_post" name="member_post" type="text"  value="${member_post}" readonly>
    <input id="member_addr" name="member_addr" type="text" value="${member_addr}"readonly>
    <input id="detailed_address" name="detailed_address" type="text"  value="${detailed_address}">
    
   <input type="text" id="user_code" name="user_code" value="${selectedUser.user_code}" readonly/>
   <input type="text" id="user_id" name="user_id" value="${selectedUser.user_id}" readonly/>
   <input type="text" id="phone_num" name="phone_num" value="${selectedUser.phone_num}" readonly/>
   <input type="text" name="sell_code" value="${product.user_code}" required>
       
        <button>카카오페이로 결제하기</button>
    </form>
</c:forEach>


<%
	}
	%>
</body>
</html>

  
    
    
    
    