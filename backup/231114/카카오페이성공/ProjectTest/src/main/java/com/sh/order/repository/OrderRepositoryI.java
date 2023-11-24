package com.sh.order.repository;

import java.util.List;

import com.sh.order.domain.OrderDTO;


public interface OrderRepositoryI {

	public int insert(OrderDTO orderDTO);

	 List<OrderDTO> getOrdersByUserCode(String user_id);
}