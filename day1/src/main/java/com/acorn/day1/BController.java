package com.acorn.day1;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


//매서드 단위로 mapping
@Controller
public class BController {

	@RequestMapping(value = "/test1", method = RequestMethod.GET)
	public String  test1() {
		//반환타입 String => view 이름 의미
		
		return "viewName";
	}
	@RequestMapping(value = "/test2", method = RequestMethod.GET)
	public void test2() {
		//VOID 일때는 매핑정보를 VIEW이름으로 인식
		
		
		
	}
	@GetMapping("/test3")
	public void test3() {
		//test3 view
	}
}
