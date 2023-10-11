package com.acorn.day4.naver;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NaverController {

	@Autowired
	ApiExamSearchBlog api;
	
	@Autowired
	ApiExamSearchBlog2 api2;

	@ResponseBody
	@GetMapping(value="/naver",produces = "application/json;charset=UTF-8")
	public String naverapi() {
		String result =api.getNaverAPI();
		return result;
	}
	
	@ResponseBody
	@GetMapping(value="/naverList")
	public ArrayList<itemDTO> naverAPI2(Model model){
	 String result	= api2.getNaverAPI();
	 ArrayList<itemDTO>list = api2.fromJSONItems(result);
	 model.addAttribute("list", list);
	 return list;
 	}
	@ResponseBody
	@GetMapping(value="/naverList3")
	public ArrayList<itemDTO> naverAPI4(Model model){
	 String result	= api2.getNaverAPI();
	 ArrayList<itemDTO>list = api2.fromJSONItems(result);
	 return list;
	 
 	}
	@GetMapping(value="/naverList2")
	public String naverAPI3(Model model){
	 String result	= api2.getNaverAPI();
	 ArrayList<itemDTO>list = api2.fromJSONItems(result);
	 model.addAttribute("list", list);
	 
	 return "veiwtest2";
 	}
}
