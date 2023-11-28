package com.test.kakaopay;

import lombok.Data;


@Data
public class OrderDTO {
	
	 String  partner_order_id; 
     String  partner_user_id ;
     String  item_name; 
     String quantity ; 
     String total_amount; 

}
