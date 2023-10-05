package com.acorn.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Hello3Controller {


	@GetMapping("/model1")
	public String method1(Model model) {
		model.addAttribute("message","spring");
		return "model1";

	}
	@GetMapping("/model2")
	public String method2(Model model) {
		User user =new User("test03","9999");
		model.addAttribute("user",user);
		return "model2";
	}

}
