package com.acorn.day1.di;

public class BCalculator implements Calculator {

	@Override
	public int daa(int num1, int num2) {
		System.out.println("Bㄲ계산기");
		return num1+num2;
	}

}
