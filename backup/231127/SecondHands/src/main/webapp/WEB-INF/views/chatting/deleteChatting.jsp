<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
          <c:set  var="path"   value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>채팅 삭제</title>
</head>
<body>

    <h1>채팅 삭제</h1>
    <% %>
    		<c:forEach items="${chatList}" var="chat">
    

    <form action="${path}/deleteChatting" method="post">
        <label for="chat_code">채팅 코드:</label>
        <input type="text" name="chat_code" id="chat_code" value="${chat.chat_code}" required />
        <button type="submit">채팅 삭제</button>
    </form>
    </c:forEach>

    <form action="${path}/homePage">
        <button type="submit">홈으로 돌아가기</button>
    </form>
</body>
</html>