<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<script >
function register(){
	//alert("df");
let name =  $("#name").val();
let actor = $("#actor").val();
let drama = {name:name , actor:actor};
let dramas =JSON.stringify(drama);
console.log(dramas);
console.log(name);
console.log(actor);


//$.ajax();
$.ajax({
    type: "post",
    url: "/day2/drama",
    data: dramas,
    contentType: "application/json",
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
<input type="text" id="actor">
<button onclick=register()>등록</button>
</body>
</html>