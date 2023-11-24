<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
        <c:set  var="path"   value="${pageContext.request.contextPath}"/> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	/*
	function emptycheck(){
		let title = document.getElementById('title').value;
		let contents = document.getElementById('contents').value;
		let check = document.getElementById('check').value;
		
		if (title == "" ){
			alert('제목을 입력해주세요.');
			return false;
		}else if (contents == ""){
			alert('내용을 입력해주세요.');
			return false;
		}else if (check == ""){
			alert('공개여부를 선택해주세요.');
			return false;
		}else{
			return true;
		}
	}*/
	
	function backcheck(){
		let title = document.getElementById('title').value;
		let contents = document.getElementById('contents').value;
		let check = document.getElementById('check').value;
			
		if(title != "" || contents != "" || check != ""){
			let result = confirm("입력하신 내용을 저장되지 않습니다.\n 삭제하시겠습니까?");
				return result;
			}else{
				return true;
			}
		}
	}
		

</script>
</head>
<body>


<div>
	<form action = "${path}/qna/qup" method="post" >
		<input type= "hidden" value="${user.q_code }" name = "code">
		<table>
			<tr>
				<td>
					<label>제목</label>
				</td>
				<td>
					<input type ="text" name = "title" id = "title" value="${user.q_title}" placeholder="변경할 제목을 입력하세요" required/>
				</td>
			</tr>
			<tr>
				<td>
					<label>내용</label>
				</td>
				<td>
					<input type ="text" name = "contents" id="contents"   value="${user.q_contents}" placeholder="변경할 내용을 입력하세요" required/>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<select name="check" id = "check" required>
						<option value="">선택하세요</option>
						<option value="t">공개</option>
						<option value="f">비공개</option>
					</select>
					<input type="submit" value="글등록하기" onclick="return emptycheck()">
				</td>		
			</tr>
		</table>
	</form>
</div>

<div>
	<form action="${path}/qna" method="get" >
		<input type="submit" value="목록으로" onclick="return backcheck()"/>
	</form>
</div>


</body>
</html>