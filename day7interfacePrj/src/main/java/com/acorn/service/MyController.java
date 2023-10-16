package com.acorn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyController {

	@Autowired
	MyService service;
	
	@GetMapping("/joinus")
	public String register(String id,String name) {
		service.userRegister(id, name);
		return "ok";
		
	}
	
}
