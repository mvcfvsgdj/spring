<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<script >
let data = [
	
	{name : '무비', actor:'룡'}, // data 0 
	{name : '무비2', actor:'룡2'}// data 1
	
];

let str="<ui>";

for(let i =0 ; i<data.length; i++){
	let item = data[i];
	str += "<li>"+item.name+"</li>";
}
str +="</ul>";
console.log(data);

let str2=""
data.forEach (function(item){
	str2 += "<li>"+ item.name+"</li>";
});
	alert(str2);

</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>