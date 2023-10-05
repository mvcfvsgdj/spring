package com.acorn.day1.di;



public class Program {
	
	//의존성 dependency
	
	Calculator calculator;
	
	public Program() {
	
		
	}
	//생성자 주입 injection
	public Program(Calculator calculator) {
		
		super();
		this.calculator = calculator;
	}
	//getter 주입
	public Calculator getCalculator() {
		
		return calculator;
	}
	//setter 주입
	public void setCalculator(Calculator calculator) {
		
		System.out.println("setter");
		
		this.calculator = calculator;
	}
	public int addP(int num1, int num2) {
		
		int result;
		result=calculator.daa(num1, num2);
		return result;
		
	}
	@Override
	public String toString() {
		
		return "Program [calculator=" + calculator + "]";
	}
	

		
	
		
	
}
