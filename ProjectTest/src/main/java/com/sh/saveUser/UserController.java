package com.sh.saveUser;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UserController {

	@Autowired
	UserMemberService service;

	@GetMapping("/logintest1111")
	public String logintest() {
		return "saveUser";
	}
	
	@ResponseBody
	@PostMapping("/isUserIdExists")
	public boolean isUserIdExists(@RequestParam String user_id) {
	    return service.isUserIdExists(user_id);
	}


}
