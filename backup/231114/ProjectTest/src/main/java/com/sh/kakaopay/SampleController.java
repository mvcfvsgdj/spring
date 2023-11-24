package com.sh.kakaopay;


import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sh.order.domain.OrderDTO;
import com.sh.order.service.OrderServiceI;
import com.sh.product.domain.ProductDTO;
import com.sh.product.service.ProductServiceI;

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {
 

	@Autowired
	OrderServiceI service;

	@Autowired
	ProductServiceI productservice;

	
	   @Setter(onMethod_ = @Autowired)
	    private KakaoPay kakaopay;
	    
	    
	    @GetMapping("/kakaoPay")
	    public void kakaoPayGet(@RequestParam String boardId,OrderDTO orderDTO, Model model, HttpSession session) {
	        ProductDTO product = productservice.getProductById(boardId);
		    List<ProductDTO> productList = new ArrayList<>(); // 새로운 리스트를 생성합니다.

		    // 원하는 상품만 추가합니다.
		    productList.add(product);
		    model.addAttribute("product", product);
		    model.addAttribute("products", productList);
 
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay() {
	   
	        
	        return "redirect:" + kakaopay.kakaoPayReady();
	 
	    }
	    
	    @GetMapping("/kakaoPaySuccess")
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	    
	        model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token));
	    }
	    
	}