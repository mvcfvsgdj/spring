package com.sh.kakaologin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.kakaologin.service.KakaoMemberServiceI;
import com.sh.saveUser.domain.UserDTO;
import com.sh.saveUser.service.UserMemberService;

@Controller
public class KakaoController {

	@Autowired
	KakaoMemberServiceI service;

	@Autowired
	UserMemberService service1;

	@GetMapping("/login")
	public String logintest() {
		return "/login/login";
	}

	@PostMapping("/kakaoForm")
	public String sendData(@RequestParam String user_kakao, @RequestParam String nickname,
			@RequestParam String profile_image, Model model) {
		model.addAttribute("user_kakao", user_kakao);
		model.addAttribute("nickname", nickname);
		model.addAttribute("profile_image", profile_image);
		return "/saveUser/saveUser";
	}

	@PostMapping("/saveForm")
	public String registerMember(UserDTO userDTO) {
		service1.registerMember(userDTO);
		return "/login/login";
	}
}
