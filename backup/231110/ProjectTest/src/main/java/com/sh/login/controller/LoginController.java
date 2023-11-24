package com.sh.login.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;

@Controller
public class LoginController {

	@Autowired
	private LoginService loginService;

	@PostMapping("/login")
	public String processLogin(@ModelAttribute LoginDTO loginDTO, HttpServletRequest request) {
		if (loginService.checkLogin(loginDTO)) {
			// System.out.println("dfdfdf===>" + loginDTO);

			HttpSession session = request.getSession();

			session.setAttribute("user", loginDTO);

			// 세션에서 유저 정보 가져오기
			LoginDTO loggedInUser = (LoginDTO) session.getAttribute("user");
			// System.out.println("Logged in user: " + loggedInUser);

			// selectAll 메소드 호출하여 유저 정보 가져오기
			List<Object> selectedUser = loginService.selectAll(loginDTO);
			// System.out.println("Selected user: " + selectedUser);

			// 세션에 selectedUser 저장
			session.setAttribute("selectedUser", selectedUser);

			return "/homePage/homePage";
		} else {

			return "redirect:/login?error=loginerror";
		}
	}
}
