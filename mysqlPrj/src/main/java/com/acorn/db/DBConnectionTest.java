package com.acorn.db;

 

import java.sql.*;

public class DBConnectionTest {
    public static void main(String[] args) throws Exception {
        // 스키마의 이름(testdb) : 데이터베이스 이름
        String DB_URL = "jdbc:mysql://localhost:3306/sh_db?useUnicode=true&characterEncoding=utf8";
        // DB의 userid와 pwd를 알맞게 변경해야 함
        String DB_USER = "root";
        String DB_PASSWORD = "tiger";

        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD); // 데이터베이스의 연결을 얻는다.
        Statement stmt  = conn.createStatement(); // Statement를 생성한다.

        String query = "SELECT now()"; //  
        ResultSet rs = stmt.executeQuery(query); // query를 실행한 결과를 rs에 담는다.

        // 실행결과가 담긴 rs에서 한 줄씩 읽어서 출력
        while (rs.next()) {
            String curDate = rs.getString(1);   
            System.out.println(curDate);       
        }
    } // main()
}

 