package com.acorn.day1.model;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ModelAttributeEx {
	
	//Model 객체에 자동으로 저장해 줌  key는 User 첫 글자 소문자형태로 키가 정해짐 
	//Model객체에 담은 데이터는 화면(view)에서 꺼낼 수 있다
	@RequestMapping("/mAttribute")
	public String  test1(@ModelAttribute  User user) {    //@ModelAttribute   생략가능함  , model 객체에 자동으로 담아줌 
		return "mview1";
	}
	
	
	@RequestMapping("/mAttribute2")
	public String  test2( User user) {    //@ModelAttribute   생략가능함  , model 객체에 자동으로 담아줌 
		return "mview2";
	}	 
 
	@RequestMapping("/mAttribute3")
	public String  test4(@ModelAttribute("nUser") User user) {    // 키이름을 원하는 걸로  정할때는 @ModelAttribute 생략불가함   , model 객체에 자동으로 담아줌 
		return "mview3";                              
	}
	 
	 
	
}
