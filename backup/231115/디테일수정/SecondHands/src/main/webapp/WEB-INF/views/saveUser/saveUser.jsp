<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.saveUser.domain.UserDTO"%>
<%@ page import="com.sh.address.domain.AddressDTO"%>
<%@ page import="com.sh.kakaologin.domain.KakaoUserDTO"%>
<%@ page import="com.sh.login.domain.LoginDTO"%>

<%@ page import="java.util.*"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	margin-right: 20px;
}

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

.menu-icon:hover {

	color: black;
}

.menu-container {
	display: none;
	position: fixed;
	top: 100px;
	left: 0;
	width: 20%;
	height: 100%;
	background-color: #f9f9f9;
	z-index: 999;
	background-color: #f9f9f9;
}

.menu-container ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
	text-align: center;
}

.menu-container li {
	padding: 15px;
	border-bottom: 1px solid #ddd;
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
	background-color: white; 
	color: #ff6f0f;
}

.menu-container h2:hover {

	color: #ff6f0f;
}

.main-top {
	background: #fffae0;
	border-bottom: 1px solid #ddd;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px; /* 추가된 부분 */
}

.main-top div {
	text-align: center;
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
	padding: 15px 20px;
	margin: 10px;
	background-color: #ff6f0f;
	color: white;
	font-size: 18px;
	border-radius: 10px;
	text-decoration: none;
	font-weight: bold;
	transition: background-color 0.3s, color 0.3s;
	margin: 5px 20px -1px 10px;
}

.main-top div a:hover {
	background-color: #d55500;
	color: white;
}

.main-top-form {
	max-width: 100%; /* 수정 */
	margin: 0 auto; /* 추가 */
	height: 800px;
	padding: 20px;
	background-color: #fff;
	border-radius: 8px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.main-top-form label, .main-top-form input {
	display: block;
	margin-bottom: 15px;
}

.main-top-form input[type="checkbox"], .main-top-form button {
	display: inline-block;
	margin-top: 10px;
}

      #saveForm {
    	box-shadow: 0px 0px 5px #ccc;
    margin: 20px auto;
    /* HEIGHT: 297PX; */
    width: 650px;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
         
        }

#saveForm input {
	width: 96%;
    margin: 9px 0px 15px;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

.password-input-container {
    display: flex;
   	position: relative;
    align-items: center;
}


#showPasswordCheckbox {
    position: absolute;
    top: 32%;
    right: -41%;
    transform: translateY(-50%);
}

button {
	padding: 5px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button:hover {
	background-color: #d55500;
}


#saveForm label,
#saveForm input {
    display: block;
    text-align: left; /* 왼쪽 정렬을 위한 수정 */
}

#saveForm input[type="checkbox"],
#saveForm button {
    display: inline-block;
}

#user_id,
#user_pw,
#user_pw_confirm,
#address,
#phone_num,
#member_post,
#member_addr,
#detailed_address,
#user_birth,
#user_nickname {
    width: 100%; /* 입력란의 너비를 100%로 설정 */
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #ddd;
    border-radius: 4px;
}

#address {
    width: calc(100% - 120px); /* 주소 입력란의 너비를 조절하세요. */
}


#verification_code {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1.5px solid #ddd;
    border-radius: 4px;
    color: #333; /* 글자 색상을 추가 */
}

#verification-result {
    margin-top: 10px;
    color: red;
}



#userIdMessage,
#passwordValidityMessage,
#passwordMatchResult,
#verification-result,
#verification_code {
    font-size: 12px;
    font-weight: bold;
    text-align: center; /* 텍스트를 중앙으로 정렬 */
    margin-top: 10px; /* 위 여백 조절 */
}
#user_pw,
#user_pw_confirm,
#passwordValidityMessage,
#passwordMatchResult {
    width: 100%;

}

#member_post {
	width: 400px;
}

#member_addr {
	width: 400px;
}



button[type="submit"][form="saveForm"] {
	display: block;
	margin: 20px auto; /* 중앙 정렬 및 아래쪽 여백 조절 */
	padding: 10px;
	background-color: #ff6f0f;
	color: #fff;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	transition: background-color 0.3s, color 0.3s;
}

button[type="submit"][form="saveForm"]:hover {
	background-color: #d55500;
}

footer {
	background-color: #333;
	padding: 10px;
	color: white;
	text-align: center;
	bottom: 0;
}

</style>
<script>
	function findAddr() {
		new daum.Postcode({
			oncomplete : function(data) {
				console.log(data);
				let roadAddr = data.roadAddress;
				let jibunAddr = data.jibunAddress;
				document.getElementById('member_post').value = data.zonecode;
				if (roadAddr !== '') {
					document.getElementById("member_addr").value = roadAddr;
				} else if (jibunAddr !== '') {
					document.getElementById("member_addr").value = jibunAddr;
				}
			}
		}).open();
	}
</script>


   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
	$(document)
			.ready(
					function() {
						$("#showPasswordCheckbox").on("change", function() {
							let isChecked = $(this).is(":checked");
							let type = isChecked ? "text" : "password";
							$("#user_pw, #user_pw_confirm").attr("type", type);
						});

						$("#user_pw, #user_pw_confirm")
								.on(
										"keyup",
										function() {
											let pass1 = $("#user_pw").val();
											let pass2 = $("#user_pw_confirm")
													.val();

											if (pass1 !== "" || pass2 !== "") {
												if (pass1.length >= 8
														&& /[a-zA-Z]/
																.test(pass1)
														&& /[0-9]/.test(pass1)
														&& /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/
																.test(pass1)
														&& /^\S*$/.test(pass1)) {
													if (pass1 === pass2) {
														$("#checkPw").html(
																"비밀번호가 일치합니다.");
														$("#checkPw").css(
																"color",
																"green");
													} else {
														$("#checkPw")
																.html(
																		"비밀번호가 일치하지 않습니다.");
														$("#checkPw").css(
																"color", "red");
													}
												} else {
													$("#checkPw")
															.html(
																	"비밀번호는 영어, 숫자, 특수문자를 포함해 총 8글자 이상이어야 합니다."
																			+ "<br>"
																			+ "단, 공백은 안됩니다.");
													$("#checkPw").css("color",
															"red");
												}
											}
										});
					});
</script>
<script>
	function checkPasswordMatch() {
		let confirmPassword = document.getElementById("user_pw_confirm").value;
		let matchDiv = document.getElementById("passwordMatchResult");
		let validityDiv = document.getElementById("passwordValidityMessage");
		let password = document.getElementById("user_pw").value;

		let passwordRegex = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_])(?!.*\s).{8,16}$/;

		if (passwordRegex.test(password)) {
			validityDiv.innerHTML = "비밀번호가 유효합니다.";
			validityDiv.style.color = "green";

			if (password === confirmPassword) {
				matchDiv.innerHTML = "비밀번호가 일치합니다.";
				matchDiv.style.color = "green";
			} else {
				matchDiv.innerHTML = "비밀번호가 일치하지 않습니다.";
				matchDiv.style.color = "red";
			}
		} else {
			validityDiv.innerHTML = "비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.";
			validityDiv.style.color = "red";
			matchDiv.innerHTML = "";
			document.getElementById("user_pw").value = "";
			document.getElementById("user_pw_confirm").value = "";
		}
	}

	$(document).ready(function() {
		let isPasswordShown = false;

		$("#showPasswordCheckbox").on("change", function() {
			isPasswordShown = !isPasswordShown;
			if (isPasswordShown) {
				$("#user_pw, #user_pw_confirm").attr("type", "text");
			} else {
				$("#user_pw, #user_pw_confirm").attr("type", "password");
			}
		});

		$("#user_pw").on("blur", function() {
			checkPasswordMatch();
		});
		$("#user_pw_confirm").on("blur", function() {
			checkPasswordMatch();
		});
	});
</script>

<script>
	$(document).ready(
			function() {
				$('#saveForm').submit(
						function(e) {
							let fields = [ '#user_id', '#user_pw',
									'#user_pw_confirm', '#address',
									'#phone_num', '#member_post',
									'#member_addr', '#detailed_address',
									'#user_birth', '#user_nickname' ];

							for (let i = 0; i < fields.length; i++) {
								if ($(fields[i]).val() === '') {
									e.preventDefault();
									alert('모든 값을 입력해 주세요');
									return;
								}
							}
						});
			});
</script>

<script>
	function checkUserIdAvailability() {
		let userId = $("#user_id").val();
		if (!userId) {
			$("#userIdMessage").text("아이디를 입력하세요.");
			$("#userIdMessage").css("color", "red");
			return;
		}

		$.ajax({
			type : "POST",
			url : "/testing/isUserIdExists",
			data : {
				user_id : userId
			},
			success : function(data) {
				if (data) {
					$("#userIdMessage").text("존재하는 아이디입니다. 다시 입력해주세요.");
					$("#userIdMessage").css("color", "red");
					$("#user_id").val("");
				} else {
					$("#userIdMessage").text("사용가능한 아이디 입니다!!!");
					$("#userIdMessage").css("color", "green");
				}
			},
			error : function(xhr, status, error) {
				let errorMessage = xhr.status + ': ' + xhr.statusText;
				alert("아이디 중복 확인에 실패했습니다. 나중에 다시 시도해주세요. 오류: " + errorMessage);
			}
		});
	}
</script>


<script>
	var code = ""; /*인증번호 저장할 곳*/
	$(document).ready(function() {
		$('#auth_btn').click(function() {
			var email = $('#address').val(); /*입력한 이메일*/
			console.log('완성된 이메일 : ' + email); /* 이메일 오는지 확인*/
			var checkInput = $('.mail-check-input'); /* 인증번호 입력 */

			$.ajax({
				type : 'GET',
				url : 'testing/mailCheck',
				data : {
					email : email
				}, /* 데이터를 객체로 보내도록 수정 */
				success : function(data) {
					console.log("data : " + data);
					checkInput.prop('disabled', false); /* 데이터가 성공적으로 들어오면 인증번호 입력란이 활성화되도록 */
					code = data;
					alert('인증번호가 전송되었습니다.');
				},
				error : function(xhr, status, error) {
					console.error("Error:", error);
					var errorMessage = "이메일 주소 형식이 올바르지 않습니다. 다시 입력해주세요.";
					alert(errorMessage);
				}
			});
		});
		$('#confirm_btn').click(function() {
			var inputCode = $("#verification_code").val(); /* 사용자가 입력한 인증 번호 */
			var checkResult = $("#verification-result"); /* 결과를 표시할 요소 */

			if (inputCode == code) { // 일치할 경우
				checkResult.html("인증번호가 일치합니다.");
				checkResult.css("color", "#3781E3");
				checkResult.css("display", "block");
				$("#verification_code").css("border", "1.5px solid #3781E3"); // 일치할 경우 테두리 색 변경
				$("#verification_code").css("color", "#3781E3"); // 일치할 경우 글자 색 변경
			} else {
				checkResult.html("인증번호가 일치하지 않습니다.");
				checkResult.css("color", "red");
				checkResult.css("display", "block");
				$("#verification_code").css("border", "1.5px solid red");
				$("#verification_code").css("color", "red");
			}
		});
	});
</script>


<script>
$(document).ready(function() {
    //맨위로 올리기
    $("html, body").animate({
        scrollTop: 0
    }, 400);

    // 버튼을 클릭하면 페이지 맨 위로 스크롤합니다.
    $("#myBtn").click(function() {
        $("html, body").animate({
            scrollTop: 0
        }, 400); // 1000은 애니메이션 속도를 나타냅니다. 여기서는 1000ms로 설정했습니다.
    });
});
  
</script>


</head>
<body>

	<%
	LoginDTO user = (LoginDTO) session.getAttribute("user");
	List<LoginDTO> selectedUser = (List<LoginDTO>) session.getAttribute("selectedUser");
	%>


	<header>
		<div class="header-logo">
			<div class="menu-icon">&#9776;</div>
			<form action="/testing/homePage">
			<button type="submit" >Second Hands</button>
		</form>
		</div>

		<!-- 햄버거 아이콘 추가 -->
		<div class="menu-container">
			<ul>
				<li>
					<h2>
						<%
						if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
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
		<%
		if (user != null && selectedUser != null && !selectedUser.isEmpty()) {
			LoginDTO firstSelectedUser = selectedUser.get(0);
		%>
		<div class="header-btn2">
			<form action="/testing/logout" method="post">
				<button type="submit">로그아웃</button>
			</form>
		</div>
		<%
		} else {
		%>
		<form action="/testing/login">
			<button type="submit">로그인</button>
		</form>
		<%
		}
		%>
	</header>
	<div class="main-top">

		<form id="saveForm" method="post" action="/testing/saveForm">
	   <div style="text-align: center;"> <!-- Add this div for centering -->
            <h2>회원가입</h2>
        </div>
			<input type="hidden" id="user_kakao" name="user_kakao"
				value="${user_kakao}">
				<input type="text" id="user_id" name="user_id" 
				onfocus="this.placeholder = '아이디'" onblur="checkUserIdAvailability()">
			<div id="userIdMessage"></div> 
			<div class="password-input-container">
				<input type="password" id="user_pw" name="user_pw"
					
					onfocus="this.placeholder = '비밀번호'" /> <input type="checkbox"
					id="showPasswordCheckbox" />
			</div>
			<div id="passwordValidityMessage"></div>
 			<input type="password"
				id="user_pw_confirm" name="user_pw_confirm" placeholder="비밀번호 재확인"
				onkeyup="checkPasswordMatch()" />
			<div id="passwordMatchResult"></div>
		 <input type="text"
				id="user_nickname" name="user_nickname"placeholder="닉네임을 입력해주세요" value="${nickname}">
			
			<input type="text" id="address"
				name="address" placeholder="example@gmail.com"
				onfocus="this.placeholder = ''">
			<button type="button" id="auth_btn">이메일 인증</button>
			<br> <input
				type="text" id="verification_code" name="verification_code"
				placeholder="인증번호를 입력하세요" onfocus="this.placeholder = ''">
						<div id="verification-result"></div>
			<button type="button" id="confirm_btn">확인</button>
	
			 <input
				type="text" id="phone_num" name="phone_num" placeholder="핸드폰 번호"
				onfocus="this.placeholder = ''"> <input id="member_addr"
				name="member_addr" type="text" placeholder="주소" readonly><input
				id="member_post" name="member_post" type="text" placeholder="우편번호"
				readonly>
			
				<input id="detailed_address" name="detailed_address" type="text"
					placeholder="상세주소를 입력하세요" onfocus="this.placeholder = ''">
				<button type="button" onclick="findAddr()">주소찾기</button>
	
			<br> <input type="text"
				id="user_birth" name="user_birth" placeholder="생년월일 6자리 입력해주세요"
				onfocus="this.placeholder = ''">
			<input type="hidden"
				id="user_image" name="user_image"   value="${profile_image != null ? profile_image : '기본_이미지.jpg'}">>
			<input type="hidden" id="user_heat"
				name="user_heat" value="36.5">
			<button type="submit" form="saveForm">회원가입하기</button>

		</form>

	</div>


	<footer>
		&copy; 2023 에이콘아카데미 최종프로젝트 <br>
		<p>조장: 김재열</p>
		<p>조원: 김민규</p>
		<p>조원: 김병진</p>
		<p>조원: 이정훈</p>
		<p>조원: 허재혁</p>
	</footer>

	<!-- 
	<div>Address</div>
	<form id="addressForm" method="post" action="/testing/addressForm">
	</form>

 -->
</body>
</html>