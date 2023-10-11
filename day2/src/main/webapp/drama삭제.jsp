<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<script>
function delete1(){
	alert("delete");
let name =  $("#name").val();
alert(name);

//$.ajax();
$.ajax({
    type: "DELETE",
    url: "/day2/drama/"+name, //path variable , ?=name
    success: function (data) {
        alert(data);
    },
    error: function () {
      alert("zzqt");
    }
});

}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="text" id="name">

	<button onclick="delete1()">삭제</button>
</body>
</html>