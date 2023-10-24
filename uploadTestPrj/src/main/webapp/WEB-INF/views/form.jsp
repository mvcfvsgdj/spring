<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<form name="frm" action="/cc/upload"  method="post"  enctype="multipart/form-data">

<input type="text"  name="goodsCode">
<input type="text"  name="goodsTitle">
<input type="file" name="file">
<button> 등록</button>

</form>

</body>
</html>