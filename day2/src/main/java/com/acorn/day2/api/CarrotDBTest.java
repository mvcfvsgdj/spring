package com.acorn.day2.api;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class CarrotDBTest {

	public static void main(String[] args) throws SQLException, ClassNotFoundException {

		ApplicationContext ac = new GenericXmlApplicationContext(
				"file:src/main/webapp/WEB-INF/spring/**/root-context.xml");
		DataSource ds = ac.getBean(DataSource.class);

		Connection con = ds.getConnection();
		String sql = "select * from carrot";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();

		while (rs.next()) {
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			System.out.println(rs.getString(3));
			System.out.println(rs.getString(4));
		}

		rs.close();
		pst.close();
		con.close();
	}
	
}
