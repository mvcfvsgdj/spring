package com.acorn.web;

public class Book {
	String name;
	String num;
	public Book(String name, String num) {
		super();
		this.name = name;
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "Book [name=" + name + ", num=" + num + "]";
	}public Book() {
		// TODO Auto-generated constructor stub
	}
}
