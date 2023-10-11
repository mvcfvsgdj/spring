package com.acorn.day2;

import java.util.ArrayList;

import org.springframework.stereotype.Component;

@Component
public class TestService {

	public  ArrayList<String> getDan(int dan){
		ArrayList<String> danList = new ArrayList<String>();
	
		for(int i=1 ; i<=9; i++) {
			danList.add(dan+"*"+i+"="+dan*i);
		}
		return danList;
	}
	
	public ArrayList<String> getMovieList(){
		ArrayList<String> movieList = new ArrayList<String>();
		movieList.add("타이타닉");
		movieList.add("타이탄");
		movieList.add("무에타이");
		
		return movieList;
	}
}
