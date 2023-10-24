<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<!--  서버에  get 방식으로 요청할 때  요청헤더에 정보가 실린다-->
<h3> 서버에  get 방식으로 요청할 때  요청헤더에 정보가 실린다</h3>
<form  action="/tt/formRead1" method="get">

<input type="text"  name="id" >
<input type="text" name="pw" >
<button>보내기</button>
</form>



<!--  서버에 poost 방식으로 요청할 떄 요청바디에 정보가 실린다 -->
<h3> 서버에 poost 방식으로 요청할 떄 요청바디에 정보가 실린다</h3>
<form  action="/tt/formRead2" method="post">
<input type="text"  name="id" >
<input type="text" name="pw" >
<button>보내기</button>
</form>
</body>
</html>>