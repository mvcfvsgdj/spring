package com.sh.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.chatting.domain.ChatDTO;
import com.sh.chatting.service.ChatService;
import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;
	// ChatService를 주입
	@Autowired
	private ChatService chatService;

	@PostMapping("/login")
	public String processLogin(@ModelAttribute LoginDTO loginDTO, @ModelAttribute ChatDTO chatDTO,
			HttpServletRequest request) {
		if (loginService.checkLogin(loginDTO)) {
			// System.out.println("dfdfdf===>" + loginDTO);

			HttpSession session = request.getSession();

			session.setAttribute("user", loginDTO);

			// 세션에서 유저 정보 가져오기
			LoginDTO loggedInUser = (LoginDTO) session.getAttribute("user");
			// System.out.println("Logged in user: " + loggedInUser);

			// selectAll 메소드 호출하여 유저 정보 가져오기
			List<Object> selectedUser = loginService.selectAll(loginDTO);
			System.out.println("Selected user: " + selectedUser);

			LoginDTO firstSelectedUser = (LoginDTO) selectedUser.get(0);

			// 세션에 selectedUser 저장
			session.setAttribute("selectedUser", selectedUser);
			String chatlogin = firstSelectedUser.getUser_code();
			System.out.println("코드뽑아오기" + chatlogin);

			List<Object> chatList = chatService.selectAllCode(chatlogin);
			System.out.println("넘어갈때 리스트@@@@@@" + chatList);
			session.setAttribute("chatList", chatList);

			return "/homePage/homePage";
		} else {

			return "redirect:/login?error=loginerror";
		}

	}

	@PostMapping("/heat")
	public String showHeatPage(@RequestParam String sell_code, Model model) {

		String user_heat = loginService.selectHeat(sell_code);
		String user_nickname = loginService.selectHeatU(sell_code);

		model.addAttribute("sell_code", sell_code);
		model.addAttribute("user_heat", user_heat);
		model.addAttribute("user_nickname", user_nickname);
		System.out.println(user_nickname);
		return "order/heat";
	}

	@PostMapping("/updateHeat")
	public String updateHeat(@ModelAttribute LoginDTO loginDTO, @RequestParam String user_heat,
			@RequestParam String user_code, HttpServletRequest request) {
		if (loginService.updateHeat(user_heat, user_code) > 0) {
			List<Object> updatedUser = loginService.selectAll(loginDTO);
			System.out.println(updatedUser);
			
			loginService.saveHeat(user_code, user_heat);
			return "/homePage/homePage";

		} else {
			return "/order/heat";
		}
	}

}
