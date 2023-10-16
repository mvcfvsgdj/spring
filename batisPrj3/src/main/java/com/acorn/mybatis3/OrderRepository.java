package com.acorn.mybatis3;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

 /*
  * 
  * 
  * 
  * // 조인된 쿼리를 저장할 테이블
 create table ordera(
     orderno varchar2(10) primary key, 
     userid  varchar2(10),
     price  varchar2(10) 
 );
insert into ordera  values(  'o001', 'm01', '25000');


create table membera(
   userid varchar2(20) primary key, 
   username varchar2(20),
   tel varchar2(20)
);

insert into membera  values( 'm01', '홍길동' , '02-1111-2222');
  */

@Repository
public class OrderRepository {
	 @Autowired
	    private SqlSession session;
	    private static String namespace = "com.acorn.OrderMapper.";

	  public List<OrderDTO> insert(){
		  return session.selectList(namespace+"insert");
	  }
	    
	    public List<OrderDTO> selectAll() throws Exception {
	        return session.selectList(namespace+"selectAll");
	    } // List<E> selectList(String statement)
	
	    
	    public List<OrderDTO> selectAll2() throws Exception {
	        return session.selectList(namespace+"selectAll2");
	    } //
}
