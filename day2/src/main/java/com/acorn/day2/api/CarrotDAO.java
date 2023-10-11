package com.acorn.day2.api;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class CarrotDAO {
	@Autowired
	DataSource ds;

	public ArrayList<CarrotDTO> selectAll() throws SQLException {
		Connection con = null;
		PreparedStatement pst = null;
		ResultSet rs = null;

		String sql = "select * from carrot";

		ArrayList<CarrotDTO> carrotList = new ArrayList<>();
		try {
			con = ds.getConnection();
			pst = con.prepareStatement(sql);
			rs = pst.executeQuery();

			while (rs.next()) {
				String id = rs.getString(1);
				int price = rs.getInt(2);
				String info = rs.getString(3);
				Date newTime = rs.getDate(4);

				CarrotDTO cd = new CarrotDTO(id, price, info, newTime);
				carrotList.add(cd);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		rs.close();
		pst.close();
		con.close();
		return carrotList;

	}

	public void deleteCarrot(String id) throws SQLException {

		Connection con = ds.getConnection();

		String sql = "delete from carrot where id=?";
		PreparedStatement pst = null;

		try {
			pst = con.prepareStatement(sql);
			pst.setString(1, id);
			pst.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		}
		pst.close();
		con.close();

	}
	
	
	
	
	public boolean RegisterCarrot(String id,int price,String info,Date newTime) throws SQLException {
		Connection con = ds.getConnection();
		PreparedStatement pst = null;

		try {
			// 데이터베이스 연결

			String sql = "insert into carrot(id,price,info,newTime) values(?,?,?,?)";
			pst = con.prepareStatement(sql);
			pst.setString(1,id);
			pst.setInt(2, price);
			pst.setString(3,info);
			pst.setDate(4, newTime);
			

			int result = pst.executeUpdate();

			if (result > 0) {
				//등록성공
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
	
		}
		pst.close();
		con.close();
		// 등록 실패
		return false;
	}

}
