package com.acorn.day2.db;

import java.sql.*;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TestDAO {

	//객체주입 - root에 생성
	
	@Autowired
	DataSource ds; 
	
	public void select() {		
		String sql="select * from member_tbl_11";
		try {
			Connection con = ds.getConnection();
			PreparedStatement  pst =con.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next()) {
				System.out.println(rs.getString(1));
				System.out.println(rs.getString(2));
				System.out.println(rs.getString(3));
				System.out.println(rs.getString(4));
			} 			
			//
			rs.close();
			pst.close();
			con.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	}
}
