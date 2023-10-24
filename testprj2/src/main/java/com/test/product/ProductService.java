package com.test.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ProductService {
	
	@Autowired
    private final SqlSession session;
	
    private static String namespace = "com.test.proMapper.";

    @Autowired
    public ProductService(SqlSession session) {
    	this.session = session;
    }
   
    public List<Product> getlist(){
    	return session.selectList(namespace + "selectAll");
    }
    public void increaseClick(String boardId) {
        session.update(namespace + "increaseClick", boardId);
    }
    public void insertProData(Product product) {
    	session.insert(namespace+ "insertProduct", product);
    }
    public Product selectProImagesById(String boardId) {
        return session.selectOne(namespace + "selectProImagesById", boardId);
    }
}

