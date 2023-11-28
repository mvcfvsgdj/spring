package com.test.kakaopay;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam; 

import lombok.Setter;
import lombok.extern.java.Log;

@Log
@Controller
public class SampleController {
 
	   @Setter(onMethod_ = @Autowired)
	    private KakaoPay kakaopay;
	    
	    
	   OrderDTO order;
	   
	   
	    @GetMapping("/kakaoPay")
	    public void kakaoPayGet() {
	        
	    }
	    
	    @PostMapping("/kakaoPay")
	    public String kakaoPay(  OrderDTO order   ) {
	        log.info("kakaoPay post............................................");
	        
	        //결제정보를 받아서  kakaPayReay(  order )//현재결제해야하는 결제정보를 넘겨줌
	        
	        this.order  = order;
	        
	        System.out.println( "oreder" + order);
	        return "redirect:" + kakaopay.kakaoPayReady( order);
	 
	    }
	    
	    @GetMapping("/kakaoPaySuccess")
	    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model) {
	        log.info("kakaoPaySuccess get............................................");
	        log.info("kakaoPaySuccess pg_token : " + pg_token);	 
	        KakaoPayApprovalVO   approvalVo = kakaopay.kakaoPayInfo(pg_token , order);
	        model.addAttribute("info",approvalVo);	        
	        
	        //order 
	        //
	        
	        //데이터베이스 저장 
	        // repository.insert( order) ;
	    }
	    
	}