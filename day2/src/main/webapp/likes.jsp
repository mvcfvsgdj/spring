<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>

$(document).ready(a);

function a(){
	alert(" 문서로드 완료");
	$("#searchBtn").click( function(){
		alert("클릭");
		search();
	});
}


function search(){
	alert("조회");
	$.ajax( {
		type:"GET" , 
		url: "/day2/likes" ,
		success:function(data){
			console.log(data);
			let dataHtml = toHtml(data);
			$("#result").html(dataHtml); 
		},
		error: function(){
			alert( error);
		}
    }); 
}


function toHtml(data){	 
	console.log( data);	
	let str="";
	for( let i=0 ; i< data.length; i++){
		let item = data[i];
		str+= "<div>"+ item +"</div>";  
	}  
	return str;
}


function toHtml2(data){	 
	console.log( data);	 
	data.forEach( function( item ){
		str+= "<div>"+ item  +"</div>";  
	}); 
	return str;
}

function toHtml3(data){	 
	console.log( data);		 
	data.forEach( ( item ) =>{
		str+= "<div>"+ item.id + item.name +"</div>";  
	}); 
	 
	return str;
}
</script>
</head>
<body>
화면이다 !!
<div id="result">
</div>
<button id="searchBtn">좋아하는 드라마</button>
</body>
</html>