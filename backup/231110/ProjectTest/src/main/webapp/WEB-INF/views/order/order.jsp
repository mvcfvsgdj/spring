<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sh.saveUser.domain.UserDTO" %>
<%@ page import="com.sh.address.domain.AddressDTO" %>
<%@ page import="com.sh.login.domain.LoginDTO" %>
<%@ page import="com.sh.product.domain.ProductDTO" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script>
        function findAddr() {
            new daum.Postcode({
                oncomplete : function(data) {
                    console.log(data);
                    let roadAddr = data.roadAddress;
                    let jibunAddr = data.jibunAddress;
                    document.getElementById('member_post').value = data.zonecode;
                    if (roadAddr !== '') {
                        document.getElementById("member_addr").value = roadAddr;
                    } else if (jibunAddr !== '') {
                        document.getElementById("member_addr").value = jibunAddr;
                    }
                }
            }).open();
        }
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
    <c:set var="user" value="${sessionScope.user}" />
    <c:set var="selectedUserList" value="${sessionScope.selectedUser}" />

    <c:if test="${not empty user and not empty selectedUserList}">
        <c:set var="selectedUser" value="${selectedUserList[0]}" />
        <h2>${selectedUser.user_code}:님</h2>

        <form id="orderForm" method="post" action="/testing/orderForm">
            <label for="nickname">닉네임:</label><br>
            <input type="text" id="user_nickname" name="user_nickname" value="${selectedUser.user_nickname}" readonly/><br><br>
            <label for="userCode">유저 코드:</label><br>
            <input type="text" id="user_code" name="user_code" value="${selectedUser.user_code}" readonly/><br><br>
            <label for="userCode">유저 아이디:</label><br>
            <input type="text" id="user_id" name="user_id" value="${selectedUser.user_id}" readonly/><br><br>
            <label for="phoneNum">전화번호:</label><br>
            <input type="text" id="phone_num" name="phone_num" value="${selectedUser.phone_num}" readonly/><br><br>   
            <input id="member_post" name="member_post" type="text" placeholder="Zip Code" readonly>
            <input id="member_addr" name="member_addr" type="text" placeholder="Address" readonly><br>
            <label for="detailed_address">상세 주소:</label>
            <input id="detailed_address" name="detailed_address" type="text" placeholder="Detailed Address"><br>
            <button type="button" onclick="findAddr()">주소찾기</button><br>
            <label for="delivery_req">배송 요청:</label>

            <select id="delivery_req" name="delivery_req">
                <option value="특별 요청 없음">배송 시 요청사항을 선택해주세요</option>
                <option value="부재 시 경비실에 맡겨주세요">부재 시 경비실에 맡겨주세요</option>
                <option value="부재 시 택배함에 맡겨주세요">부재 시 택배함에 맡겨주세요</option>
                <option value="문 앞에 놓고 가주세요">문 앞에 놓고 가주세요</option>
                <option value="배송 전 연락 부탁드립니다">배송 전 연락 부탁드립니다</option>
                <option value="파손의 위험이 있는 상품입니다">파손의 위험이 있는 상품입니다</option>
            </select><br><br>

            <c:forEach items="${products}" var="singleProduct">
                <label for="board_id">상품 아이디</label>
                <input type="text" name="board_id" value="${singleProduct.board_Id}" readonly><br><br>
                <label for="board_title">상품 제목</label>
                <input type="text" name="board_title" value="${singleProduct.board_Title}" readonly><br><br>
                <label for="board_price">상품 가격</label>
                <input type="text" name="board_price" value="${singleProduct.board_Price}" readonly><br><br>
            </c:forEach>

            <button type="submit" form="orderForm">주문하기</button>
        </form>

    </c:if>

    <c:if test="${empty user or empty selectedUserList}">
        <p>유저 정보가 없습니다.</p>
    </c:if>

</body>
</html>