package com.acorn.batis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;
 

 

 
 
@Controller
public class MybatisController {
	
	@Autowired
	MemberDao dao;
	 
	
	@RequestMapping("/count")
	public void test( ) {		
		 	try {
		 		System.out.println(		dao.count());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	 
	
	@RequestMapping("/selectAll")
	public void test2( ) {		
		 	try {
		 		System.out.println(		dao.selectAll());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	 
	
	@RequestMapping("/insert")
	public void test3( ) {		
		 	try {
		 		Member m = new Member();
		 		
		 		m.setId("test01");
		 		m.setPwd("9999");
		 		m.setName("홍길동");
		 		dao.insert(m) ;
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	@RequestMapping("/delete")
	public void test4( ) {		
		 	try {
		 		System.out.println(	 dao.delete("test01"));
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	
	
	@RequestMapping("/deleteAll")
	public void test5( ) {		
		 	try {
		 		System.out.println(		dao.deleteAll());
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}
	 

}
