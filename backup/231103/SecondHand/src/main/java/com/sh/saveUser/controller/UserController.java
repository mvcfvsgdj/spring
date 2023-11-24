package com.sh.saveUser.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sh.saveUser.service.UserMemberService;

@Controller
public class UserController {

	@Autowired
	UserMemberService service;

	@GetMapping("/logintest1111")
	public String logintest() {
		return "/saveUser/saveUser";
	}
	
	@ResponseBody
	@PostMapping("/isUserIdExists")
	public boolean isUserIdExists(@RequestParam String user_id) {
	    return service.isUserIdExists(user_id);
	}


}
