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

 
 <c:set var="path"  value="<%=request.getContextPath() %>" /> 
<!--  <form action="${pageContext.request.contextPath}/paramT1"  method="post"> -->
<form action="${path}/paramT1"  method="post">
<input type="checkbox" name="fruit" value="사과" >사과
<input type="checkbox" name="fruit" value="바나나" >바나나
<input type="checkbox" name="fruit" value="포도" >포도
<input type="checkbox" name="fruit" value="딸기" >딸기
<input type="checkbox" name="fruit" value="자두" >자두

<button>전송</button>

</form>
 
</body>
</html>