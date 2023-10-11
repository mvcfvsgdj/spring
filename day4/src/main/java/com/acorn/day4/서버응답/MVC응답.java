package com.acorn.day4.서버응답;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

// VIEW + DATA

@Controller
public class MVC응답 {

	@GetMapping("/mvc1")
	public String mvc1(Model model) {
		model.addAttribute("message","mvc1");
		return"뷰이름";
		
	}
	@GetMapping("/mvc2") //mvc2 view 인식
	public void mvc2(Model model) {
		model.addAttribute("message","mvc2");
	}
	@GetMapping("/mvc3")
	public ModelAndView mvc3(){
		ModelAndView mv =new ModelAndView();
		mv.setViewName("뷰이름2");
		mv.addObject("message","mvc3");
		return mv;
	}

	}
	

