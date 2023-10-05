package com.acorn.param;

import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RequestParamEx2 {
	
	
	@RequestMapping(value="/paramT1" ,  method=RequestMethod.POST ) 
	public String  test1(@RequestParam String[] fruit) {		
		System.out.println( Arrays.toString(fruit));		
		return "view";
	}
	
	
	@RequestMapping(value="/paramT2" ,  method=RequestMethod.POST ) 
	public String  test2(@RequestParam ArrayList<String> fruit) {		
		System.out.println("fruit" +  fruit);		
		return "view";
	} 
	
	
	@RequestMapping(value="/paramT3" ,  method=RequestMethod.POST ) 
	public String  test3( HttpServletRequest request) {		
	 
		String[] fruit = request.getParameterValues("fruit");
		System.out.println( Arrays.toString(fruit));
		return "view";
	} 
	

}
