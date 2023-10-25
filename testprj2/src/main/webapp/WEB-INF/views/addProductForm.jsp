<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
       <%@ page import="com.test.category.category" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>

</script>
<body>
    <h2>Add Product</h2>
    
    <form action="/prac/products/add" method="post" enctype="multipart/form-data">
        <label for="board_Title">제목:</label>
        <input type="text" id="board_Title" name="board_Title" required><br>

        <label for="board_Price">가격:</label>
        <input type="number" id="board_Price" name="board_Price" required><br>
	  <label for="cate_Area">지역:</label>
        <select name="cate_Area" id="cate_Area">
    <option value="서울">서울</option>
    <option value="인천">인천</option>
    <option value="부산">부산</option>
  </select>
        <label for="cateName">Category:</label>
        <select name="cateName" id="cateName">
            <c:forEach var="cat" items="${category}">
                <option value="${cat.cateCode}">${cat.cateName}</option>
            </c:forEach>
        </select>
  
        <label for="board_Text">내용:</label>
        <textarea id="board_Text" name="board_Text" required></textarea><br>

        <label for="board_Img">이미지:</label>
        <input type="file" id="board_Img" name="file" required><br>

        <button type="submit">Add Product</button>
        <%=request.getRealPath("/") %>
    </form>
</body>
</html>