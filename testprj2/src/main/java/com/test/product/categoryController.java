package com.test.product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

@Controller
public class categoryController {
	
	@Autowired
	ProductService  dao;
	
 
	
	@GetMapping("/test22")
	public void name(Model model) {
		ArrayList<cate> list = new ArrayList<>();
		cate cate1 = new cate("강남구","01");
		cate cate2 = new cate("강서구","01");
		cate cate3 = new cate("양천구","01");
		list.add(cate1);
		list.add(cate2);
		list.add(cate3);
		
		ArrayList<cate> list2 = new ArrayList<>();
		cate cate4 = new cate("강남구","02");
		cate cate5 = new cate("강서구","02");
		cate cate6 = new cate("양천구","02");
		list2.add(cate4);
		list2.add(cate5);
		list2.add(cate6);
		
		
		
		Map<String, ArrayList<cate>>  map = new HashMap<>();
		map.put("서울", list2);
		map.put("경기", list);
		
		
		//
		
		
		
		Gson gson = new GsonBuilder().create();
		
		String json2 = gson.toJson(map);
		
		
		System.out.println(json2);
		model.addAttribute("item" , json2);
	}
	
	
	
	@GetMapping("/test222")
	public void name2(Model model) {
		List<cate> list1 =  dao.getAllCategories("서울"); 		
		List<cate> list2 = dao.getAllCategories("제주도");	
		
		System.out.println( list1);
		
		
		Map<String, List<cate>>  map = new HashMap<>();
		map.put("서울", list1);
		map.put("제주도", list2); 
	 
		
		Gson gson = new GsonBuilder().create();
		
		String json2 = gson.toJson(map);
		
		
		System.out.println(json2);
		model.addAttribute("item" , json2);
	}
	
		 	
	  
}


