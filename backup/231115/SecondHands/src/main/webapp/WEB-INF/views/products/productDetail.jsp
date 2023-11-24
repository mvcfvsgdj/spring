<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ page import="java.util.*"%>
<c:set  var="path"   value="${pageContext.request.contextPath}"/> 
<!--${path} -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
body {
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
	margin-right: 20px; /* 햄버거 아이콘과 Second Hands 텍스트 사이의 간격 조절 */
}

/* 버튼 스타일 */
header button {
	margin: 5px 5px; /* 간격을 줄이기 위해 margin 수정 */
	padding: 10px;
	background-color: #ff6f0f;
	font-weight: bold;
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

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
	order: -1;
}

/* 햄버거 아이콘 스타일 */
.menu-icon:hover {
	color: black; /* 마우스를 올렸을 때의 색상 변경 */
}

.menu-container {
	display: none;
	position: fixed;
	top: 100px; /* 헤더 높이에 따라 조정하세요 */
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
	border-bottom: 1px solid #ddd; /* 메뉴 항목 간에 경계선 추가 */
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
	background-color: white; 
	color: #ff6f0f;
}
.menu-container h2:hover {
	color: #ff6f0f; /* 호버 시 색상 변경 */
}

.main-top {
	background: #fffae0;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px; /* 추가된 부분 */
}

.main-top div {
	text-align: center;
}

.main-top div h1 {
	font-weight: bold;
	font-size: 52px;
}

.main-top div p {
	font-size: 22px;
	color: grey;
}

.main-top div a {
	display: inline-block;
	width: 180px;
	height: 25px;
	padding: 15px 20px;
	margin: 10px;
	background-color: #ff6f0f;
	color: white;
	font-size: 18px;
	border-radius: 10px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s;
	margin: 5px 20px -1px 10px;
}

.main-top div a:hover {
	background-color: #d55500;
	color: white;
}

.main-top-form {
	max-width: 100%; /* 수정 */
	margin: 0 auto; /* 추가 */
	height: 800px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.main-top-form label, .main-top-form input {
	display: block;
	margin-bottom: 15px;
}

.main-top-form input[type="checkbox"], .main-top-form button {
	display: inline-block;
	margin-top: 10px;
}

      #saveForm {
    border: 1px solid;
    margin: 20px auto;
    /* HEIGHT: 297PX; */
    width: 650px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
         
        }

#saveForm input {
	width: 96%;
    margin: 9px 0px 15px;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.password-input-container {
    display: flex;
   	position: relative;
    align-items: center;
}



button {
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button:hover {
	background-color: #d55500;
}

#saveForm label,
#saveForm input {
    display: block;
    text-align: left; /* 왼쪽 정렬을 위한 수정 */
}

#saveForm input[type="checkbox"],
#saveForm button {
    display: inline-block;
}




button[type="submit"][form="saveForm"] {
	display: block;
	margin: 20px auto; /* 중앙 정렬 및 아래쪽 여백 조절 */
	padding: 10px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button[type="submit"][form="saveForm"]:hover {
	background-color: #d55500;
}

footer {
	background-color: #333;
	padding: 10px;
	color: white;
	text-align: center;
	bottom: 0;
}

#like{
	width: 50px;
	hetght:50px;
	background-color: white;
	border: none;
}
#likeImg{
	width: 40px;
	height:40px;
}
</style>
</head>
<body>

	<script>
   let loading = false; // 추가 데이터 로딩 중 여부
   let onClick = ${onClick};
   console.log("jsp확인 = " + onClick);
   //좋아요
   function like(boardId, userId) {
       if (!loading) {
           loading = true;
           $.ajax({
               url: "${path}/products/like", // 서버측 엔드포인트 설정
               type: "POST",              
               data: {boardId:boardId,
                     userId:userId
                  },
               success: function (data) {
                   $("#likes").empty();
                   $("#likes").append("관심 : " + data.likenum + " 개");
                    liketoggle();
                   loading = false;
               },
               error: function (error) {
                   console.log("Error:", error);
                   loading = false;
               }
           });
         
      }
   }
   function liketoggle(){
      if(onClick == false){
         $("#like").empty();
         //빈하트
         $("#like").append(`<img id="likeImg" src="${path}/resources/product/heart.png">`);
      }else if(onClick == true){
         $("#like").empty();
         //꽉찬 하트
         $("#like").append(`<img id="likeImg" src="${path}/resources/product/hfull.png">`);
      }
      
   }
   
   $(document).ready(function(){
      liketoggle();
       $("#like").click(function(){
          console.log("토글 " + onClick);
          like(${product.board_Id},"${user.user_id}");
          onClick = !onClick;
       });
       
   });
</script>
	<%
	List<ProductDTO> products = (List<ProductDTO>) session.getAttribute("products");
	List<LoginDTO> selectedUserList = (List<LoginDTO>) session.getAttribute("selectedUser");
	if (selectedUserList != null && !selectedUserList.isEmpty() && products != null && !products.isEmpty()) {
		// 수정: selectedUserList에서 selectedUser 가져오기
		LoginDTO selectedUser = selectedUserList.get(0);

		// 수정: products의 첫 번째 아이템 가져오기
		ProductDTO product = products.get(0);
	%>

<c:if test="${selectedUser[0].user_code ne product.user_code}">
    <form action="/testing/checkCode" method="post">
        Buy Code: <input type="text" name="buy_code" value="${selectedUser[0].user_code}" required><br>
        Sell Code: <input type="text" name="sell_code" value="${product.user_code}" required><br>
        Board Id: <input type="text" name="board_id" value="${product.board_Id}" required><br>
        <button type="submit">채팅신청하기</button>
    </form>
    
        <c:if test="${not empty isCodeValid and isCodeValid eq false}">
    <p style="color: red;">이미 신청한 채팅입니다.</p>
</c:if>
</c:if>

    
    






	<!-- 로그인한 유저 코드와 게시글 작성한 유저 코드가 일치할시 수정/삭제버튼이 나옴 -->
	<c:set var="owner"
		value="${product.user_code  == selectedUser[0].user_code}"></c:set>

	<h2><%=selectedUser.getUser_nickname()%>
		님
	</h2>



	<form action="/testing/products" method="get"
		enctype="multipart/form-data">
		<div>
			<!-- 로그인한 유저 코드와 게시글 유저코드를 불러옴 -->
			<input type="hidden" name="user_code1" id="user_code1"
				value="<%=selectedUser.getUser_code()%>" required> <input
				type="hidden" name="user_code3" id="user_code3"
				value="${product.user_code}" required>

			<div class="product-container">
				<div class="product-image">
					<img src="<c:url value='/images/${product.board_Img}' />"
						alt="Product Image" style="max-width: 500px; max-height: 500px;">
				</div>
				<div class="product-details">
				<div>분류: [${product.board_cate}]</div>
					<div>제목: ${product.board_Title} 작성자: ${product.user_nickname }</div>
					<div>작성일: ${product.board_Date} 조회수: ${product.board_Click}</div>
					<div>지역: ${product.loc_code}/${product.detail_loc}</div>

					<div>내용: ${product.board_Text}</div>
					<div>가격: ${product.board_Price}</div>
				</div>
			</div>


		</div>
	</form>

	<c:if test="${owner}">
		<!-- 수정부분 -->
		<form action="/testing/products/update" method="get">
			<input type="hidden" name="user_code1" id="user_code1"
				value="<%=selectedUser.getUser_code()%>" required> <input
				type="hidden" name="user_code3" id="user_code3"
				value="<%=product.getUser_code()%>" required> <input
				type="hidden" name="boardId" value="${product.board_Id}">
			<button type="submit">수정</button>
		</form>
		<!-- 삭제부분 -->
		<form action="/testing/products/delete" method="post">
			<input type="hidden" name="user_code1" id="user_code1"
				value="<%=selectedUser.getUser_code()%>" required> <input
				type="hidden" name="user_code3" id="user_code3"
				value="<%=product.getUser_code()%>" required> <input
				type="hidden" name="boardId" value="${product.board_Id}">
			<button type="submit">삭제</button>
		</form>
		<form action="/testing/products/updateDate" method="post"
			id="updateDateForm">
			<input type="hidden" name="boardId" value="${product.board_Id}">
			<button type="submit">날짜 갱신</button>
		</form>

	</c:if>
	<form action="/testing/products/likes" method="post">
		<input type="text" name="user_code1" id="user_code1"
			value="<%=selectedUser.getUser_code()%>" required> <input
			type="hidden" name="boardId" value="${product.board_Id}">
		<button id="likeButton">좋아요 추가</button>
	</form>
	<%
	}
	// products나 selectedUserList가 비어있을 때 예외 처리
	
	%>
	<form action="/testing/products">
		<button type="submit">상품</button>
	</form>
	<!-- 관심 버튼 추가 -->
	<button id="like">관심 버튼</button>
	
	<form action="/testing/order">
		<input type="hidden" name="boardId" value="${product.board_Id}">
		<input type="text" name="sell_code" value="${product.user_code}" required>
		<button type="submit">상품 구매</button>
	</form>

	<form action="/testing/logout" method="post">
		<button type="submit">로그아웃</button>
	</form>

</body>
</html>