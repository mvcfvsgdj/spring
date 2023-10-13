package com.acorn.batis;


import java.util.Date;
import java.util.Objects;

/*
 * create table membertb (
 *  id varchar2(10) primary key,
 *  pwd varchar2(10) ,
 *  name varchar2(10) 
 * );
 * 
 * 
 * 
 */

public class Member {
    private String id;
    private String pwd;
    private String name;
    public Member() {
		// TODO Auto-generated constructor stub
	}
    
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "Member  [id=" + id + ", pwd=" + pwd + ", name=" + name + "]";
	}
	public Member(String id, String pwd, String name) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
	}
     
    
     
}