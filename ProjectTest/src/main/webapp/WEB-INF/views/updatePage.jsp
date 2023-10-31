<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.LoginDTO"%>
<%@ page import="com.sh.address.AddressDTO"%>
<%@ page import="com.acorn.testing.KakaoUserDTO"%>

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
				var roadAddr = data.roadAddress;
				var jibunAddr = data.jibunAddress;
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
#member_post {
	width: 400px;
}

#member_addr {
	width: 400px;
}
</style>
</head>
<body>

 <h2>Welcome Page</h2>
 	
수정페이지

<%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
    if (user != null && selectedUser != null) {
%>

 <form action="/testing/update" method="post">
    <input type="hidden" name="user_code" id="user_code" value="<%= selectedUser.getUser_code() %>" required>

    <input type="hidden" name="user_kakao" id="user_kakao" value="<%= selectedUser.getUser_kakao() %>" required>

    <label for="user_id">User ID:</label>
    <input type="text" name="user_id" id="user_id" value="<%= selectedUser.getUser_id() %>"readonly required>

    <label for="user_pw">Password:</label>
    <input type="password" name="user_pw" id="user_pw" value="<%= selectedUser.getUser_pw() %>"readonly required>

    <label for="address">Address:</label>
    <input type="text" name="address" id="address" value="<%= selectedUser.getAddress() %>" required>

    <label for="phone_num">Phone Number:</label>
    <input type="text" name="phone_num" id="phone_num" value="<%= selectedUser.getPhone_num() %>" required>
<!-- 주소 -->
    <label for="member_post">Member Post:</label>
    <input type="text" name="member_post" id="member_post" value="<%= selectedUser.getMember_post() %>"readonly required>

    <label for="member_addr">Member Address:</label>
    <input type" name="member_addr" id="member_addr" value="<%= selectedUser.getMember_addr() %>"readonly required>
    
    		<button type="button" onclick="findAddr()">주소찾기</button>
    
<!-- 주소 -->
    <label for="detailed_address">Detailed Address:</label>
    <input type="text" name="detailed_address" id="detailed_address" value="<%= selectedUser.getDetailed_address() %>" required>

    <label for="user_birth">Birthdate:</label>
    <input type="text" name="user_birth" id="user_birth" value="<%= selectedUser.getUser_birth() %>"readonly required>

    <label for="user_nickname">Nickname:</label>
    <input type="text" name="user_nickname" id="user_nickname" value="<%= selectedUser.getUser_nickname() %>"readonly required>

    <label for="user_image">User Image:</label>
    <input type="text" name="user_image" id="user_image" value="<%= selectedUser.getUser_image() %>" required>

    <label for="user_heat">User Heat:</label>
    <input type="text" name="user_heat" id="user_heat" value="<%= selectedUser.getUser_heat() %>"readonly required>
  <button type="submit">정보수정하기</button>
</form>





<%
    }
%>

</body>
</html>