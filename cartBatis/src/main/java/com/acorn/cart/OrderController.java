package com.acorn.cart;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
 

 

@Controller
public class OrderController {
	
	@Autowired
	OrderService service  ;
	 
	
	@PostMapping("/order")
	public String order( @RequestParam String[] h_orderItem , HttpServletRequest request) {   //@RequestParam 해야함 
		
	//	System.out.println( Arrays.toString(h_orderItem));
		HttpSession session = request.getSession();
		
		
		//
		Map<String , List>  cartMap  =  (Map<String, List>)session.getAttribute("cartMap");  // 세션으로부터 cartMap 정보 얻어오기
		List<GoodsDTO> goodsList = cartMap.get("goodsList");    // 장바구니에 대한 상품목록
		List<CartDTO>  cartList = cartMap.get("cartList");      // 장바구니번호
		
		//주문정보를 담을 리스트 준비함
		List<OrderDTO> orderList = new ArrayList<OrderDTO>();			
		 
		for( int i=0; i< h_orderItem.length ; i++) {
			String[] orderItem = h_orderItem[i].split(":");	
			String orderGoodsNo = orderItem[0];   //상품코드 
			int  orderQty =  Integer.parseInt( orderItem[1]); // 주문수량
			GoodsDTO goodsDTO = goodsList.get(i);
			
			if( !orderGoodsNo.equals("")) {
				OrderDTO  orderDTO= new OrderDTO();
				orderDTO.setGoodsNo(orderGoodsNo);
				orderDTO.setMemberId("test01");
				orderDTO.setQty( orderQty);				
				orderDTO.setAmount(  goodsDTO.getPrice() *  orderQty);
				orderDTO.setGoodsName(goodsDTO.getName());
				orderList.add(orderDTO); 			 
			}			
			
		}
		
		 System.out.println( orderList);		 
		 session.setAttribute("orderList", orderList);		
		 return "order";		 
	}
	  
	
	
	
	@PostMapping("/orderFinal")
	public String orderFinal(@RequestParam Map<String, String> recevier , HttpServletRequest request) {			
		
		  HttpSession session = request.getSession();
		  List<OrderDTO> list =  (  List<OrderDTO>)session.getAttribute("orderList");
		  
		  
		  String addr1 = recevier.get("addr1");
		  String addr2 = recevier.get("addr2");
		  String tel = recevier.get("tel");
		  String name = recevier.get("name");
		  
		  
		  for( int i=0; i< list.size(); i++) {
			  list.get(i).setAddr1(addr1);
			  list.get(i).setAddr2(addr2);
			  list.get(i).setTel(tel);
			  list.get(i).setName(name);			  
		  }
		 
		  service.registerOrder( list );	
		  		  
		  return  "ok"; 
		
	}


}
