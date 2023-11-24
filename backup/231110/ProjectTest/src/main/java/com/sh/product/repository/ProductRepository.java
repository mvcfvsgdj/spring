package com.sh.product.repository;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sh.product.domain.ProductDTO;
import com.sh.product.domain.cateDTO;




@Repository
public class ProductRepository {
   
   @Autowired
    private final SqlSession session;
   
    private static String namespace = "com.sh.proMapper.";

    @Autowired
    public ProductRepository(SqlSession session) {
       this.session = session;
    }
   
    public List<ProductDTO> getlist(){
       return session.selectList(namespace + "selectAll");
    }
    public void increaseClick(String boardId) {
        session.update(namespace + "increaseClick", boardId);
    }
    public void insertProData(ProductDTO product) {
       session.insert(namespace+ "insertProduct", product);
    }
    public ProductDTO selectProImagesById(String boardId) {
        return session.selectOne(namespace + "selectProImagesById", boardId);
    }
    public List<cateDTO> getCategory(){
       return session.selectList(namespace+"getAllCategory");
    }
    public List<cateDTO> getAllCategories( String loc_code) {
        return session.selectList(namespace+"getAllCategories" , loc_code);
    }
    public void deleteProduct(String boardId) {
        session.delete(namespace + "deleteProduct", boardId);
    }
    public int updateProduct(ProductDTO product) {
        return session.update(namespace + "updateProduct", product);
    }
    
    //좋아요
    public void addLike(Map<String, String> likeInfo) {
        session.insert(namespace + "addLike", likeInfo);
    }
    public void removeLike(Map<String, String> likeInfo) {
        session.delete(namespace + "removeLike", likeInfo);
    }
    public int getLikeCount(String boardId) {
        return session.selectOne(namespace + "getLikeCount", boardId);
    }
    
    public int insertLike(ProductDTO product) {
        return session.insert(namespace + "insertLike", product);
    }
    //끌어올리기
    public int updateDate(String boardId) {
        return session.insert(namespace + "updateDate", boardId);
    }
 
  
}
    
