package com.acorn.day2.api;

import java.util.ArrayList;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class ApiController {
 
	/*   자바객체  -> json으로  convert
	 <dependency>  
		<groupId>com.fasterxml.jackson.core</groupId>     
		<artifactId>jackson-databind</artifactId>
		<version>2.9.3</version>
	</dependency>
	 */
	
	/*
	 *  ajax이용하여 서버로 부터 데이터 받아서 출력하기
	 * 
	 */
	@ResponseBody
	@GetMapping("/likes")
	public  ArrayList<String> getList(){
		ArrayList<String> likes = new ArrayList<>();
		likes.add("오징어게임");
		likes.add("더글로리");
		likes.add("무빙");	
		return likes;		
	}	
	
}
