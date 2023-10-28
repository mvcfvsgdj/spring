package com.acorn.day9;

import java.sql.*;

public class TestDB {
	   
	   public static void main(String[] args) {
	      
	      String driver = "oracle.jdbc.driver.OracleDriver" ;
	      String url="jdbc:oracle:thin:@localhost:1521:testdb";
	      String user="scott";
	      String password="tiger";
	      
	      Connection conn = null;
	      
	         try {
	            Class.forName(driver);
	            conn = DriverManager.getConnection(url,user,password);
	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	       catch (ClassNotFoundException e) {
	         // TODO Auto-generated catch block
	         e.printStackTrace();
	      }
	         try {
	            String sql1 = "insert into testdb values('a1', '0000')";
	            PreparedStatement pst = conn.prepareStatement(sql1);
	            int result = pst.executeUpdate();
	            
	            String sql2 = "insert into testdb values('a1', '1111')";
	            PreparedStatement pst2 =  conn.prepareStatement(sql2);
	            int result2 = pst2.executeUpdate();

	         } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	         }
	   }

	}