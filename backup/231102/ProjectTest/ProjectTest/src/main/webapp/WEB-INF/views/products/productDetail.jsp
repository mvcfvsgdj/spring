<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
   <%@ page import="com.sh.login.LoginDTO"%>
   <%@ page import="com.sh.product.domain.ProductDTO"%>
   <%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product Details</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
   <script>
    $(document).ready(function () {
        // 좋아요 토글 및 개수 조회 함수
        function toggleLike(boardId) {
            $.ajax({
                type: 'POST',
                url: '/testing/products/like',
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
</head>
<body>
<%
    LoginDTO user = (LoginDTO) session.getAttribute("user");
    List<LoginDTO> selectedUser = (List<LoginDTO>) session.getAttribute("selectedUser");
    List<ProductDTO> productList = (List<ProductDTO>) session.getAttribute("product");

    if (user != null && selectedUser != null && !selectedUser.isEmpty() && productList != null && !productList.isEmpty()) {
        LoginDTO firstSelectedUser = selectedUser.get(0);
        ProductDTO product = productList.get(0);
%>
    <h2>Welcome, <%= firstSelectedUser.getUser_nickname() %></h2>

    <form action="/testing/products" method="get" enctype="multipart/form-data">
        <!-- 상품 정보 표시 -->
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
                    <td>${product.board_Click}</td>
                    <td>
                        <img src="<c:url value='/images/${product.board_Img}' />"
                            alt="Product Image" style="max-width: 100px; max-height: 100px;">
                    </td>
                    <td>
                        <!-- 좋아요 버튼 및 개수 표시 -->
                        <button id="likeButton">좋아요</button>
                        <span id="likeCount">${product.board_Likes}</span>
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    <input type="text" name="user_code" id="user_code" value="<%= firstSelectedUser.getUser_code() %>" required>
    <input type="text" name="board_id" id="board_id" value="<%= String.valueOf(product.getBoard_Id()) %>" required>
    <!-- 삭제 버튼 추가 -->
    <form action="/testing/products/delete" method="post" enctype="multipart/form-data">
        <button type="submit">삭제</button>
        <input type="hidden" name="boardId" value="${product.getBoard_Id()}">
    </form>

    <form action="/testing/products/update" method="get" enctype="multipart/form-data">
        <button type="submit">수정</button>
        <input type="hidden" name="boardId" value="${product.getBoard_Id()}">
    </form>
<%
    }
%>
</body>
</html>