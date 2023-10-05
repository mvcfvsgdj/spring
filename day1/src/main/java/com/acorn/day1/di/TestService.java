package com.acorn.day1.di;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class TestService {

	@Autowired
	TestDao dao;

	public ArrayList<String> getList() {
		ArrayList<String> list = dao.selectAll();
		return list;
		
	}
}
