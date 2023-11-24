package com.sh.chatting.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.chatting.domain.ChatDTO;
import com.sh.chatting.service.ChatService;
import com.sh.chatting.service.ChatServiceImp;

@Controller
public class ChatController {
	
	@Autowired
	private ChatService chatService;
	

	
//	@GetMapping("/chatinsert")
//	public String chatinsert() {
//		return "/homePage/homePage"; 
//	}
	
	
	
//	@PostMapping("/insertchatcode")
//	public String chatcode(ChatDTO chatDTO, HttpSession session) {
//	    session.setAttribute("buy_code", chatDTO.getBuy_code());
//	    chatService.insertChat(chatDTO);
//	    System.out.println("성공");
//	    return "/homePage/homePage";
//	}
	
//	@GetMapping("/chattingList")
//	public String chattingList() {
//		return "chattingList"; 
//	}
	
//	@PostMapping("/chattingList")
//	public String chatList(@RequestParam String buy_code, HttpSession session) {
//	    List<Object> chatList = chatService.selectAllCode(buy_code);
//	    session.setAttribute("chatList", chatList);
//	    return "/chatting/chattingList";
//	}
	
    @PostMapping("/chattingList")
    public String chatList(@RequestParam String buy_code, HttpSession session, Model model) {
        List<Object> chatList = chatService.selectAllCode(buy_code);
        System.out.println("넘어갈때 리스트"+chatList);
        session.setAttribute("chatList", chatList);
        return "/chatting/chattingList"; 
    }
	
	@PostMapping("/inchat")
	public String inchat(@RequestParam String chat_code, Model model) {
        String chatCode = chatService.selectChatCode(chat_code);
        model.addAttribute("chatCode", chatCode);
	    System.out.println(chatCode);
	    return "chatting/chatting";
	}
	
	@PostMapping("/checkCode")
	public String checkCode(ChatDTO chatDTO,@RequestParam String buy_code, @RequestParam String sell_code,
			@RequestParam String board_id,HttpSession session, Model model) {
	    boolean isCodeValid = chatService.cheackCode(buy_code, sell_code,board_id);
	    model.addAttribute("isCodeValid", isCodeValid);
	    System.out.println(isCodeValid);
	    if (isCodeValid == false) {
	        session.setAttribute("buy_code", chatDTO.getBuy_code());
	        chatService.insertChat(chatDTO);
	        System.out.println("아이디확인!!!!!!!!!"+chatDTO.getBuy_code());

	        List<Object> chatList = chatService.selectAllCode(chatDTO.getBuy_code());
	        System.out.println("넘어갈때 리스트@@@@@@"+chatList);
	        session.setAttribute("chatList", chatList);

	        System.out.println("성공");
	        return "/homePage/homePage";
	    } else {
	        model.addAttribute("isCodeValid", false); 
	        System.out.println("실패");
	        return "/products/productDetail";
	    }
	}
	
//	@GetMapping("/deleteChat")
//	public String deleteChat() {
//		return "/chatting/deleteChatting";
//	}
	
	 @PostMapping("/deleteChatting")
	    public String deleteChatting(ChatDTO chatDTO,@RequestParam String chat_code,@RequestParam String buy_code,HttpSession session, Model model) {
	        int result = chatService.deleteChatByCode(chat_code,buy_code);
	        if (result > 0) {
	            // 삭제 성공, 리디렉션 또는 성공 메시지 표시 가능
	            System.out.println("채팅이 성공적으로 삭제되었습니다");
	            List<Object> chatList = chatService.selectAllCode(buy_code);
	            System.out.println("나와라 제발"+chatList);
	            session.setAttribute("chatList", chatList);
	        } else {
	            // 삭제 실패, 리디렉션 또는 에러 메시지 표시 가능
	            System.out.println("채팅 삭제에 실패했습니다");
	        }
	        return "/homePage/homePage";
	    }
	

	


}
