<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ page import="com.sh.login.domain.LoginDTO"%>
          <%@ page import="com.sh.product.domain.ProductDTO"%>
         <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
          <%@ page import="java.util.*"%>
          <c:set  var="path"   value="${pageContext.request.contextPath}"/> 
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<style>{
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
}

header {
	margin: 0 auto;
	background-color: #ff6f0f;
	padding: 10px;
	position: sticky;
	top: 0;
	color: white;
	z-index: 1000;
	text-align: center;
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 100%;
	height: 100px;
	box-sizing: border-box;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

header h2 {
	margin: 0;
	font-size: 24px;
}

.menu-icon {
	order: -1;
	font-size: 24px;
	cursor: pointer;
	margin-right: 20px;
}

header button {
	 margin: 5px 5px; /* 간격을 줄이기 위해 margin 수정 */
	padding: 10px;
	background-color:  #ff6f0f;
	font-weight:bold;
	color: white;
	border: none;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	cursor: pointer;
	/* border-radius: 5px; 모서리 둥글게 */
	transition: background-color 0.3s, color 0.3s;
}

header button:hover {
	background-color: #ff6f0f; 
	color: black;
}

header.menu-open {
	flex-direction: column;
	align-items: flex-start;
}

header.menu-open form {
	display: block;
}

header.menu-open h2 {
	margin-top: 10px;
}

.header-logo {
	display: flex;
}

.header-logo h2 {
	font-size: 32px;
}

.header-btn {
	display: flex;
	margin: 0px 0px 0px 500px;
}

header.menu-open {
	flex-direction: column;
	align-items: flex-start;
}

header.menu-open form {
	display: block;
}

header.menu-open h2 {
	margin-top: 10px;
}

.menu-icon:hover {

	color: black;
}

.menu-container {
	display: none;
	position: fixed;
	top: 100px;
	left: 0;
	width: 20%;
	height: 100%;
	background-color: #f9f9f9;
	z-index: 999;
	background-color: #f9f9f9;
}

.menu-container ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.menu-container li {
	padding: 15px;
	border-bottom: 1px solid #ddd;
}

.menu-container h2 {
	text-decoration: none;
	color: #333;
	font-weight: bold;
	font-size: 18px;
	transition: color 0.3s;
}

.menu-container button {
	color: black;
	background-color: #f9f9f9;
	font-weight: bold;
}

.menu-container Button:hover {
	background-color:#f9f9f9;
	color: #ff6f0f;
}

.menu-container h2:hover {

	color: #ff6f0f;
}</style>
<title>Insert title here</title>
<body>
</head>
<body>

	   <%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   LoginDTO selectedUser = (LoginDTO) session.getAttribute("selectedUser");
   List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
   if (user != null && selectedUser != null) {
      LoginDTO firstSelectedUser = selectedUser; // Assuming you want the first user in the list
   %>
	<header>
		<div class="header-logo">
			<div class="menu-icon">&#9776;</div>
			<form action="${path}/homePage">
			<button type="submit" >Second Hands</button>
		</form>
		</div>

		<div class="menu-container">
			<ul>
			         <li><h2> </h2></li>
				<li>
				   <img src="${path}}/images/<%=firstSelectedUser.getUser_image()%>" style="border-radius: 50%; width: 100px; height: 100px;">
						<h2>
						<%
						if (user != null && selectedUser != null) {
						%>
						Welcome,
						<%=firstSelectedUser.getUser_nickname()%>님
					</h2>
				</li>
				<li>
				            <form action="${path}/myPage" method="post">
               <input type="hidden" name="user_code" value="<%=firstSelectedUser.getUser_code()%>">
                  <button type="submit">마이페이지 이동</button>
               </form>
				</li>
				           		<li>
			<form action="${path}/chattingList" method="post">
						<input type="hidden" name="buy_code" placeholder="채팅 코드 입력"
							value="<%=firstSelectedUser.getUser_code()%>">
						<button type="submit">새 채팅 ${fn:length(chatList)} 개</button>


					</form>
</li>
                       <li>
              <form action="${path}/products/add">
      <button type="submit">게시글작성</button>
   			</form>
   </li>
				<li>
					<form action="${path}/showOrder">
						<button type="submit">주문내역</button>
					</form>
				</li>
				<li>
					<form action="${path}/qna">
						<button type="submit">문의하기</button>
					</form>
				</li>
				<li>
					<form action="${path}/logout" method="post">
						<button type="submit">로그아웃</button>
					</form>
				</li>
				<%
				} else {
				%>
				<li><h2>로그인이 필요한 서비스입니다.</h2></li>
				<li>
					<form action="${path}/login">
						<button type="submit">가입 및 로그인</button>
					</form>
				</li>
				<%
				}
				%>
				
			</ul>
		</div>
		<div class="header-btn">
			 <form action="${path}/scrollHome">
         <button type="submit">중고거래</button>
      </form>
			  <form action="${path}/localproductList" method="post">
               <input type="hidden" name="newLocation" value="${detail_loc}" />
         <button type="submit">동네거래</button>
      </form>
		</div>
		<%
		if (user != null && selectedUser != null) {
		%>
		<div class="header-btn2">
			<form action="${path}/logout" method="post">
				<button type="submit">로그아웃</button>
			</form>
		</div>
		<%
		} else {
		%>
		<form action="${path}/login">
			<button type="submit">로그인</button>
		</form>
		<%
		}
		%>
	<%} %>
	
	</header>
</body>
</html>