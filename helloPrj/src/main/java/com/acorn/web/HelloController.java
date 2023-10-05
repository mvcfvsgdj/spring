package com.acorn.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
@Controller
public class HelloController {

	@GetMapping("/hello")
	public String hi() {
		return "hi"; // WEB-INF/views/hi.jsp ¿¿¥‰
	}
	@GetMapping("/hi") //hi?id=test&pw=0000
	public String h2(String id, String pw) {
		System.out.println(id + pw);
		return "hi2";
	}
	@GetMapping("/hi2")
	public String h3(User user) {
		System.out.println(user);
		return "hi3";
	}
	@GetMapping("/hi0")
	public void hello0(HttpServletRequest request ,HttpServletResponse response) {
		try {
			request.getRequestDispatcher("WEB-INF/views/hi0.jsp").forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
