package com.sh.chatting;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatWebSocketHandler extends TextWebSocketHandler {
    // 연결된 WebSocket 세션을 저장할 맵
	// 연결된 WebSocket 세션을 저장할 맵
    private Map<String, WebSocketSession> users = new ConcurrentHashMap<>();

    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        // WebSocket 연결이 성공적으로 열린 경우 호출됩니다.
        log(session.getId() + "연결됨");

        // 연결된 세션을 users 맵에 추가
        users.put(session.getId(), session);
    }

    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        // WebSocket 연결이 닫힌 경우 호출됩니다.
        log(session.getId() + "연결 종료됨");

        // 연결이 닫힌 세션을 users 맵에서 제거
        users.remove(session.getId());
    }

    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log(session.getId() + "로 부터 메시지 수신: " + message.getPayload());

        // 메시지를 파싱하여 목표 닉네임과 실제 메시지 내용을 분리합니다.
        String[] messageParts = message.getPayload().split(":", 2);
        if (messageParts.length == 2) {
            String targetNickname = messageParts[0];
            String messageContent = messageParts[1];

            // 발신자의 닉네임을 가져오는 메서드
            String senderNickname = getSenderNickname(session);

            for (WebSocketSession s : users.values()) {
                if (s.getId().equals(session.getId())) {
                    // 메시지를 보낸 클라이언트에게는 그대로 전송
                    s.sendMessage(new TextMessage("나에게: " + messageContent));
                } else if (s.getId().equals(targetNickname)) {
                    // 목표 닉네임과 일치하는 클라이언트에게만 메시지 전송
                    s.sendMessage(new TextMessage(senderNickname + ": " + messageContent));
                }
            }
        }
    }

    private String getSenderNickname(WebSocketSession session) {
        String senderNickname = session.getId(); // 기본적으로 세션 ID를 사용

        // 세션의 attribute로 사용자가 입력한 이름을 가져옵니다.
        if (session.getAttributes().containsKey("nickname")) {
            senderNickname = (String) session.getAttributes().get("nickname");
        }

        return senderNickname;
    }
    @Override
    public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
        // WebSocket 전송 오류가 발생한 경우 호출됩니다.
        log(session.getId() + " 익셉션 발생: " + exception.getMessage());
    }

    private void log(String logmsg) {
        // 로그를 출력하는 메서드
        System.out.println(new Date() + " : " + logmsg);
    }
}