<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header {
	margin-top: -8px;
	/* width: 1200px; */
	margin-left: -8px;
	margin-right: -9px;
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
	/* width: 100%; */
	height: 100px;
	box-sizing: border-box;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
}

header h2 {
	text-align: center;
	font-size: 35px;
	margin-left: 20px;
}

.satisfyD {
	text-align: center;
	margin: auto;
	margin-top: 110px;
		font-size: 34px;
	font-weight: bolder;
}

}
#satisfy {
	text-align: center;
	margin-top: 80px;
	width: 1200px;
	border: none;
	text-align: center;
	font-size: 34px;
	font-weight: bolder;
}

.star {
	display: inline-block;
	direction: rtl;
	border: 0;
	align-items: center;
	justify-content: center;
	text-align: center;
	margin: 0 auto;
	display: flex;
	justify-content: center;
	text-align: center;
	margin: 0 auto;
}

.submitBtn {
	align-items: center;
	display: flex;
	justify-content: center;
	margin-top: 60px;
}

.submitB {
	width: 120px;
	height: 40px;
	border-radius: 12px;
	background-color: #ff6f0f;
	font-weight: bold;
	color: white;
	border: none;
	transition: color 0.3s ease;
	s
}

.submitB:hover {
	color: black;
}

button.eva {
	font-size: 3em;
	color: transparent;
	text-shadow: 0 0 0 #f0f0f0;
	background: none;
	border: none;
	cursor: pointer;
	font-size: 113px;
}

button.eva:hover, button.eva.selected, button.eva.hovered {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

input[type=radio]:checked ~ button.eva {
	text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
}

#temperatureInput {
	width: 100%;
	height: 30px;
	padding: 5px;
	box-sizing: border-box;
	border: solid 1.5px #D3D3D3;
	border-radius: 5px;
	font-size: 16px;
}

#temperature {
	display: none;
}
</style>
</head>
<body>
	<header>
		<h2>Second Hands</h2>
	</header>
	<h1 id="temperature">
		온도:
		<script>document.write(parseFloat(${user_heat}).toFixed(1));</script>
	</h1>


	<c:set var="products" value="${sessionScope.products}" />
	<div class="satisfyD">
		<p id="satisfy">"${user_nickname}" 님과의 거래는 어떠셨나요?</p>
	</div>

	<div class="star">
		<button class="eva" value="0.2" onmouseover="hoverbtn(this)"
			onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
		<button class="eva" value="0.1" onmouseover="hoverbtn(this)"
			onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
		<button class="eva" value="0" onmouseover="hoverbtn(this)"
			onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
		<button class="eva" value="-0.1" onmouseover="hoverbtn(this)"
			onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
		<button class="eva" value="-0.2" onmouseover="hoverbtn(this)"
			onmouseout="unhoverbtn(this)" onclick="evabtn(this.value, this)">★</button>
	</div>
	<form action="/testing/updateHeat" method="post">
		<input type="hidden" name="user_id" id="user_id" value="" required>
		<input type="hidden" id="temperatureInput" name="user_heat" value="">
		<input type="hidden" name="user_code" value="${sell_code}">
		<div class="submitBtn">
			<button class="submitB" type="submit">평가하기</button>
		</div>
	</form>
	<script>
    let user_heat = ${user_heat};
    let clickedIndex = -1;

    function evabtn(value, button) {
        // 현재 클릭한 버튼의 인덱스 찾기
        const buttons = document.querySelectorAll('.eva');
        const currentIndex = Array.from(buttons).indexOf(button);

        // 중복 클릭 방지
        if (currentIndex !== clickedIndex) {
            // 모든 버튼에서 selected 클래스 제거
            buttons.forEach(function (btn) {
                btn.classList.remove('selected');
            });

            // 현재 클릭한 버튼과 그 이후 버튼에 selected 클래스 추가
            for (let i = currentIndex; i < buttons.length; i++) {
                buttons[i].classList.add('selected');
            }

            // 값 업데이트
            user_heat += parseFloat(value);
            updateTemperature(user_heat);

            // 클릭한 버튼의 인덱스 업데이트
            clickedIndex = currentIndex;
        }
    }

    function hoverbtn(button) {
        const index = Array.from(document.querySelectorAll('.eva')).indexOf(button);
        for (let i = index; i < document.querySelectorAll('.eva').length; i++) {
            document.querySelectorAll('.eva')[i].classList.add('hovered');
        }
    }

    function unhoverbtn(button) {
        const index = Array.from(document.querySelectorAll('.eva')).indexOf(button);
        for (let i = index; i < document.querySelectorAll('.eva').length; i++) {
            document.querySelectorAll('.eva')[i].classList.remove('hovered');
        }
    }

    function updateTemperature(temperature) {
        document.getElementById("temperature").innerHTML = '온도: ' + temperature.toFixed(1);
        document.getElementById("temperatureInput").value = temperature.toFixed(1);
    }
</script>


</body>
</html>