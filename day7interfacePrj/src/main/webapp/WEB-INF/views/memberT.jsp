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


<form  action ='<c:url  value="/memberT" />'  method="post">
 <input type="text"  name="id">
 <input type="text"  name="name">
 
 <button>등록</button>
</form>
<form  action ='<c:url  value="/deleteT" />'  method="post">
 <input type="text"  name="id">

 
 <button>삭제</button>
</form>

</body>
</html>