package com.acorn.day2;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


//mapping method 단위로

@Controller
public class TestController {
	
	@Autowired
	TestService service;
	
	@RequestMapping("/gugudan")
	public String test1(@RequestParam(required=false, defaultValue="2") int dan, Model mv) {
		
		ArrayList<String> danList = service.getDan(dan);
		mv.addAttribute("list",danList);
		System.out.println(dan);
		return "test";
	}
	@RequestMapping("/movieList")
	public String test2(Model mv) {
	
		ArrayList<String> movieList = service.getMovieList();
		mv.addAttribute("movie", movieList);
		return "test2";
	}
}

