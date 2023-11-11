<%@ page contentType="text/html; charset=UTF-8" trimDirectiveWhitespaces="true"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<title>채팅</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
    
   
     var wsocket;
    
  
    function connect() {
     
        wsocket = new WebSocket(
                "ws://localhost:8090/model/chat-ws");
        
      
        wsocket.onopen = onOpen;
        wsocket.onmessage = onMessage;
        wsocket.onclose = onClose;
        
    }
    
    
    function disconnect() {
        wsocket.close();
    }
        
    
     
    function onOpen(evt) {
      //  appendMessage("연결되었습니다.");
      alert("연결되었습니다");
    }
     
    function onMessage(evt) {
    	console.log( evt);
        var data = evt.data;
        if (data.substring(0, 4) == "msg:") {
        	appendRecvMessage(data.substring(4));
        }
    }
    
     
    function onClose(evt) {
      // appendMessage("연결을 끊었습니다.");
      alert("연결을 끊었습니다");
    }
    
   
    function send() {  
    	
    	//닉네임가져오기
        var nickname = $("#nickname").val();        
        var msg = $("#message").val();       
        
        
        wsocket.send("msg:"+nickname+":" + msg);        
        $("#message").val("");
        
         
        //채팅창에 자신이 쓴 메시지 추가 
        appendSendMessage(msg);
        
    }

    
    //받는 메시지 채팅창에 추가
    function appendRecvMessage(msg) {          
        $("#chatMessageArea").append( "<div class='recv'>" + msg+"</div>");        
        scrollTop();
    }

    
    function  scrollTop(){
    	  var chatAreaHeight = $("#chatArea").height();         
          var maxScroll = $("#chatMessageArea").height() - chatAreaHeight;  
          $("#chatArea").scrollTop(maxScroll);
    }
    
    //보내는 메시지 채팅창에 추가
    function appendSendMessage(msg) {     
        $("#chatMessageArea").append( "<div class='send' > " + msg+  "</div>"); 
        scrollTop();
        
    }

 
  
   $(document).ready( function(){    
	 
           $('#message').keypress(function(event){
        	   
		   var keycode =  event.keyCode  ;		            
		  
		       if(keycode == '13'){		    	  
		                send(); 
		       }  		 
		            event.stopPropagation();  // 상위로 이벤트 전파 막음
		        });
       
		        $('#sendBtn').click(function() { send(); });
		        $('#enterBtn').click(function() { connect(); });
		        $('#exitBtn').click(function() { disconnect(); });
	   
	   
   });
</script>
<style>
#chatArea {
    width: 200px; height: 100px; overflow-y: auto; border: 1px solid black;
}

.send{
    border:1px solid green; 
    text-align:right;
    padding:10px;
    
 }
 
 .recv{
    border:1px solid yellow;
    color:blue;
    text-align:left;
    padding:10px;
 }
</style>
</head>
<body>
    이름:<input type="text" id="nickname">
    <input type="button" id="enterBtn" value="입장">
    <input type="button" id="exitBtn" value="나가기">
    
    <h1>대화 영역</h1>
    <div id="chatArea"><div id="chatMessageArea"></div></div>
    <br/>
    <input type="text" id="message">
    <input type="button" id="sendBtn" value="전송">
</body>
</html>