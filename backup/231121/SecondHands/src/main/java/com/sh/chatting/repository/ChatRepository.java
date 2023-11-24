package com.sh.chatting.repository;

import java.util.List;

import com.sh.chatting.domain.ChatDTO;
import com.sh.login.domain.LoginDTO;

public interface ChatRepository {
   
   public int insert(ChatDTO chatDTO);

   List<Object> selectAllCode(String buy_code);

   String selectChatCode(String chat_code);

   boolean cheackCode(String buy_code, String sell_code, String board_id,String board_Title, String user_nickname);
   
   public int deleteChatByCode(String chat_code,String buy_code);
   
   



}