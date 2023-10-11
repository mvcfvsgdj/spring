package com.acorn.day2.db;

import java.sql.*;

public class DBTest1 {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {

		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:testdb";
		String user
		= "scott";
		String password = "tiger";

		Class.forName(driver);
		Connection con = DriverManager.getConnection(url, user, password);
		if (con != null)
			System.out.println("ok");

		String sql = "select * from member_tbl_11";
		PreparedStatement pst = con.prepareStatement(sql);
		ResultSet rs = pst.executeQuery();
		while (rs.next()) {
			System.out.println(rs.getString(1));
			System.out.println(rs.getString(2));
			System.out.println(rs.getString(3));
			System.out.println(rs.getString(4));
		}

	}

}
