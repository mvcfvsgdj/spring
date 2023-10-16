package com.acorn.cart;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class OrderService {
	
	@Autowired
	OrderDAOImp dao;
	
	public void registerOrder( List<OrderDTO> list ) {
		
		for( OrderDTO  orderItem : list) {
			
			try {
				dao.insert(orderItem);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	 

}
