package com.acorn.test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component; 

/*
 * 
 * 
 * 테이블생성및 데이터 insert
 * 
create table membertbl(
  id varchar2(10) primary key,
  pw varchar2(10) ,
  name varchar2(20) ,
  tel varchar2(20)
);

insert into  membertbl values( 'hong' , '0000', '홍길동' , '010-1111-3456');
insert into  membertbl values( 'kim' , '1234', '김길동' ,  '010-2222-7890');
insert into  membertbl values( 'lee' , '9999', '이길동' ,  '010-5555-1234');
insert into  membertbl values( 'choi' , '0987', '최길동' , '010-9999-0123');

commit;
 */
@Component
public class MemberDAO {	
	@Autowired
	DataSource ds;
		
	public ArrayList<Member> select() {	
		
		
		String sql ="select * from membertbl"; 
		ArrayList<Member> list = new ArrayList<>();
		try {
			Connection con  =ds.getConnection();
			PreparedStatement  pst  = con.prepareStatement(sql);
			
			ResultSet rs  = pst.executeQuery();
			while( rs.next()) {
				System.out.print( rs.getString(1));
				System.out.print( rs.getString(2));
				System.out.print( rs.getString(3));
				System.out.println( rs.getString(4));
				list.add( new  Member( rs.getString(1), rs.getString(2),rs.getString(3),rs.getString(4) ));
				
			}
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	public int insert( Member member) {
		int row=0;
		
		String sql="insert into membertbl values( ?,?,?,?)";
		
		try {
			Connection con  =ds.getConnection();
			PreparedStatement  pst  = con.prepareStatement(sql);
			
			pst.setString(1, member.getId());
			pst.setString(2, member.getPw());
			pst.setString(3, member.getName());
			pst.setString(4, member.getTel());
			row= pst.executeUpdate();
		 
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return row;
	}

	 
	public ArrayList<String> test() {			
		ArrayList<String> testList = new ArrayList<>();
		testList.add("테스트항목1");
		testList.add("테스트항목2");			
		// return null;   //  테스트시 실패
		return testList;  // 테스트시 성공
	}
	
}
