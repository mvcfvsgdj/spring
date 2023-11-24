<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
</head>
<body>
    <h2>Product List</h2>
    
    <table border="1">
        <thead>
            <tr>
                <th>제목</th>
                <th>시간</th>
                <th>작성자</th>
                <th>지역</th>
                <th>가격</th>
                <th>게시글</th>
                <th>조회수</th>
                <th>사진</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><a href="/prac/products/detail?boardId=${product.board_Id}">${product.board_Title}</a></td>
                    <td>${product.board_Date}</td>
                    <td>${product.board_Id }</td>
                    <td>${product.loc_code}/${product.detail_loc}</td>
                    <td>${product.board_Price}</td>
                    <td>${product.board_Text}</td>
                    <td>${product.board_Click }</td>
                    <td><img src="<c:url value="/images/${product.board_Img}" />" alt="Product Image" style="max-width: 100px; max-height: 100px;"></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <br>

    <a href="/prac/products/add">Add Product</a>
</body>
</html>