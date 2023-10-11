<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML>
<html>

<head>
    <meta charset="utf-8">
</head>
<body>

<div class="container">

    <div class="py-5 text-center">
        <h2>상품등록</h2>
    </div>

    <form  action="/upload/uploadMulti"  method="post"  enctype="multipart/form-data">
        <ul>
        
            <li>상품코드 <input type="text" name="itemId"></li>        
            <li>상품명 <input type="text" name="itemName"></li>        
            <li>이미지들<input type="file" multiple="multiple"  name="imageFiles" ></li>
        </ul>
        <input type="submit"/>
    </form>

</div> <!-- /container -->
</body>
</html>
 