<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H2>GET</H2>
<form action="/day4/formRegisterGet" method="get">
<input type="text" name="id" required> 
<input type="text" name="pw" required> 
<button>등록</button>
</form>
<H2>POST</H2>
<form action="/day4/formRegisterPost" method="post">
<input type="text" name="id" required> 
<input type="text" name="pw" required> 
<button>등록</button>
</form>

</body>
</html>