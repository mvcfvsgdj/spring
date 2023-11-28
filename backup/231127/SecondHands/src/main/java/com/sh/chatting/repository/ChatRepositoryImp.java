package com.sh.chatting.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.chatting.domain.ChatDTO;
import com.sh.login.domain.LoginDTO;

@Repository
public class ChatRepositoryImp implements ChatRepository {
   
   @Autowired
   private SqlSession session;
   private static String namespace = "com.sh.chatting.ChatMapper.";

   @Override
   public int insert(ChatDTO chatDTO) {
      return session.insert(namespace + "insertChat", chatDTO);

   }
   
   @Override
   public List<Object> selectAllCode(String buy_code){
      List<Object> code = session.selectList(namespace + "selectChatSellCode", buy_code);
      return code;
   }
   
   @Override
   public String selectChatCode(String chat_code){
      String code = session.selectOne(namespace + "selectChatChatCode", chat_code);
      return code;
   }

   @Override
   public boolean cheackCode(String buy_code, String sell_code,String board_id,String board_Title, 
		   String user_nickname,String board_Price,String board_Img) {
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("buy_code", buy_code);
      map.put("sell_code", sell_code);
      map.put("board_id", board_id);
      map.put("board_Title", board_Title);
      map.put("user_nickname", user_nickname);
      map.put("board_Price", board_Price);
      map.put("board_Img", board_Img);



      
      System.out.println(buy_code);
      System.out.println(sell_code);
      System.out.println(board_id);


      return session.selectOne(namespace+"cheackCode",map);
   }

   @Override
   public int deleteChatByCode(String chat_code,String buy_code) {
      // TODO Auto-generated method stub
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("buy_code", buy_code);
      map.put("chat_code", chat_code);
      
      System.out.println(buy_code);
      System.out.println(chat_code);
       return session.delete(namespace + "deleteChatByCode", map);
   }






   
   
   
   

}