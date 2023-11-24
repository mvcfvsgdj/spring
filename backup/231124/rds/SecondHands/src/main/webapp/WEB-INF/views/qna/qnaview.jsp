<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
       <c:set  var="path"   value="${pageContext.request.contextPath}"/> 
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	table{
		border:1px solid black;
	}
	tr{
		border:1px solid black;
	}
	
</style>



<script>


function del(n){
	let result = confirm("글을 삭제하시겠습니까?");
	if(result == true){
		alert("정상적으로 처리되었습니다.");
		return true;
	}else{
		return false;
	}
	

};

function idcheck(){
	
	if ('${userImp.q_id}' == '${userid}') {
	    document.getElementById('delete').style.display = 'block';
	    document.getElementById('update').style.display = 'block';
	} else {
	    document.getElementById('delete').style.display = 'none';
	    document.getElementById('update').style.display = 'none';
	}
}


</script>
</head>
<body onload = "idcheck()">


<div>
	<table>
		<tr>
			<td>제목</td>
			<td>
				${userImp.q_title }
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>${userImp.q_contents }</td>
		</tr>
	</table>
	
</div>

<div>
	<form action="${path}/qna" method="get">
		<button> 목록으로 </button>
	</form>
	<form action="${path}/qna/qup" method="get">
		<input type="hidden" value="${userImp.q_code}" name = "code">
		<input type="submit" id ="update" value="수정하기"/>
	</form>
	<form action="${path}/qna/qdel" method="post" >
		<input type="hidden" value="${userImp.q_code}" name="code">
		<input type="submit" onclick="return del(this.form)" id = "delete" value="삭제하기"/>
	</form>
</div>



</body>
</html>