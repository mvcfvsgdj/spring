<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
$(document).ready(function(){
	
	// alert("load");
	 $.ajax({
		type:"GET",
		url:"/day4/naverList2",
		dataType:"json",
		success:function(data){
			console.log(data);			
			naver(data);
		},
		error:function(){
			alert("zzqt");
		}
	}); 
});

function naver(items){
	
	console.log( items);
	
	var itemListHTML="";
	
	$.each(items, function(index,list){
		itemListHTML += "<h2>"+ list.title +"</h2>";
		itemListHTML += "<img src='" + list.image + "' style='width: 300px; height: 300px;'>";
		itemListHTML += "<a href='" + list.link + "'>링크</a>";
		itemListHTML += "<a href='" + list.lprice + "'>가격</a>";
	});
	
	alert( itemListHTML);
	$("#itemList").html(itemListHTML);
}

</script>
</head>
<body>
<div id="itemList"></div>
</body>
</html>