<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.sh.saveUser.UserDTO"%>
<%@ page import="com.sh.address.AddressDTO"%>
<%@ page import="com.acorn.testing.KakaoUserDTO"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <style>
      #user_pw {
        width: 270px;
      }

      #user_pw_confirm {
        width: 270px;
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
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        $(document).ready(function () {
        	$("#showPasswordCheckbox").on("change", function () {
    			let isChecked = $(this).is(":checked");
    			let type = isChecked ? "text" : "password";
    			$("#user_pw, #user_pw_confirm").attr("type", type);
    		});

            $("#user_pw, #user_pw_confirm").on("keyup", function () {
                let pass1 = $("#user_pw").val();
                let pass2 = $("#user_pw_confirm").val();

                if (pass1 !== "" || pass2 !== "") {
                    if (
                        pass1.length >= 8 &&
                        /[a-zA-Z]/.test(pass1) &&
                        /[0-9]/.test(pass1) &&
                        /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/.test(pass1) &&
                        /^\S*$/.test(pass1)
                    ) {
                        if (pass1 === pass2) {
                            $("#checkPw").html("비밀번호가 일치합니다.");
                            $("#checkPw").css("color", "green");
                        } else {
                            $("#checkPw").html("비밀번호가 일치하지 않습니다.");
                            $("#checkPw").css("color", "red");
                        }
                    } else {
                        $("#checkPw").html(
                            "비밀번호는 영어, 숫자, 특수문자를 포함해 총 8글자 이상이어야 합니다."
                            + "<br>"+"단, 공백은 안됩니다."
                        );
                        $("#checkPw").css("color", "red");
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

        let passwordRegex =
          /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*?_])(?!.*\s).{8,16}$/;

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
          validityDiv.innerHTML =
            "비밀번호는 최소 8자에서 16자까지, 영문자, 숫자 및 특수 문자를 포함해야 합니다.";
          validityDiv.style.color = "red";
          matchDiv.innerHTML = "";
          document.getElementById("user_pw").value = "";
          document.getElementById("user_pw_confirm").value = "";
        }
      }

      $(document).ready(function () {
        let isPasswordShown = false;

        $("#showPasswordCheckbox").on("change", function () {
          isPasswordShown = !isPasswordShown;
          if (isPasswordShown) {
            $("#user_pw, #user_pw_confirm").attr("type", "text");
          } else {
            $("#user_pw, #user_pw_confirm").attr("type", "password");
          }
        });

        $("#user_pw").on("blur", function () {
          checkPasswordMatch();
        });
        $("#user_pw_confirm").on("blur", function () {
          checkPasswordMatch();
        });
      });
    </script>
	<script>
	
	$(document).ready(function () {
	    $('#myForm12').submit(function (e) {
	    	let fields = ['#user_id', '#user_pw', '#user_pw_confirm', '#address', '#phone_num', '#member_post', '#member_addr', '#detailed_address', '#user_birth', '#user_nickname'];

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
        $.ajax({
            type: "POST",
            url: "/testing/isUserIdExists",
            data: {user_id: userId},
            success: function (data) {
                if (data) {
                    $("#userIdMessage").text("존재하는 아이디입니다. 다시 입력해주세요.");
                    $("#userIdMessage").css("color", "red")
                    $("#user_id").val("");
                } else {
                    $("#userIdMessage").text("사용가능한 아이디 입니다!!!");
                    $("#userIdMessage").css("color", "green");
                }
            },
            error: function (xhr, status, error) {
            	let errorMessage = xhr.status + ': ' + xhr.statusText;
                alert("아이디 중복 확인에 실패했습니다. 나중에 다시 시도해주세요. 오류: " + errorMessage);
            }
        });
    }
</script>
	
<style>
#member_post {
	width: 400px;
}

#member_addr {
	width: 400px;
}
</style>
</head>
<body>


	<form id="myForm12" method="post" action="/testing/myForm12">
        <input type="hidden" id="user_kakao" name="user_kakao" value="${user_kakao}">
        
      <label for="user_id">아이디:</label>
      <input type="text" id="user_id" name="user_id" value="아이디" onblur="checkUserIdAvailability()"><br>
       <span id="userIdMessage"></span><br>
    
    
        <label for="user_pw">비밀번호:</label>
   		 <input type="password" id="user_pw" name="user_pw" value="" /><br />
    	 <div id="passwordValidityMessage"></div>
   		 <label for="user_pw_confirm">비밀번호 재확인:</label>
   		 <input
     	 type="password"
     	 id="user_pw_confirm"
      	name="user_pw_confirm"
     	 value=""
      	onkeyup="checkPasswordMatch()"
    		/><br />
    	<div id="passwordMatchResult"></div>

   		 <br />
    	<input type="checkbox" id="showPasswordCheckbox" />
   		 <label for="showPasswordCheckbox">비밀번호 보기</label><br />

        
        <label for="address">이메일:</label>
        <input type="text" id="address" name="address" value="이메일">
        
        <label for="phone_num">폰번호:</label>
        <input type="text" id="phone_num" name="phone_num" value="폰번호"><br>
        <input id="member_post" name="member_post" type="text" placeholder="Zip Code" readonly>
        <input id="member_addr" name="member_addr" type="text" placeholder="Address" readonly><br>
        <label for="detailed_address">상세 주소:</label>
        <input id="detailed_address" name="detailed_address" type="text" placeholder="Detailed Address"><br>
        <button type="button" onclick="findAddr()">주소찾기</button><br>
        
        <label for="user_birth">생일:</label>
        <input type="text" id="user_birth" name="user_birth" value="생일"><br>
        
        <label for="user_nickname">닉네임:</label>
        <input type="text" id="user_nickname" name="user_nickname" value="${nickname}"><br>
        
        <label for="user_image">사용자 이미지:</label>
        <input type="hidden" id="user_image" name="user_image" value="${profile_image}"><br>
        
        <label for="user_heat" ></label>
        <input type="hidden" id="user_heat" name="user_heat" value="평점"><br>
        <button type="submit" form="myForm12">제출하기</button>
    </form>
<!-- 
	<div>Address</div>
	<form id="addressForm" method="post" action="/testing/addressForm">
	</form>

 -->
</body>
</html>