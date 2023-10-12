package com.acorn.cookie;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class VisitController {
	// @ResponseBody //데이터 응답

	@GetMapping("/count")
	public String cookie(HttpServletRequest request, HttpServletResponse response) {

		// 1.쿠키 읽기
		// 2.정보가 있는 경우 카운트 증가
		// 정보가 없는 경우 1
		// 3.쿠키 저장(사용자 pc, 클라이어트)
		Cookie[] cookies = request.getCookies();
		System.out.println(cookies);
		int count = 0;
		if (cookies != null) {

			for (Cookie cookie : cookies) {
				System.out.println(cookie.getName());
				System.out.println(cookie.getValue());
				if (cookie.getName().equals("count")) {
					String count_ = cookie.getValue();
					count = Integer.parseInt(count_);
					break;
				}
			}
		}

		count++; // "10"=> 10 정적메소드 10 =>"10"
		Cookie cookie = new Cookie("count", String.valueOf(count));
		//
		response.addCookie(cookie);

		return "visitHome";
	}
}
