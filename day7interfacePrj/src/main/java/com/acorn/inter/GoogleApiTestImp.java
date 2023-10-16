package com.acorn.inter;

import org.springframework.stereotype.Component;

@Component
public class GoogleApiTestImp implements GoogleApi {

	@Override
	public double[] 위도경도구하기() {		 
		return  new double[] { 37.4997187   ,127.0348982};
	}	
}
