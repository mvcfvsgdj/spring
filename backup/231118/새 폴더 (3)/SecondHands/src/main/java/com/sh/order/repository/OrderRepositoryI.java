package com.sh.order.repository;

import java.util.List;

import com.sh.order.domain.OrderDTO;


public interface OrderRepositoryI {

   public int insert(OrderDTO orderDTO);

    List<OrderDTO> getOrdersByUserCode(String user_id);

   String selectBoardId(String board_id);
   public void deleteProduct5(String user_id);

    
}