package com.acorn.db;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	
	@Autowired
	UserDao dao;
	@GetMapping("/userlist")
	public String selectAll() throws Exception {
		User result  = dao.selectUser("1");
		System.out.println( result);
		return "dfd";
		
	}

}
