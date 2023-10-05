package com.acorn.day1.model;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ModelEx {
	
	
	@RequestMapping("/model1")
	public String test1(Model model) {		
		model.addAttribute("message", "스프링조아");
		return "model1";
	}
	
	
	@RequestMapping("/model2")
	public String test2(Model model) {		
		ArrayList<String> list = new ArrayList<String>();
		list.add("jsp");
		list.add("mvc2");
		list.add("spring ");		
		model.addAttribute("list", list);
		return "model2";
	}
	
	
	@RequestMapping("/model3")
	public String test3(Model model) {		
		ArrayList<User> list = new ArrayList<User>();
		list.add( new User("kim", "0000"));
		list.add( new User("lee", "1111"));
		list.add( new User("choi", "2222"));	
		model.addAttribute("list", list);
		return "model3";
	}

}
