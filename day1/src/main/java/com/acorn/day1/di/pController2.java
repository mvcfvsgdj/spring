package com.acorn.day1.di;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class pController2 {


	@Autowired
	Program p ;
	
	
	@GetMapping("/p2.ok")
	public String test1() {
		
		System.out.println(  p );
		int result= p.addP(6, 3);
		System.out.println(result);
		return "pView2";
	}
}
