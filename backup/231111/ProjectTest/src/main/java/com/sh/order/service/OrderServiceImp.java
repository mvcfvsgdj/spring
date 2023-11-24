package com.sh.order.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sh.order.domain.OrderDTO;
import com.sh.order.repository.OrderRepositoryI;

@Service
public class OrderServiceImp implements OrderServiceI {

	@Autowired
	OrderRepositoryI dao;

	@Override
	public int registerOrder(OrderDTO orderDTO) {

		return dao.insert(orderDTO);
	}

	@Override
	public List<OrderDTO> getOrdersByUserCode(String user_id) {

		System.out.println("dkfkfkf" + user_id);
		return dao.getOrdersByUserCode(user_id);
	}

}
