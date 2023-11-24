<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <select id="big">
        <option value="서울">서울</option>
        <option value="경기">경기</option>
        <option value="인천">인천</option>
    </select>
    
    <!--  지역에 따른 중분류 -->
    <select id="middle">
    </select>

    <button id="registerButton">등록</button>

    <script>
        let category = {
            대분류: ["서울", "경기", "인천"],
            중분류: {
                "서울": [
                    { "code": "201", "name": "노원구" },
                    { "code": "202", "name": "양천구" },
                    { "code": "203", "name": "강서구" },
                    { "code": "204", "name": "동작구" }
                ],
                "경기": [
                    { "code": "301", "name": "성남시" },
                    { "code": "302", "name": "수원시" },
                    { "code": "303", "name": "안양시" },
                    { "code": "304", "name": "고양시" }
                ],
                "인천": [
                    { "code": "401", "name": "연수구" },
                    { "code": "402", "name": "남동구" },
                    { "code": "403", "name": "미추홀구" },
                    { "code": "404", "name": "부평구" }
                ]
            }
        }

        // 초기에 서울에 해당하는 중분류 추가
        category.중분류.서울.forEach(function (item) {
            $("#middle").append('<option value="' + item.code + '">' + item.name + '</option>');
        });

        $("#big").on("change", function () {
            let key = this.value;
            // 선택된 대분류에 따라 중분류 변경
            $("#middle").empty(); // 기존 중분류 옵션 제거
            category.중분류[key].forEach(function (item) {
                $("#middle").append('<option value="' + item.code + '">' + item.name + '</option>');
            });
        });

        $("#middle").on("change", function () {
   
        });

        $("#registerButton").on("click", function () {
            // 등록 버튼을 누르면 초기 상태로 되돌리기
            $("#big").val("서울"); // 대분류 초기화
            $("#middle").empty(); // 중분류 초기화
            category.중분류.서울.forEach(function (item) {
                $("#middle").append('<option value="' + item.code + '">' + item.name + '</option>');
            });
        });
    </script>
</body>
</html>