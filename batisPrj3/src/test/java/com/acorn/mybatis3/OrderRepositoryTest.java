package com.acorn.mybatis3;

import static org.junit.Assert.*;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.acorn.mybatis3.OrderRepository;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/test.xml" , "file:src/main/webapp/WEB-INF/spring/**/test2.xml"} )
@Log4j
public class OrderRepositoryTest {
	
	@Autowired
	OrderRepository dao;

	@Test
	public void test() throws Exception {
		log.info( dao.selectAll());
	}
	@Test
	public void test2() throws Exception {
		log.info( dao.selectAll2());
	}
	@Test
	public void test3() throws Exception {
		log.info( dao.insert());
	}

}
