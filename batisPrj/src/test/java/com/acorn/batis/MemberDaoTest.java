package com.acorn.batis;

import static org.junit.Assert.assertTrue;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/test.xml" , "file:src/main/webapp/WEB-INF/spring/**/test2.xml"} )
@Log4j
public class MemberDaoTest {

	
	@Autowired
	 MemberDao dao;
 
	public void test() throws Exception {
		 
	}
	
	
	@Test
	public void test2() throws Exception {
		//fail("Not yet implemented");		
		log.info(   dao.insert(new Member("lee","1234","장주원" )));
	}
	
	
	@Test 
	public void test3() throws Exception {
	 // dao.selectAll().forEach(m -> System.out.println( m.getId()));
		  dao.selectAll().forEach(m -> log.info(m));
		  
	}

	 
	@Test 
	public void test4() throws Exception {	 
		 log.info( dao.delete( "lee") );
		  
	}

	@Test
	public void test5() throws Exception {	 
		 log.info( dao.deleteAll() );
		  
	}

}
