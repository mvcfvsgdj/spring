package com.acorn.test;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

 

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/test.xml" , "file:src/main/webapp/WEB-INF/spring/**/test2.xml"} )
public class MemberDAOTest {
	
	@Autowired
	DataSource ds;
	@Autowired
	MemberDAO dao;

	public void test() throws SQLException {

		Connection con =  ds.getConnection();
		assertTrue(con != null);

	
	}

	
	@Test
	public void test2() throws SQLException {
		ArrayList<Member> list = dao.select();
		assertTrue(list.size()>=1);

	
	}
	@Test
	public void test3() throws SQLException {
		int result = dao.insert(new Member("hongt","11","11","11"));
		assertTrue(result==1);

	
	}
}
