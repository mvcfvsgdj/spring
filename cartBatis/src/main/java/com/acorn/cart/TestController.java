package com.acorn.cart;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

 
public class TestController {
	
	
	@PostMapping("/reg")
	public String test( @RequestParam Map<String, String> receiver) {   //@RequestParam 해야함 		
		
		System.out.println(receiver);
		System.out.println(receiver.get("id"));
		return "test";
	}
	
	
	@GetMapping("/cartListTest")
	public ModelAndView list( String id) {   //@RequestParam 해야함 
		
		 
		ModelAndView mav= new ModelAndView();
		
		Map<String, List> cartMap = new HashMap<String , List>();
		
		
		//장바구니 정보 테이블에서 가져오기, id = test01
		List<CartDTO> cartList =new ArrayList<CartDTO>();
		cartList.add(new CartDTO("01", "test01", "g001" ,3));
		cartList.add(new CartDTO("02", "test01", "g002" ,1));
		
		 
		//장바구니 상품에 대한 상품 정보
		List<GoodsDTO> goodsList = new ArrayList<GoodsDTO>();
		goodsList.add( new GoodsDTO("g001" ,"pants" , 3000));
		goodsList.add( new GoodsDTO("g002" ,"t-shirt" , 2000));
		
		mav.setViewName("cartList"); 
		cartMap.put("cartList", cartList);
		cartMap.put("goodsList" , goodsList );
		
		mav.addObject("cartMap", cartMap);
		return mav;
	}
	
	
	@PostMapping("/order")
	public String order( @RequestParam String[] h_orderItem) {   //@RequestParam 해야함 
		
		System.out.println( Arrays.toString(h_orderItem));
		
		for( int i=0; i< h_orderItem.length ; i++) {
			String[] orderItem = h_orderItem[i].split(":");
			System.out.println( orderItem[0]);
		}
		
		 return"test";
		 
	}

}
