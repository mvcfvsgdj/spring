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
            $("#chatMessageArea").append("<div class='recv'>" +"<br>"+  $('#targetNickname').val()+"님 :" + msg + "</div>");
            

        } 
        scrollTop();
    }

    // 자신의 메시지를 대화창에 출력
    function appendSendMessage(sender, msg) {
        if (sender != selectedNickname) {
            $("#chatMessageArea").append("<div class='send'>" + "<br>"+  $('#nickname').val()+"님 :" + msg + "</div>");

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

       

<c:set var="nickNameCheck" value="${user.user_nickname eq nickName}" />
<c:set var="TargetNickNameCheck" value="${user.user_nickname eq targetNickName}" />

<c:set var="my_heatCheck" value="${user.user_heat eq my_heat}" />
<c:set var="target_heatCheck" value="${user.user_heat eq target_heat}" />

<!-- 
    'nickNameCheck'와 'TargetNickNameCheck' 변수에는 각각 'true' 또는 'false'가 저장됩니다.
    해당 변수들을 사용하여 'nickname'과 'targetNickname' input 요소의 값을 설정합니다.
    'nickNameCheck'가 'true'일 경우 'nickName'이 'nickname' input에 설정되며,
    그렇지 않은 경우 'targetNickName'이 'nickname' input에 설정됩니다.
    'TargetNickNameCheck'가 'true'일 경우 'nickName'이 'targetNickname' input에 설정되며,
    그렇지 않은 경우 'targetNickName'이 'targetNickname' input에 설정됩니다.
-->

<input type="hidden" id="nickname" value="${nickNameCheck ? nickName : targetNickName}">
<input type="hidden" id="targetNickname" value="${TargetNickNameCheck ? nickName : targetNickName}">

<input type="hidden" id=my_heat value="${my_heatCheck ? my_heat : target_heat}">
<input type="hidden" id="target_heat" value="${target_heatCheck ? my_heat : target_heat}">

<input type="button" id="connectBtn" value="입장" onclick="connect()">
<input type="button" id="exitBtn" value="나가기" onclick="disconnect()">
<h1>대화 영역</h1>
	<div>${board_Title}</div>
		<div>${board_Price}</div>
	<div>${board_Img}</div>
	<div>${target_heatCheck ? my_heat : target_heat}℃ </div>


<div id="chatArea">
    <div id="chatMessageArea"></div>
</div>
<br />
<input type="text" id="message">
<input type="button" id="sendBtn" value="전송" onclick="send()">
</body>
</html>
