<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Products</title>
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
* {
	box-sizing: border-box;
	/*outline: 1px solid gray;*/
}

.product_wrap {
	width: 1000px;
	height: 2000px;
	margin: 0 auto;
}

.sell_Wrap {
	height: 140px;
	width: 650px;
	margin: 0 auto;
	margin-bottom: 5px;
	display: flex;
	border-radius: 10px;
	outline: 1px solid gray;
}

.sell_image_box {
	width: 150px;
	padding: 10px;
}

.sell_image {
	width: 120px;
	height: 120px;
	border-radius: 10px;
	background-color: rgb(245, 239, 239);
	background-size: cover;
}

.sell_content_box {
	width: 100%;
	padding: 15px;
}

.sell_Title_box {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 5px;
}

.sell_address {
	color: gray;
	font-size: 15px;
	margin-bottom: 7px;
}

.sell_price {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 7px;
}

.sell_bottom {
	color: gray;
	position: relative;
}

.sellup_btn {
	height: 40px;
	width: 90px;
	position: absolute;
	right: 0px;
	bottom: 0px;
	border-radius: 5px;
	background-color: rgb(227, 157, 66);
	color: white;
	font-weight: bold;
	border:2px solid gray;
}

.sellup_btn:hover {
	background-color: rgb(212, 137, 39);
}

.sell_a {
	text-decoration: none;
	color: black;
	font-weight: bold;
	overflow: hidden;
	text-overflow: ellipsis;
}
</style>

</head>
<body>
		<div style="width: 650px; margin: 0px auto">
			<h2>나의 판매목록</h2>
		</div>
		<div class="product_wrap"></div>
</body>
<script>
    let user_code = "${user.user_code}";
    let loading = false; // 추가 데이터 로딩 중 여부
    loadPage();
    
    //끌어올리기
    function upEvent(boardId) {
		if (!loading) {
			loading = true;
			$.ajax({
				url: "${path}/products/upEvent",
				type: "POST",
		        data: {
		        	boardId: boardId
		        },
				success: function(data) {
					console.log("끌올");
					loading = false;
					loadPage();
				},
				error: function(error) {
					console.log("Error:", error);
					loading = false;
				}
			});
		}
	}
    //페이지 로드
    function loadPage() {
		if (!loading) {
			loading = true;
			$.ajax({
				url: "${path}/sellList?user_code="+user_code,
				type: "GET",
				success: function(data) {
					console.log("성공");
					let list = data;
					console.log(list);
					let sql = pageToString(list);
					$(".product_wrap").empty();
					$(".product_wrap").append(sql);
				   	
					loading = false;
				},
				error: function(error) {
					console.log("Error:", error);
					loading = false;
				}
			});
		}
	}
    
    //str문 생성
  	function  pageToString(list){
	   	 let str = "";
	   	 list.forEach(  ( item) => { 
	   			str += `     	 
	    	      <div class="sell_Wrap">
	    	        <div class="sell_image_box">
	    	          <div class="sell_image" style="background-image: url('${path}/images/<%="${item.board_img}" %>')"></div>
	    	        </div>
	    	        <div class="sell_content_box">
	    	          <div class="sell_Title_box">
                   <a class="sell_a" href="/testing/products/detail?boardId=<%="${item.board_id}" %>&user_code=<%="${item.user_code}"%>">
                   <%="${item.board_title}"%> </a></div>
	    	          <div class="sell_address"><%="${item.loc_code}"%>/<%="${item.detail_loc}"%> | <%="${item.board_date}"%></div>
	    	          <div class="sell_price"><%="${item.board_price}"%> 원</div>
	    	          <div class="sell_bottom">
	    	            조회 <%="${item.board_click}"%><button id = '<%="${item.board_id}"%>' class = "sellup_btn" onclick = "upEvent('<%="${item.board_id}"%>')">끌어올리기</button>
	    	          </div>
	    	        </div>
	    	      </div>
	   			`;
		});
       return str;
	}
</script>
</html>