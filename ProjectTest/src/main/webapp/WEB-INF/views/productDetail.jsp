<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <form action="/testing/products" method="get" enctype="multipart/form-data">
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
                    <td><img src="<c:url value="/images/${product.board_Img}" />"
                            alt="Product Image" style="max-width: 100px; max-height: 100px;">
                    </td>
                </tr>
            </tbody>
        </table>
    </form>
    
	<form action="/testing/products/update" method="get" enctype="multipart/form-data">
    <button type="submit">수정</button>
    <input type="hidden" name="boardId" value="${product.board_Id}">
</form>
    <!-- 삭제 버튼 추가 -->
    <!-- products/delete.jsp -->
    <form action="/testing/products/delete" method="post" enctype="multipart/form-data">
        <button type="submit">삭제</button>
        <input type="hidden" name="boardId" value="${product.board_Id}">
    </form>
    <!-- 좋아요 버튼 추가 -->
   <form action="/testing/products/like" method="post" id="likeForm">
        <button type="button" id="likeButton">좋아요</button>
        <input type="hidden" name="boardId" value="${product.board_Id}">
        <span id="likeCount">${product.board_Likes}</span>
    </form>

 
</body>
</html>