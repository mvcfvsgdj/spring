package com.acorn.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
 

 

@Controller
public class CartController {
	
	@Autowired
	CartService service  ;
	 
	
	@RequestMapping("/cartList")
	public String cartList( HttpServletRequest request) {		
		 	try {
		 		
		 		HttpSession  session  =request.getSession();		 		
		 		String id="test01";   // 고객id를 test01로 설정함
		 		System.out.println( service.cartList( id));		 		
		 		Map<String , List>  cartMap  = service.cartList(id);
		 		session.setAttribute("cartMap", cartMap);  // 장바구니상품정보를세션에 담는다		 		
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}		 	
		 	
		 	return  "cartList";
	}
	


}
