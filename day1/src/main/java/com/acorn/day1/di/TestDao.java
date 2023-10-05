package com.acorn.day1.di;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class TestDao {
	
	public ArrayList<String> selectAll() {

		ArrayList<String> list = new ArrayList<>();
		list.add("1");
		list.add("2");
		list.add("3");

		return list;
	}
}
