package com.acorn.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CartService {
	
	@Autowired
	CartDAOImp dao;
	
	
	
	//고객id를 주면   장바구니정보와 장바구니에 담긴 상품정보 반환 
	public Map<String, List>  cartList( String id) throws Exception {
	 
		 Map<String , List> cartMap= new HashMap<String , List> ();
		 
		 List<CartDTO> cartList = dao.selectCart( id);
		 List<GoodsDTO> goodsList = dao.selectGoods( cartList);
		 
		 cartMap.put("cartList" , cartList);
		 cartMap.put("goodsList" , goodsList);
		 
		 return cartMap;
		 
	}
	
	


}
