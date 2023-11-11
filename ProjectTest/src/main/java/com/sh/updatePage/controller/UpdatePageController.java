package com.sh.updatePage.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.sh.login.domain.LoginDTO;
import com.sh.login.service.LoginService;

@Controller
public class UpdatePageController {

	@Autowired
	private LoginService loginService;

	@GetMapping("/update")
	public String myPage() {
		return "/myPage/updatePage";
	}

	@PostMapping("/update")
	public String processUpdate(@ModelAttribute LoginDTO loginDTO, HttpServletRequest request) {
		if (loginService.updateUser(loginDTO) > 0) {
			// 업데이트 성공
			HttpSession session = request.getSession();
			// 업데이트 후 사용자 정보를 다시 조회
			List<Object> updatedUser = loginService.selectAll(loginDTO);
			// 세션에 업데이트된 사용자 정보 저장
			session.setAttribute("selectedUser", updatedUser);
			return "redirect:/homePage";
		} else {
			return "redirect:/update?error=updateerror";
		}
	}

}
