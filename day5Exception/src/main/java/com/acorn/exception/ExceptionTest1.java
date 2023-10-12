package com.acorn.exception;

public class ExceptionTest1 {

	//매서드
	
	public int add(int num1, int num2) throws Exception {
		if(num1 <0 || num2<0) {
			throw new Exception("0보다커야함");
			
		}
		
		return num1+num2;
	}
	
	
	public static void main(String[] args) {
		ExceptionTest1 ex =new ExceptionTest1();
		try {
			int result = ex.add(1, 3);
			System.out.println(result);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("음수발견");
			e.printStackTrace();
		}
		System.out.println("종료");
	}
}