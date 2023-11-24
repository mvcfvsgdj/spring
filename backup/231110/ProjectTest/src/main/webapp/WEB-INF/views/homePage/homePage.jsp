<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.kakaologin.domain.KakaoUserDTO"%>
<%@ page import="com.sh.saveUser.domain.UserDTO"%>
<%@ page import="java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style>
/* 23.11.10 수정완료 */
body {
	margin: 0;
	padding: 0;
	font-family: 'Arial', sans-serif;
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
	background-color:  #ff6f0f;
	font-weight:bold;
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
	
	color : black ;
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


.header-logo{

display: flex;

}
.header-logo h2{
font-size: 32px;
}

.header-btn{
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
.menu-container button{
color: black;
background-color:   #f9f9f9;
font-weight: bold;
}
.menu-container Button:hover {
	
	color: #ff6f0f; /* 호버 시 색상 변경 */
}
.menu-container h2:hover {
	color: #ff6f0f; /* 호버 시 색상 변경 */
}






.main-top {
	background: #fffae0;
	border-bottom: 1px solid #ddd;
	display: flex; /* 자식 요소를 가로로 정렬 */
	justify-content: space-between; /* 자식 요소 간의 간격을 최대화하여 정렬 */
	align-items: center; /* 수직 정렬 */
	height: 800px;
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
	margin: 5px 20px -1px 10px;
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
	border-bottom: 1px solid #ddd;
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
	border-bottom: 1px solid #ddd;
	color: black;
	height: 500px;
}

.main4 {
	border-bottom: 1px solid #ddd;
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
</style>

<script>
    $(document).ready(function() {
        //맨위로 올리기
        $("html, body").animate({
            scrollTop : 0
        }, 400);

        // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
        $("#myBtn").click(function() {
            $("html, body").animate({
                scrollTop : 0
            }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
        });

        // 햄버거 아이콘을 클릭할 때마다 메뉴의 가시성을 토글
        $(".menu-icon").click(function(e) {
            e.stopPropagation(); // 햄버거 아이콘을 클릭한 경우, document.body의 클릭 이벤트 전파 방지
            $(".menu-container").slideToggle(); // 부드러운 전환을 위해 slideToggle 사용
        });

        // 문서 클릭 이벤트: 메뉴 영역이나 아이콘 외부를 클릭하면 메뉴 숨김
        $(document.body).click(function(e) {
            if (!$(e.target).closest('.menu-container').length && !$(e.target).hasClass('menu-icon')) {
                $(".menu-container").slideUp();
            }
        });
    });
</script>
</head>
<body>

	<%
   LoginDTO user = (LoginDTO) session.getAttribute("user");
   List<LoginDTO> selectedUser = (List<LoginDTO>) session.getAttribute("selectedUser"); %>



	<header>
		<div class="header-logo">
		<div class="menu-icon">&#9776;</div>
		<form action="/testing/homePage">
			<button type="submit" >Second Hands</button>
		</form></div>
		
		<!-- 햄버거 아이콘 추가 -->
<div class="menu-container">
    <ul>
        <li>
            <h2>
                <% if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
                    LoginDTO firstSelectedUser = selectedUser.get(0);
                %>
                    Welcome,
                    <%=firstSelectedUser.getUser_nickname()%>님
                </h2>
            </li>
            <li>
                <form action="/testing/myPage">
                    <button type="submit">마이페이지 이동</button>
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
        <% } else { %>
        <li><h2>로그인이 필요한 서비스입니다.</h2></li>
            <li>
                <form action="/testing/login">
                    <button type="submit">가입 및 로그인</button>
                </form>
            </li>
        <% } %>
    </ul>
</div>
	<div class="header-btn">
		<form action="/testing/products">
			<button type="submit">중고거래</button>
		</form>
		<form action="/testing/scrollHome">
			<button type="submit">동네거래</button>
		</form>
		<form action="/testing/scrollHome">
			<button type="submit">동네인증</button>
		</form>
		</div>
	<% if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
   LoginDTO firstSelectedUser = selectedUser.get(0);
%>
<div class="header-btn2">
   <form action="/testing/logout" method="post">
      <button type="submit">로그아웃</button>
   </form>
   </div>
<% } else { %>
   <form action="/testing/login">
      <button type="submit">로그인</button>
   </form>
<% } %>
	</header>

	<!-- Your page content here -->
	<div class="main-top">
		<div>
			<h1>
				당신 근처의<br> 지역 생활 커뮤니티
			</h1>
			<p>
				동네라서 가능한 모든 것<br> 당근에서 가까운 이웃과 함께해요.
			</p>
			<a class="link1" href="https://github.com/mvcfvsgdj/SecondHandPrj">더
				보기</a>
				
				<a class="link2"
				href="https://dbdiagram.io/d/653b74c9ffbf5169f092c009">알아보기</a>
				<% if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
   LoginDTO firstSelectedUser = selectedUser.get(0);
%>

			<% } else { %><p>
				지금 저희와 함께하세요.
			</p>	<form id="saveForm" method="post" action="/testing/saveForm" >
    <a class="link2" href="/testing/shSaveUser" >회원가입</a>
</form>
			
<% } %>

		</div>
		<div>
			<img
				src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/rebranded-image-top-e765d561ee9df7f5ab897f622b8b5a35aaa70314f734e097ea70e6c83bdd73f1.webp"
				alt="Image">
		</div>
	</div>

	<div class="main-middle">

		<div>
			<img
				src="https://d1unjqcospf8gs.cloudfront.net/assets/home/main/3x/rebranded-image-top-e765d561ee9df7f5ab897f622b8b5a35aaa70314f734e097ea70e6c83bdd73f1.webp"
				alt="Image">
		</div>

		<div>
			<span class="mid-title">중고거래</span>
			<h1>
				믿을만한<br> 이웃 간 중고거래
			</h1>
			<p>
				동네 주민들과 가깝고 따뜻한 거래를<br> 지금 경험해보세요.
			</p>

			<form action="/testing/scrollHome">
				<button type="submit">동네거래</button>
			</form>
			<form action="/testing/products">
				<button type="submit">중고거래</button>
			</form>

		</div>

	</div>

	<div class="main3">
		<div class="column-wrapper">
			<div class="column">
				<img
					src="https://img.shields.io/badge/git-F05032?style=for-the-badge&logo=git&logoColor=white">
				<img
					src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white">
				<img
					src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">

				<img
					src="https://img.shields.io/badge/spring-6DB33F?style=for-the-badge&logo=spring&logoColor=white">
			</div>
			<div class="column">
				<img
					src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
				<img
					src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white">
				<img
					src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
				<img
					src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
				<img
					src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white">
			</div>
			<div class="column">
				<!-- 이미지 추가 -->
			</div>
		</div>
	</div>
	<div class="main4">test</div>
	<button id="myBtn" title="Go to top">Top</button>
	<footer>
		&copy; 2023 에이콘아카데미 최종프로젝트 <br>
		<p>조장: 김재열 |
		조원: 김민규 |
		조원: 김병진 |
		조원: 이정훈 |
		조원: 허재혁</p>
	</footer>

</body>
</html>