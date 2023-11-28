package com.sh.order.service;

import java.util.List;

import com.sh.order.domain.OrderDTO;


public interface OrderServiceI {

	public int registerOrder(OrderDTO orderDTO);

	public List<OrderDTO> getOrdersByUserCode(String user_id);

}
