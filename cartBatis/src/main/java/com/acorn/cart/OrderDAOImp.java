package com.acorn.cart;

 

import java.util.HashMap;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
 

@Repository
public class OrderDAOImp {
    @Autowired
    private SqlSession session;
    private static String namespace = "acorn.OrderMapper.";

     
    
    public int insert(OrderDTO dto) throws Exception {
        return session.insert(namespace+"insertNewOrder", dto);
    }  

    
     
}
 