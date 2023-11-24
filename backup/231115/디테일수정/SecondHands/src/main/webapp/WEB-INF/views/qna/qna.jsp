<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

	table{
		margin: 0 auto;
		width: 400px;
		border: 1px solid black;
		
		
			
	}

</style>




<script>

console.log("ddd=" ${userid});


<c:if test="${not empty param.message}">
	alert("로그인이 필요한 서비스입니다.");
	let result = confirm("로그인 페이지로 이동하시겠습니까?");
	if(result){
		window.location.href='/testing/login';
	}
</c:if>


function prevPage(){
	if(${handler.currentPage} > ${handler.grpSize}){
		window.location.href='/testing/qna?p=${handler.grpStartPage-1 }';
	}else if(${handler.currentPage} <= ${handler.grpSize}){
		alert("첫 페이지입니다.");
		window.location.href='/testing/qna?p=${handler.grpStartPage }';
	}
}

function nextPage(){
	if(${handler.grpEndPage} < ${handler.totalPage}){
		window.location.href='/testing/qna?p=${handler.grpEndPage+1 }';
	}else if(${handler.grpEndPage} == ${handler.totalPage}){
		alert("마지막 페이지입니다.");
		window.location.href='/testing/qna?p=${handler.grpEndPage }';
	}
}

function secret(){
	let userid = ${userid};
	if(userid != null){
		alert("로그인이 필요한 서비스입니다.");
		let result = confirm("로그인 페이지로 이동하시겠습니까?");
		if(result){
			window.location.href='/testing/login';
		}
	}else{
		alert("dslfj");
		console.log("fffff");
		return false;
	}
}


</script>
</head>

<body>




<div>
		<table>
			<c:forEach var="list" items="${list}" >
				<c:choose>
					<c:when test = "${list.q_check eq 't' || userid eq list.q_id}" >
						<tr>
							<td>${list.q_id}
							</td>
							<td>
								<form action="/testing/qna" method="POST">
									<input type="hidden" value="${list.q_code}" name = "code" />
									<input type="submit" value="${list.q_title}" id= "title"/>
								</form>
							</td>	
							<td>${list.q_contents}</td>
							<td>${list.q_date}</td>
							<td>${list.q_time}</td>
						</tr>
					</c:when>
					<c:when test = "${list.q_check eq 'f' }">
						<tr>
							<td>${list.q_id}
							</td>
							<td>
								<form action="/testing/qna" method="POST">
									<input type="hidden" value="${list.q_code}" name = "code" />
									<input type="submit" value="비밀글" id= "title" onclick="return secret()"/>
								</form>
							</td>
							<td>${list.q_contents}</td>
							<td>${list.q_date}</td>
							<td>${list.q_time}</td>
						</tr>
					</c:when>
				</c:choose>
			</c:forEach>
		</table>
</div>



<div>
	<c:set var = "index" value="${handler.grpStartPage }"/>
		<input type="button" value="<<" onclick="window.location.href='/testing/qna?p=1'">
		<input type="button" value="<" onclick="prevPage()">
	
	<c:forEach begin="${handler.grpStartPage }" end="${handler.grpEndPage }" var = "i">
		<a href = "/testing/qna?p=${i }">[${i}]</a>
	</c:forEach>
		<input type="button" value=">" onclick="nextPage()">
		<input type="button" value=">>" onclick="window.location.href='/testing/qna?p=${handler.totalPage}'">
</div>


<div>
	<input type="button" value="글등록" onclick="window.location.href='/testing/qna/reg'">
</div>




</body>


</html>