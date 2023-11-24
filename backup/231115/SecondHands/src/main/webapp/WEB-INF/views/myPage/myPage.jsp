<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ page import="java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set  var="path"   value="${pageContext.request.contextPath}"/> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<style>
/* 23.11.10 수정완료 */
body {
   margin: 0;
   padding: 0;
   font-family: 'Arial', sans-serif;
   background: #fffae0;
}

header {
   margin: 0 auto;
   background-color: #ff6f0f;
   padding: 10px;
   position: sticky;
   top: 0;
   color: white;
   z-index: 1000;
   text-align: center;
   display: flex;
   justify-content: space-between;
   align-items: center;
   width: 100%;
   height: 100px;
   box-sizing: border-box;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

header h2 {
   margin: 0;
   font-size: 24px;
}

.menu-icon {
   order: -1;
   font-size: 24px;
   cursor: pointer;
   margin-right: 20px; /* 햄버거 아이콘과 Second Hands 텍스트 사이의 간격 조절 */
}

/* 버튼 스타일 */
header button {
   margin: 5px 5px; /* 간격을 줄이기 위해 margin 수정 */
   padding: 10px;
   background-color: #ff6f0f;
   font-weight: bold;
   color: white;
   border: none;
   text-align: center;
   text-decoration: none;
   display: inline-block;
   font-size: 20px;
   cursor: pointer;
   /* border-radius: 5px; 모서리 둥글게 */
   transition: background-color 0.3s, color 0.3s;
}

header button:hover {
   background-color: #ff6f0f;
   color: black;
}

header.menu-open {
   flex-direction: column;
   align-items: flex-start;
}

header.menu-open form {
   display: block;
}

header.menu-open h2 {
   margin-top: 10px;
}

.header-logo {
   display: flex;
}

.header-logo h2 {
   font-size: 32px;
}

.header-btn {
   display: flex;
   margin: 0px 0px 0px 500px;
}

header.menu-open {
   flex-direction: column;
   align-items: flex-start;
}

header.menu-open form {
   display: block;
}

header.menu-open h2 {
   margin-top: 10px;
}

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
   order: -1;
}

/* 햄버거 아이콘 스타일 */
.menu-icon:hover {
   color: black; /* 마우스를 올렸을 때의 색상 변경 */
}

.menu-container {
   display: none;
   position: fixed;
   top: 100px; /* 헤더 높이에 따라 조정하세요 */
   left: 0;
   width: 20%;
   height: 100%;
   background-color: #f9f9f9;
   z-index: 999;
}

.menu-container ul {
   list-style-type: none;
   padding: 0;
   margin: 0;
   text-align: center;
}

.menu-container li {
   padding: 15px;
   border-bottom: 1px solid #ddd; /* 메뉴 항목 간에 경계선 추가 */
}

.menu-container h2 {
   text-decoration: none;
   color: #333;
   font-weight: bold;
   font-size: 18px;
   transition: color 0.3s;
}

.menu-container button {
   color: black;
   background-color: #f9f9f9;
   font-weight: bold;
}

.menu-container Button:hover {
   background-color: #f9f9f9;
   color: #ff6f0f; /* 호버 시 색상 변경 */
}

.menu-container h2:hover {
   color: #ff6f0f; /* 호버 시 색상 변경 */
}

.main-top {
   background: #fffae0;
   /*border: 1px solid black;*/
   display: flex; /* 자식 요소를 가로로 정렬 */
   justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
   align-items: center; /* 수직 정렬 */
   height: 600px;
}

.main-top div {
   width: 50%;
   padding: 20px;
   text-align: center; /* 가운데 정렬 추가 */
}

.main-top div h1 {
   font-weight: bold;
   font-size: 52px;
}

.main-top div p {
   font-size: 22px;
   color: grey;
}

.main-top div a {
   display: inline-block;
   width: 180px;
   height: 25px;
   padding: 15px 20px; /* 텍스트 주변의 여백을 늘림 */
   margin: 10px; /* 각 링크 간의 간격을 늘림 */
   background-color: #ff6f0f; /* 주황색 배경 */
   color: white; /* 흰 글씨 */
   font-size: 18px;
   border-radius: 10px; /* 모서리를 둥글게 설정 */
   text-decoration: none;
   font-weight: bold; /* 텍스트를 두껍게 설정 */
   transition: background-color 0.3s, color 0.3s;
}

.main-top table {
   margin: 0 auto;
   border-collapse: collapse;
   width: 80%;
   background-color: white; /* Set background color to white */
   box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
   /* Add a subtle shadow effect */
}

.main-top th, .main-top td {
   border: 1px solid #ddd; /* Light gray border color */
   padding: 12px;
   text-align: center;
}

.main-top th {
   background-color: #f2f2f2;
   /* Light gray background color for header cells */
}

.main-top td {
   background-color: #fdfdfd;
   /* Slightly off-white background color for data cells */
}

header.menu-open {
   flex-direction: column;
   align-items: flex-start;
}

header.menu-open form {
   display: block;
}

header.menu-open h2 {
   margin-top: 10px;
}

/* 햄버거 아이콘을 화면 왼쪽에 고정 */
.menu-icon {
   order: -1;
}

.main-top div a:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

.main-top img {
   max-width: 100%;
   max-height: 100%;
   width: 650px;
   height: 800px;
}

/*         중간          */
.main-middle {
   border: 1px solid black;
   display: flex; /* 자식 요소를 가로로 정렬 */
   justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
   align-items: center; /* 수직 정렬 */
   height: 800px;
}

.main-middle div {
   width: 50%;
   padding: 20px;
   text-align: start;
}

.main-middle div h1 {
   font-weight: bold;
   font-size: 52px;
}

.main-middle div p {
   font-size: 22px;
   color: grey;
}

.main-middle div a {
   display: inline-block;
   width: 180px;
   height: 25px;
   padding: 15px 20px; /* 텍스트 주변의 여백을 늘림 */
   margin: 10px; /* 각 링크 간의 간격을 늘림 */
   background-color: #ff6f0f; /* #ff6f0f = 주황색 배경 */
   color: white; /* 흰 글씨 */
   font-size: 18px;
   border-radius: 10px; /* 모서리를 둥글게 설정 */
   text-decoration: none;
   font-weight: bold; /* 텍스트를 두껍게 설정 */
   transition: background-color 0.3s, color 0.3s;
}

.main-middle div a:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}

.main-middle img {
   max-width: 100%;
   max-height: 100%;
   width: 650px;
   height: 800px;
}

.main-middle div form {
   margin-top: 10px; /* 필요한 여백 조정 */
}

.main-middle div form button {
   background-color: #ff6f0f;
   color: white;
   padding: 15px 20px;
   border: none;
   border-radius: 10px;
   font-size: 18px;
   font-weight: bold;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

.main-middle div form button:hover {
   background-color: #d55500;
   color: white;
}

.mid-title {
   font-weight: bold;
   color: #ff6f0f; /* 주황색으로 변경 */
}

/* 메인 3 */
.column-wrapper {
   display: flex;
}

.column img {
   margin: 20px;
   width: 156px;
}

.column {
   display: flex;
   flex-direction: column;
   align-items: center;
   justify-content: space-evenly;
   margin-left: 180px;
}

.main3 {
   border: 1px solid black;
   color: black;
   height: 500px;
}

.main4 {
   border: 1px solid black;
   color: red;
   height: 500px;
}

footer {
   background-color: #333;
   padding: 10px;
   color: white;
   text-align: center;
   bottom: 0;
}

#myBtn {
   position: fixed;
   bottom: 20px;
   right: 30px;
   z-index: 99;
   border: none;
   outline: none;
   background-color: #ff6f0f;
   color: white;
   cursor: pointer;
   padding: 15px;
   border-radius: 10px;
}

#myBtn:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}
/* 게이지 스타일링 추가 */
.gauge-container {
   margin-top: 20px;
   text-align: center;
   width: 500px;
   margin-left: 650px;
   margin-top: 80px;
}

.gauge {
   background-color: #ff6f0f; /* 주황색 배경으로 설정 */
   height: 20px;
   width: 0; /* 초기 너비는 0으로 설정 */
   transition: width 1s; /* 너비 변경 시 부드러운 효과를 위한 transition */
   border-radius: 5px; /* 모서리를 둥글게 설정 */
}

.gg {
   height: 20px;
   width: 500px; /* 초기 너비는 0으로 설정 */
   background-color: #d1d0cf;
   border-radius: 5px; /* 모서리를 둥글게 설정 */
}
</style>
<script>
   $(document).ready(
         function() {
            //맨위로 올리기
            $("html, body").animate({
               scrollTop : 0
            }, 400);

            // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
            $("#myBtn").click(function() {
               $("html, body").animate({
                  scrollTop : 0
               }, 400); //속도를 여기서는 400ms로 설정
            });

            // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
            $(".menu-icon").click(function(e) {
               e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
               $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
            });

            // 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
            $(document.body).click(
                  function(e) {
                     if (!$(e.target).closest('.menu-container').length
                           && !$(e.target).hasClass('menu-icon')) {
                        $(".menu-container").slideUp();
                     }
                  });
         });
</script>

<script type="text/javascript"
   src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {
        var heatData = ${updatedUserData};
        var chartData = [['Heat Date', 'User Heat']];

        // 최근 5개 데이터만 선택
        var startIndex = Math.max(heatData.length - 5, 0);
        heatData = heatData.slice(startIndex);

        for (var i = 0; i < heatData.length; i++) {
            var heatDate = new Date(heatData[i].heat_date);
            var userHeat = parseFloat(heatData[i].user_heat);
            chartData.push([heatDate, userHeat]);
        }

        var data = google.visualization.arrayToDataTable(chartData);

        // 최신 5개 데이터의 온도 범위를 기준으로 설정
        var minTemperature = Math.min(...heatData.map(entry => parseFloat(entry.user_heat))) - 2;
        var maxTemperature = Math.max(...heatData.map(entry => parseFloat(entry.user_heat))) + 2;

        // 최신 5개 데이터의 시간을 추출하여 눈금으로 설정
        var timeTicks = heatData.map(entry => new Date(entry.heat_date));

        var options = {
            title: 'Temperature Record',
            subtitle: 'List of temperature evaluations',
            curveType: 'function',
            legend: { position: 'middle' },
            vAxis: {
                viewWindow: {
                    min: Math.max(0, minTemperature), // 최신 5개 데이터의 최소값 - 10 또는 0 중에서 큰 값
                    max: Math.min(100, maxTemperature)  // 최신 5개 데이터의 최대값 + 10 또는 100 중에서 작은 값
                },
                ticks: [36.5, minTemperature, maxTemperature] // 최신 5개 데이터의 최소값과 최대값으로 온도 눈금 설정
            },
            hAxis: {
                format: 'HH:mm',
                gridlines: {count: 10},
                ticks: timeTicks, // 최신 5개 데이터의 시간으로 눈금 설정
                slantedText: true,
                //slantedTextAngle: 45 // 텍스트를 45도 기울임
            }
        };

        var chart = new google.visualization.LineChart(document.getElementById('line_chart'));

        chart.draw(data, options);
    }
</script>







</head>
<body>


	<%
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	List<LoginDTO> selectedUserList = (List<LoginDTO>) session.getAttribute("selectedUser");
	List<Object> chatList = (List<Object>) request.getAttribute("chatList"); // chatList 추가
	%>
	<%
	if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
		LoginDTO selectedUser = selectedUserList.get(0);
	%>



	<header>
		<div class="header-logo">
			<div class="menu-icon">&#9776;</div>
			<form action="/testing/homePage">
				<button type="submit">Second Hands</button>
			</form>
		</div>
		<div class="menu-container">
			<ul>
				<li>
					<h2>
						<%
						if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
						%>
						Welcome,
						<%=selectedUser.getUser_nickname()%>:님
					</h2>
				</li>
				<li><form action="/testing/update">
						<button type="submit">회원정보 수정하기</button>
					</form></li>
				<li>
					<form action="/testing/chattingList" method="post">
						<input type="text" name="buy_code" placeholder="채팅 코드 입력"
							value="<%=selectedUser.getUser_code()%>"> 채팅하러 가기
						<button type="submit">${fn:length(chatList)}개</button>





					</form>
				</li>
				<li>
					<form action="/testing/products/add">
						<button type="submit">게시글작성</button>
					</form>
				</li>
				<li>

					<form action="/testing/showOrder">
						<button type="submit">주문내역</button>
					</form>
				</li>
				<li>
					<form action="/testing/scrollHome">
						<button type="submit">문의하기</button>
					</form>
				</li>

				<li>
					<form action="/testing/logout" method="post">
						<button type="submit">로그아웃</button>
					</form>
				</li>

				<%
				} else {
				%>
				<li><h2>로그인이 필요한 서비스입니다.</h2></li>
				<li>
					<form action="/testing/login">
						<button type="submit">가입 및 로그인</button>
					</form>
				</li>
				<%
				}
				%>
			</ul>
		</div>

		<form action="/testing/products">
			<button type="submit">중고거래</button>
		</form>
		<form action="/testing/scrollHome">
			<button type="submit">동네거래</button>
		</form>
		<%
		if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
		%>
		<form action="/testing/logout" method="post">
			<button type="submit">로그아웃</button>
		</form>
		<%
		} else {
		%>
		<form action="/testing/login">
			<button type="submit">가입 및 로그인</button>
		</form>
		<%
		}
		%>
	</header>

	<%
	if (user != null && selectedUserList != null && !selectedUserList.isEmpty()) {
	%><div>
	<form method="post" action="/testing/updateuserimg" 	enctype="multipart/form-data">
	<img src="${path}/images/<%=selectedUser.getUser_image()%>" style="border-radius: 50%; width: 200px; height: 200px;">
			<input type="file"
				id="user_image" name="file" ><br>
				
				<input type="text" name="user_id" value="<%=selectedUser.getUser_id()%>" />
<button type="submit">수정</button>
</form>
<form method="post" action="/testing/updateusermainimg" >
<input type="hidden" name="user_id" value="<%=selectedUser.getUser_id()%>" />
<input type="text" name="user_image" value="기본_이미지.jpg">
<button type="submit">기본이미지로 변경</button>
</form>
</div>

	<div class="gauge-container">
		<h3>내온도</h3>
		<p><%=selectedUser.getUser_heat()%>℃
		</p>
		<div class="gg">
			<div id="gauge" class="gauge"></div>
		</div>
	</div>

	<div class="main-top">





		<table style="border: 1px solid black;">
			<tr>
				<th>회원번호</th>
				<td><%=selectedUser.getUser_code()%></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=selectedUser.getUser_id()%></td>

			</tr>
			<tr>
				<th>닉네임</th>
				<td><%=selectedUser.getUser_nickname()%></td>
			</tr>
	
			<tr>
				<th>평점</th>
				<td><%=selectedUser.getUser_heat()%></td>
			</tr>
			<tr>
				<th>휴대폰번호</th>
				<td><%=selectedUser.getPhone_num()%></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=selectedUser.getAddress()%></td>
			</tr>
			<tr>
				<th>우편 번호</th>
				<td><%=selectedUser.getMember_post()%></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><%=selectedUser.getMember_addr()%> 상세주소: <%=selectedUser.getDetailed_address()%></td>
			</tr>

			<tr>
				<th>생년월일</th>
				<td><%=selectedUser.getUser_birth()%></td>
			</tr>
		</table>



	</div>

	<!-- 게이지를 나타낼 부분 추가 -->





	<script>
  $(document).ready(function() {
    // 평점 가져오기 (예시로 75로 설정)
    var userHeat = <%=selectedUser.getUser_heat()%>;

    // 게이지 업데이트 함수
    function updateGauge(heat) {
      var percentage = (heat / 100) * 100; // 0부터 100까지의 범위
      $("#gauge").css("width", percentage + "%");

      // 색상 계산 및 적용
      var color = calculateColor(heat);
      $("#gauge").css("background-color", color);
    }

    // 평점에 따른 색상 계산 함수
    function calculateColor(heat) {
      // HSL 모델에서의 색상 계산
      var hue = 120 - (heat / 100) * 120; // 0에서 100을 120에서 0으로 변환
      var saturation = 100; // 포화도는 100%
      var lightness = 50; // 명도는 50%

      // HSL 색상으로 변환
      var color = "hsl(" + hue + ", " + saturation + "%, " + lightness + "%)";

      return color;
    }

    // 페이지 로드 시 게이지 업데이트
    updateGauge(userHeat);
  });
</script>

	<%
	}
	%>
	<%
	}
	%>

   <div id="line_chart" style="width: 900px; height: 500px;"></div>

	<button id="myBtn" title="Go to top">Top</button>
	<footer>
		&copy; 2023 에이콘아카데미 최종프로젝트 <br>
		<p>조장: 김재열</p>
		<p>조원: 김민규</p>
		<p>조원: 김병진</p>
		<p>조원: 이정훈</p>
		<p>조원: 허재혁</p>
	</footer>

</body>
</html>