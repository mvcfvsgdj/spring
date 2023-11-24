<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ page import="com.sh.login.domain.LoginDTO"%>
   <%@ page import="com.sh.product.domain.ProductDTO"%>
   <%@ page import="java.util.*" %>
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

 <script>
    $(document).ready(function () {
        // 좋아요 토글 및 개수 조회 함수
        function toggleLike(boardId) {
            $.ajax({
                type: 'POST',
                url: '/testing/products/likes',
                data: { boardId: boardId },
                success: function (data) {
                    if (data.success) {
                        // 성공적으로 처리되었을 때 개수 갱신
                        $('#likeCount').text(data.likeCount);
                    } else {
                        alert('좋아요 처리 중 오류가 발생했습니다.');
                    }
                },
                error: function () {
                    alert('서버와의 통신 중 오류가 발생했습니다.');
                }
            });
        }

        // 좋아요 버튼 클릭 시 토글 함수 호출
        $(document).on('click', '#likeButton', function () {
            var boardId = '${product.board_Id}';
            toggleLike(boardId);
        });
    });
</script>
<body>

<%
List<ProductDTO> products = (List<ProductDTO>) session.getAttribute("products");
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    List<LoginDTO> selectedUserList = (List<LoginDTO>) session.getAttribute("selectedUser");
    if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
        LoginDTO selectedUser = selectedUserList.get(0);
        ProductDTO selectedProduct = products.get(0); 
%>
    <h2><%= selectedUser.getUser_nickname() %>:님</h2>
	<form action="/testing/products" method="get"
		enctype="multipart/form-data">
		<table border="1">
			<thead>
				<tr>
					<th>제목</th>
					<th>작성일</th>
					<th>지역</th>
					<th>가격</th>
					<th>내용</th>
					<th>조회수</th>
					<th>이미지</th>
					<th>좋아요</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>${product.board_Title}</td>
					<td>${product.board_Date}</td>
					<td>${product.loc_code}/${product.detail_loc}</td>
					<td>${product.board_Price}</td>
					<td>${product.board_Text}</td>
					<td>${product.board_Click }</td>
					<td>${likeCount}</td>
					
					<td><img src="<c:url value="/images/${product.board_Img}" />"
						alt="Product Image" style="max-width: 100px; max-height: 100px;">
					</td>
						</tr>
			</tbody>
			
			
		</table>
	</form>
		<form action="/testing/products/likes" method="post" >
	    <input type="text" name="user_code" id="user_code" value="<%= selectedUser.getUser_code() %>" required>
	    <input type="text" name="board_Id" id="board_Id" value="<%= selectedProduct.getBoard_Id() %>" required>
            <button id="likeButton">좋아요 추가</button>
    
    </form>
    
						<!-- 삭제 버튼 추가 -->
					<!-- products/delete.jsp -->
	<form action="/testing/products/delete" method="post" enctype="multipart/form-data">
    <button type="submit">삭제</button>
    <input type="hidden" name="boardId" value="${product.board_Id}">
</form>
			
	
	<form action="/testing/products/update" method="get" enctype="multipart/form-data">
    <button type="submit">수정</button>
    <input type="hidden" name="boardId" value="${product.board_Id}">
</form>
<%} %>

</body>
</html>