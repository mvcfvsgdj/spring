<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }


        #result {
            margin-top: 20px;
        }
		
		img{
			width: 300px;
			height: 300px;
		}
        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
        text-align:center;
        	background-color:#0240c3;
            margin-bottom: 100px;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 5px;
            color: white;
            font-weight: bold;
        }
    </style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
	function search() {
	
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/airList",
			success : function(data) {
		
	
				let result = toHTML(data);
				$("#result").html(result);

			},
			error : function(err) {
				console.log(err);
				alert("error");
			}
		});
	}

	function toHTML(d) {
		console.log(d);
		let str = "<ul>";
		for (let i = 0; i < d.length; i++) {
			
			let item = d[i];
			  let Image = 'https://i.namu.wiki/i/8dLX29fjOcjoX8cjbjfE-6ajqB_7dUiIMPpJ3E9uwLaCeXqog5k-Irv8wuop_ImN2I05mxHOmRNB_QyG7FMheg.webp';


              // 이미지가 null이면 대체 이미지를 사용
              let img1 = item.img ? item.img : Image;
              let img2 = item.img2 ? item.img2 : Image;
              let img3 = item.img3 ? item.img3 : Image;
              let img4 = item.img4 ? item.img4 : Image;
              let img5 = item.img5 ? item.img5 : Image;
              let img6 = item.img6 ? item.img6 : Image;
              
			str += "<li>" +"<h2>"+ item.informCause
			+"</h2>"+ " " +
			item.dataTime +
			"<br>" +
			item.informGrade 
			+
			"<img src=" + img1  +">"+
			"<img src="+ img2 +">"+
			"<img src="+ img3 +">"+
			"<img src="+ img4 +">"+
			"<img src="+ img5 +">"+
			"<img src=" + img6  +"></li>";
			

		}
		str += "</ul>";


		return str;

	}
</script>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<button onclick="search()">air</button>
	
<div id="result"></div>

</body>
</html>