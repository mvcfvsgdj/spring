<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
          <table border="1">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Time</th>
                    <th>Price</th>
                    <th>Description</th>
                    <th>조회수</th>
                    <th>Image</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>${product.board_Title}</td>
                    <td>${product.board_Date}</td>
                    <td>${product.board_Price}</td>
                    <td>${product.board_Text}</td>
                     <td>${product.board_Click }</td>
                     <td>
                        <img src="<c:url value="/images/${product.board_Img}" />" alt="Product Image" style="max-width: 100px; max-height: 100px;">
                    </td>
                </tr>
            </tbody>
        </table>


</body>
</html>