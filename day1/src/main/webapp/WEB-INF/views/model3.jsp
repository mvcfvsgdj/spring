<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>

<c:forEach  var= "list" items="${list}">
${list.id}
${list.pw}
</c:forEach>



</body>
</html>
