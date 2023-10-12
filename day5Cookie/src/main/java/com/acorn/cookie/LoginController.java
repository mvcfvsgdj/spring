package com.acorn.cookie;

import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/login")
public class LoginController {

	@RequestMapping("/login") // /login/login
	public String loginForm() {
		return "loginForm";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(String id, String pw, boolean rememberId, HttpServletResponse response , HttpServletRequest request) {
		//로그인성공
		if (loginCheck(id, pw)) {

			// 세션에 저장
			HttpSession session = request.getSession();
			session.setAttribute("sessionId", id);
			// 아이디 기억
			if (rememberId) {
				// 저장
				Cookie cookie = new Cookie("id", id);
				response.addCookie(cookie);

			} else {
				// 삭제
				Cookie cookie = new Cookie("id", id);
				response.addCookie(cookie);
				cookie.setMaxAge(0);
			}

			return "main";
		} else {
			// = "id 나 pw error!";
			String msg  = URLEncoder.encode("id 나 pw error!");
			return "redirect:/login/login?msg="+msg; // response.sendRedirect("/login/");
		}
	}
	
	@RequestMapping("/logOut")
	public String logOut(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "redirect:/";
	}
	
	public boolean loginCheck(String id, String pw) {
	
		if (id.equals("acorn") && pw.equals("1234")) {
			return true;
		} else {
			return false; // 데이터베이스 체크해야하는 부분
		}

	}
}
