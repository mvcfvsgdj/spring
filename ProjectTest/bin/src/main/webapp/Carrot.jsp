<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<script>
	function search() {

		$.ajax({
			type : "GET",
			url : "/ProjectTest/carrot",
			success : function(data) {
				console.log(data);
				let result = toHTML(data);
				$("#result").html(result);
			},
			error : function() {
				alert("error");
			}
		});
	}

	function toHTML(d) {
		console.log(d);
		let str = "<ul>";
		for (let i = 0; i < d.length; i++) {
			let item = d[i];
			str += "<li>" + item.id + " " + item.price + " " + item.info + " "
					+ item.newTime + " " + "</li>";
		}
		str += "</ul>";
		alert(str);

		return str;
	}
</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button onclick="search()">당근조회</button>
	<div id="result"></div>

</body>
</html>