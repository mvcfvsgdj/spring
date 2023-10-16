package com.acorn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyRepository {

	public void insertMember(String id,String name, String latitude, String longitube ) {
		
		
		System.out.println("회원테이블에등록");
		System.out.println(id+name+latitude+" "+longitube);
	}
}
