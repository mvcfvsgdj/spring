<%@ page contentType="text/html; charset=UTF-8"
   trimDirectiveWhitespaces="true"%>

   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
      <%@ page import="java.util.*" %>
      
   
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">


    var wsocket;
    var selectedNickname = "";

    // WebSocket으로 서버에 연결
       function connect() {
        $('#connectBtn').hide();
        $('#exitBtn').show();
        $('#chatArea').show();
        $('#message').focus();

        wsocket = new WebSocket("ws://localhost:8090/testing/chat-sh");
        wsocket.onopen = onOpen;
        wsocket.onmessage = onMessage;
        wsocket.onclose = onClose;
    }

    // WebSocket 연결을 닫음
       function disconnect() {
    	    wsocket.close();
    	    window.location.href = "homePage";
    	}

    // 연결이 열릴 때 호출될 함수
    function onOpen(evt) {
        alert("연결되었습니다");
    }

    // 메시지를 받았을 때 호출될 함수
    function onMessage(evt) {
        console.log(evt);
        var data = evt.data;
        if (data.substring(0, 4) == "msg:") {
            var messageParts = data.substring(4).split(":");
            var sender = messageParts[0];
            var messageContent = messageParts[1];
            if (sender == selectedNickname || sender == $("#targetNickname").val()) {
                appendRecvMessage(messageContent, sender);
            }
        }
    }

    // 연결이 닫혔을 때 호출될 함수
    function onClose(evt) {
        alert("연결을 끊었습니다");
    }

    // 메시지 전송
    function send() {
        var nickname = $("#nickname").val();
        var msg = $("#message").val();
        var targetNickname = $("#targetNickname").val(); // 상대방의 이름

        if (targetNickname && msg) {
            wsocket.send("msg:" + nickname + ":" + msg);
            $("#message").val("");
            appendSendMessage(nickname, msg);
        }
    }

    $(document).ready( function(){    
        // 엔터 키로 메시지 전송
        $('#message').keypress(function(event){
            var keycode =  event.keyCode  ;                  
            if(keycode == '13'){               
                send(); 
            }         
            event.stopPropagation();  // 상위로 이벤트 전파 막음
        });

        // 버튼 클릭으로 메시지 전송 및 연결/연결 해제
        $('#sendBtn').click(function() { send(); });
        $('#enterBtn').click(function() { connect(); });
        $('#exitBtn').click(function() { disconnect(); });
    });

    // 상대방의 메시지를 대화창에 출력
    function appendRecvMessage(msg, sender) {
        if (sender != selectedNickname) {
            $("#chatMessageArea").append("<div class='recv'>" +  "상대 채팅: " + msg + "</div>");
        } 
        scrollTop();
    }

    // 자신의 메시지를 대화창에 출력
    function appendSendMessage(sender, msg) {
        if (sender != selectedNickname) {
           //selectedUser.getUser_nickname()
           //selectedProduct.getUser_nickname()
            $("#chatMessageArea").append("<div class='send'>" + "내 채팅:  " + msg + "</div>");
        }
        scrollTop();
    }

    // 대화창 스크롤을 아래로 이동
    function scrollTop() {
        var chatAreaHeight = $("#chatArea").height();
        var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;
        $("#chatArea").scrollTop(maxScroll);
    }
</script>
<style>
    #chatArea {
        width: 200px;
        height: 100px;
        overflow-y: auto;
        border: 1px solid black;
    }

    .send {
        border: 1px solid green;
        text-align: right;
        padding: 10px;
    }

    .recv {
        border: 1px solid yellow;
        color: blue;
        text-align: left;
        padding: 10px;
    }
</style>
</head>
<body>
   
 <c:forEach items="${chatCode}" var="chat">

 <input type="text" id="nickname" value="${chat}">
 <input type="text" id="targetNickname" value="${chat}">
<input type="button" id="connectBtn" value="입장" onclick="connect()">
<input type="button" id="exitBtn" value="나가기" onclick="disconnect()">
<h1>대화 영역</h1>
<div id="chatArea">
    <div id="chatMessageArea"></div>
</div>
<br />
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송" onclick="send()">
    </c:forEach>

</body>
</html>