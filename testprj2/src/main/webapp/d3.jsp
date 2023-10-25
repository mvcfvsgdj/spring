<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <select id="big">
        <option value="대분류1">대분류1</option>
        <option value="대분류2">대분류2</option>
        <option value="대분류3">대분류3</option>
    </select>
    <select id="middle">
    </select>
    <script>
        let category = {
            대분류1: ["냉장고", "세탁기", "청소기"],
            대분류2: ["가구", "침대", "청소기"],
            대분류3: ["식품", "빵", "오렌지"]
        }

        category.대분류1.forEach(function (item) {
            $("#middle").append('<option>' + item + '</option>');
        });

        $("#big").on("change", function () {
            let key = this.value;

            $("#middle").empty();

            if (key == "대분류1") {
                category.대분류1.forEach(function (item) {
                    $("#middle").append('<option>' + item + '</option>');
                });
            } else if (key == "대분류2") {
                category.대분류2.forEach(function (item) {
                    $("#middle").append('<option>' + item + '</option>');
                });
            } else if (key == "대분류3") {
                category.대분류3.forEach(function (item) {
                    $("#middle").append('<option>' + item + '</option>');
                });
            }
        });

        $("#middle").on("change", function () {
            alert("선택: " + $(this).val());
        });
    </script>
</body>
</html>