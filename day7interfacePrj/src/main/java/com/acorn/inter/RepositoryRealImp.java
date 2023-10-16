package com.acorn.inter;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


 


public class RepositoryRealImp  implements MemberRepositoryI {

	
	@Autowired
	DataSource ds;

	@Override
	public int insert(Member member) {
		//sql작성  데이터베이스에 insert 하기
				int resultRow=0;
				try {
					String sql="insert into  membertbtest2  values(  ?,?,?,?) ";
					Connection con  = ds.getConnection();
				    PreparedStatement pst  =   con.prepareStatement(sql)	;
				    pst.setString(1, member.getId());
				    pst.setString(2, member.getName());
				    pst.setDouble(3,  member.getLatitude());
				    pst.setDouble(4,   member.getLongitude());
				    resultRow  = pst.executeUpdate();
				    close(pst, con);
				    return resultRow;			
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	return  resultRow;
	}

	@Override
	public List<Member> selectAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int update(Member member) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	private void close( AutoCloseable ...autoCloseables ) {
		for( AutoCloseable obj : autoCloseables) {
			try {
				obj.close();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
 
	

}
