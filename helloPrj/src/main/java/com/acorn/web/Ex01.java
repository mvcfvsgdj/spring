package com.acorn.web;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Ex01 {


	@GetMapping("/ex1")
	public String method1(Model model) {
		model.addAttribute("message1","ㅎㅇㅌ");
		return "ex1";

	}
	@ResponseBody
	@GetMapping("/exdata")
	public String method2() {
		return "테스트애옹";
	}
	
	
	
	 
	@GetMapping("/exdata2")
	public void method3( HttpServletResponse resp) {
		 
		try {
			resp.setCharacterEncoding("UTF-8");
			resp.setContentType("text/plain;charset=utf-8");
			resp.getWriter().print("테스트이예용");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@ResponseBody
	@GetMapping("/books")
	public ArrayList<Book> method3(){
	ArrayList<Book> list = new ArrayList<Book>();
	list.add(new Book("test1", "0001"));
	list.add(new Book("test2", "0002"));
	list.add(new Book("test3", "0003"));
	list.add(new Book("test4", "0004"));
	list.add(new Book("test5", "0005"));
	return list;
	}
}
