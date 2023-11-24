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

window.onload = function() {
    var messageArea = document.getElementById('chatArea'); // 채팅창 영역 선택
    var messageText = "----------------------------------- 입장버튼을 누르면 채팅에 접속됩니다!! ------------------------------------------"; // 출력할 메시지
    
    var messageElement = document.createElement('div'); // 새로운 <div> 엘리먼트 생성
    messageElement.textContent = messageText; // 메시지 설정

    // 채팅창의 맨 위에 메시지를 추가
    var connectionMessage = document.getElementById('connectionMessage');
    connectionMessage.appendChild(messageElement);
};

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
    var messageArea = document.getElementById('chatArea'); // 채팅 창 영역 선택
    var messageText = "------------------------------------------------- 연결되었습니다 ------------------------------------------------------"; // 출력할 메시지
    
    var messageElement = document.createElement('div'); // 새로운 <div> 엘리먼트 생성
    messageElement.textContent = messageText; // 메시지 설정
    
    // 채팅 창 영역에 메시지를 맨 위에 추가
    var connectionMessage = document.getElementById('connectionMessage');
    connectionMessage.appendChild(messageElement);
    connectionMessage.scrollIntoView(); // 채팅창 맨 아래로 스크롤
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

        // '입장' 버튼을 누르지 않았을 때 안내 메시지 출력
        if ($('#connectBtn').is(':visible')) {
            var entryMessage = "입장버튼을 누르고 채팅을 시작하세요!"; // 안내 메시지
            appendEntryMessage(entryMessage); // 채팅창에 안내 메시지 추가
            return; // 메시지 전송을 중단
        }

        if (targetNickname && msg) {
            wsocket.send("msg:" + nickname + ":" + msg);
            $("#message").val("");
            appendSendMessage(nickname, msg);
        }
    }

    // '입장' 버튼을 누르지 않았을 때 채팅창에 안내 메시지 추가
    function appendEntryMessage(entryMessage) {
        // 메시지가 이미 존재하는 경우 추가하지 않도록 처리
        var chatMessageArea = document.getElementById('chatMessageArea');
        if (chatMessageArea.innerHTML.indexOf(entryMessage) === -1) {
            var entryElement = document.createElement('div'); // 새로운 <div> 엘리먼트 생성
            entryElement.textContent = entryMessage; // 메시지 설정
            chatMessageArea.appendChild(entryElement); // 채팅창에 안내 메시지 추가
            scrollTop(); // 채팅창 맨 아래로 스크롤
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
            $("#chatMessageArea").append("<div class='recv'>" +"<div class='recvNickname'>"+ $('#targetNickname').val()+"님 " +"</div>"+ "</div>");           
            $("#chatMessageArea").append("<div class='recv'>" +"<div class='recvBox'>"+ msg +"</div>"+ "</div>");
            

        } 
        scrollTop();
    }

    // 자신의 메시지를 대화창에 출력
    function appendSendMessage(sender, msg) {
        if (sender != selectedNickname) {
            $("#chatMessageArea").append("<div class='send'>" +"<div class='sendBox'>"+ msg +"</div>"+"</div>");

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
        width: 800px;
        height: 646px;
        overflow-y: auto;
        border-bottom: 1px solid black;
        margin: 0 auto;
        position: absolute;
        top: 106px;
        background-color: #474747;
    }
    

    .send {
        text-align: right;
        padding: 10px;
        word-break: break-all;
        color: white;
        
        
        
    }
    .recv {
           color: white;
        text-align: left;
        padding: 10px;
          word-break: break-all;
        
    }
    .recvNickname{
            word-break: break-all;
           margin-left: 40px;

           
    }
    
    .sendBox{
            word-break: break-all;
            width: 300px;
           margin-left: 450px;
           background-color: #ff6f0f;
           padding: 10px;
           border-radius: 30px;
    
    }
    
    .recvBox{
            word-break: break-all;
            width: 300px;
           margin-left: 20px;
           background-color: #ff6f0f;
           padding: 10px;
           border-radius: 30px;
    
                                      
                           
                
    
    }

    .chatMessageBox{
            margin-top: 20px;
            margin: 0 auto;
            width: 800px;
            position: absolute;
            bottom: -31px;


       
    }
    .chatArea_header{
    height: 100px;
    padding: 30px;
    }
   .board_Img{
   width: 80px;
   height: 80px;
   margin-top: 10px;
   margin-left: 20px;
   border-radius: 50%;

   }
   .chatArea_header_info{
       position: absolute;
       left: 0px;
       width: 800px;
       top: 0px;
       color: white;
       display: flex;
       border-bottom: 1px solid black;

       
   
   }
   .chattingMainBox{
       position: relative;
       width: 800px;
       margin: 0 auto;
       height: 850px;
       background-color: #474747;
       border-radius: 50px;
       
       
       
   
   }
   .board_Details{
   margin-top: 10px;
   margin-left: 15px;
   padding: 10px;
   }
   
   #message{
   width: 600px;
   height: 30px;
   margin-left: 30px;
   font-size: 20px;
   }
   .chatMessageBoxButton{
   margin-left: 20px;
   width: 50px;
   height: 30px;
   }
   .chatMessageBox{
   height: 100px;
   }
   
   #myBtn:hover {
   background-color: #d55500; /* 마우스를 올렸을 때의 배경 색상을 흰색으로 변경 */
   color: white; /* 마우스를 올렸을 때의 텍스트 색상을 주황색으로 변경 */
}
.chatting_table{
width: 1000px;
}
.chatMessageBoxButton {
   background-color: #ff6f0f;
   color: #fff;
   border: none;
   border-radius: 4px;
   cursor: pointer;
   transition: background-color 0.3s, color 0.3s;
}

.chatMessageBoxButton:hover {
   background-color: #d55500;
}    

/* 빨간색 안내 메시지에 대한 스타일 지정 */


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



<div class="chattingMainBox">
<div class=" chatArea_header_info">
<img class="board_Img" src= "<c:url value=" images/${board_Img}"/>">
    <div class="board_Details">
        <div class="board_Title">상품명: ${board_Title}</div>
        <div class="board_Price">가격: ${board_Price}</div>
            <div class="target_heat">온도: ${target_heatCheck ? my_heat : target_heat}℃</div>
    </div>
   
   
   </div>
   
<div id="chatArea">
    <!-- 채팅창의 맨 위에 메시지가 표시될 위치입니다 -->
    <div id="connectionMessage" style="margin-bottom: 10px;"></div>

    <!-- 실제 채팅 메시지가 표시될 위치입니다 -->
    <div id="chatMessageArea"></div>
</div>

<div class="chatMessageBox">
    <input type="text" id="message">
<input class="chatMessageBoxButton" type="button" id="sendBtn" value="전송" onclick="send()">
<input class="chatMessageBoxButton" type="button" id="connectBtn" value="입장" onclick="connect()">
<input class="chatMessageBoxButton" type="button" id="exitBtn" value="나가기" onclick="disconnect()" style="display: none">
</div>
</div>



</body>
</html>