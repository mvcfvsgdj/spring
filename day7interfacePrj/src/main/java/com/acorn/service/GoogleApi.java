package com.acorn.service;

import org.springframework.stereotype.Component;

@Component
public class GoogleApi {	
	
	public double[] 위도경도구하기() {		
		double[]  result = { 37.4997187   ,127.0348982};		
		return result;
	}
}