<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Category View</title>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>

<h2>Category View</h2>

<select id="big">
    <option value="서울">서울</option>
    <option value="제주도">제주도</option>
    <option value="부산">부산</option>
</select>

<!--  지역에 따른 중분류 -->
<select id="middle">
    <!-- 중분류 옵션은 JavaScript에서 처리 -->
</select>

<script>
    var categoryData = ${item}; // EL 표현식을 사용하여 Java 객체를 가져옴
    
    console.log(categoryData );

    // 초기에 서울에 해당하는 중분류 추가
    categoryData['서울'].forEach(function (item) {
        $("#middle").append('<option value="' + item.detail_loc + '">' + item.detail_loc + '</option>');
    });
    

    $("#big").on("change", function () {
        let key = this.value;
        // 선택된 대분류에 따라 중분류 변경
        $("#middle").empty(); // 기존 중분류 옵션 제거
        categoryData[key].forEach(function (item) {
            $("#middle").append('<option value="' + item.detail_loc + '">' + item.detail_loc + '</option>');
        });
    });

    $("#middle").on("change", function () {
        alert("선택: " + $(this).val());
    });
</script>

</body>
</html>