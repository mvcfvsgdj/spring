package com.acorn.web;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Hello2Controller {

	@ResponseBody
	@GetMapping("/data1")
	public String method() {
		return "hi";

	}
	@ResponseBody
	@GetMapping("/data2")
	public User method2() {
		User user = new User("test02","1234");
		return user;

	}
	@ResponseBody
	@GetMapping("/data3")
	public ArrayList<User> method3(){
	ArrayList<User> list = new ArrayList<User>();
	list.add(new User("test1", "0001"));
	list.add(new User("test2", "0002"));
	list.add(new User("test3", "0003"));
	list.add(new User("test4", "0004"));
	list.add(new User("test5", "0005"));
	return list;}
	
}
