package db.test.sample;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

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
		Connection con = ds.getConnection();
		assertTrue(con!=null);
	}
	//등록
	public void test3() throws SQLException {
		
	    int result = dao.insert(new Member("id1", "pwd2", "test3", "d@naver.com4", "1999-12-10", "sns6" , new Date()));
		
	
		assertTrue(result==1);

	
	}
	//변경
	public void test4() throws SQLException {
	    // 업데이트할 회원의 정보를 포함한 Member 객체 생성
	    Member memberToUpdate = new Member("id1","newPwd", "newName", "newEmail", "2002-12-04", "newSns", new Date());

	    // updateUser 메서드 호출
	    int result = dao.updateUser(memberToUpdate);

	    // 결과 확인
	    assertTrue(result == 1);
	}
	
	//삭제
	public void test5() throws SQLException {
		String id = "id1";
		
		int member = dao.deleteOne(id);
		
		assertTrue(member==0);
	}

	//조회
	public void test2() throws SQLException {
		
		String id = "example1";
		
		Member member = dao.findOne(id);
		
		assertEquals("example1", member.getId());

	
	}

}
