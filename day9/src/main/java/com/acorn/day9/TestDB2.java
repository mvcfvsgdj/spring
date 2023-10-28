package com.acorn.day9;

import java.sql.*;

public class TestDB2 {
	   
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
	     
	         //
	         try {
	        	 //수동커밋
				conn.setAutoCommit(false);
				String sql1 = "insert into testdb values('a4', '0000')";
				PreparedStatement pst = conn.prepareStatement(sql1);
				int result = pst.executeUpdate();
				
				String sql2 = "insert into testdb values('a5', '0000')";
				PreparedStatement pst2 = conn.prepareStatement(sql2);
				int result2 = pst2.executeUpdate();
				
				//오토커밋
				conn.commit();
				
	         } catch (SQLException e) {
				// TODO Auto-generated catch block
	        	 try {
					conn.rollback();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
				e.printStackTrace();
			}
	         
	         
	   }

	}