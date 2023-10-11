<%@ page import="com.acorn.day2.api.CarrotDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Carrot Registration</title>
    <script>
        function register() {
            let id = $("#id").val();
            let price = $("#price").val();
            let info = $("#info").val();
            let newTime = $("#newTime").val();

            let carrot = {id: id, price: price, info: info, newTime: newTime};
            let carrotJson = JSON.stringify(carrot);

            $.ajax({
                type: "POST",
                url: "${pageContext.request.contextPath}/register",
                data: carrotJson,
                contentType: "application/json",
                success: function (data) {
                    // 서버에서 응답 받은 데이터를 사용하여 테이블 갱신
                    updateTable(data);
                },
                error: function () {
                    alert("Error");
                }
            });
        }

        function updateTable(data) {
            //JSON
            let newCarrot = JSON.parse(data);

            // 새로운 행 생성
            let newRow = "<tr>" +
                "<td>" + newCarrot.id + "</td>" +
                "<td>" + newCarrot.price + "</td>" +
                "<td>" + newCarrot.info + "</td>" +
                "<td>" + newCarrot.newTime + "</td>" +
                "</tr>";

            // 테이블의 마지막에 새로운 행 추가
            $("table").append(newRow);
        }
    </script>
</head>
<body>

<h2>Carrot Registration Form</h2>

<form onsubmit="event.preventDefault(); register();">
    ID: <input type="text" id="id" required><br>
    Price: <input type="number" id="price" required><br>
    Info: <input type="text" id="info" required><br>
    New Time: <input type="date" id="newTime" required><br>
    <button type="submit">Register</button>
</form>

<hr>

<h2>Carrot List</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Price</th>
        <th>Info</th>
        <th>New Time</th>
    </tr>
    <c:forEach var="carrot" items="${carrotList}">
        <tr>
            <td>${carrot.id}</td>
            <td>${carrot.price}</td>
            <td>${carrot.info}</td>
            <td>${carrot.newTime}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>