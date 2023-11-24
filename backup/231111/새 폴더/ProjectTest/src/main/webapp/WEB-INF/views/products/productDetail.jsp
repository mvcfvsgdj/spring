<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="com.sh.product.domain.ProductDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	display: flex;
	align-items: center;
	justify-content: center;
	height: 100vh;
	margin: 0;
}

.product-container {
	display: flex;
	border: 1px solid black;
	margin-bottom: 20px;
	padding: 10px;
}

.product-details {
	flex-grow: 1;
}

.product-details div {
	margin-bottom: 10px;
}
#like{
	width: 50px;
	height:50px;
	background-color: white;
	border: none;
}
#likeImg{
	width: 40px;
	height:40px;
}

</style>

<script>
	$(document).ready(
			function() {
				//맨위로 올리기
				$("html, body").animate({
					scrollTop : 0
				}, 400);

				// 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
				$("#myBtn").click(function() {
					$("html, body").animate({
						scrollTop : 0
					}, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
				});

				// 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
				$(".menu-icon").click(function(e) {
					e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
					$(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
				});

				// 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
				$(document.body).click(
						function(e) {
							if (!$(e.target).closest('.menu-container').length
									&& !$(e.target).hasClass('menu-icon')) {
								$(".menu-container").slideUp();
							}
						});
			});
</script>

</head>
<body>

	<%

	ProductDTO product = (ProductDTO) request.getAttribute("product");
	List<ProductDTO> products = (List<ProductDTO>) session.getAttribute("products");
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	List<LoginDTO> selectedUser = (List<LoginDTO>) session.getAttribute("selectedUser");
    List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가

    if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
		LoginDTO firstSelectedUser = selectedUser.get(0);
	%>



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
				value="<%=firstSelectedUser.getUser_code()%>" required> <input
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
				<c:if test="${user != null and selectedUser != null and not selectedUser.empty}">
    <div id="likes">관심 : ${likenum} 개</div>
</c:if>
				</div>
			</div>


		</div>
	</form>

	<c:if test="${owner}">
		<!-- 수정부분 -->
		<form action="/testing/products/update" method="get">
			<input type="hidden" name="user_code1" id="user_code1"
				value="<%=firstSelectedUser.getUser_code()%>" required> <input
				type="hidden" name="user_code3" id="user_code3"
				value="<%=product.getUser_code()%>" required> <input
				type="hidden" name="boardId" value="${product.board_Id}">
			<button type="submit">수정</button>
		</form>
		<!-- 삭제부분 -->
		<form action="/testing/products/delete" method="post">
			<input type="hidden" name="user_code1" id="user_code1"
				value="<%=firstSelectedUser.getUser_code()%>" required> <input
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
			value="<%=firstSelectedUser.getUser_code()%>" required> <input
			type="hidden" name="boardId" value="${product.board_Id}">

	</form>
	<%
	} else {
	// products나 selectedUserList가 비어있을 때 예외 처리
	out.println("상품 정보를 찾을 수 없습니다.");
	}
	%>
	<!-- 관심 버튼 추가 -->
	<button id="like">관심 버튼</button>

	<form action="/testing/scrollHome">
		<button type="submit">상품</button>
	</form>
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
	

	<form action="/testing/order">
		<input type="hidden" name="boardId" value="${product.board_Id}">

	<input type="text" name="sell_code" value="${product.user_code}" required>
		<button type="submit">상품 구매</button>
	</form>

	<form action="/testing/logout" method="post">
		<button type="submit">로그아웃</button>
	</form>

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
</body>
</html>