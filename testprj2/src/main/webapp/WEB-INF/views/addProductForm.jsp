<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script>


/*$("#boardImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });*/


</script>
<body>
    <h2>Add Product</h2>
    
    <form action="/prac/products/add" method="post" enctype="multipart/form-data">
        <label for="board_Title">제목:</label>
        <input type="text" id="board_Title" name="board_Title" required><br>

        <label for="board_Price">가격:</label>
        <input type="number" id="board_Price" name="board_Price" required><br>

        <label for="board_Text">내용:</label>
        <textarea id="board_Text" name="board_Text" required></textarea><br>

        <label for="board_Img">이미지:</label>
        <input type="file" id="board_Img" name="file" required><br>

        <button type="submit">Add Product</button>
        <%=request.getRealPath("/") %>
    </form>
</body>
</html>