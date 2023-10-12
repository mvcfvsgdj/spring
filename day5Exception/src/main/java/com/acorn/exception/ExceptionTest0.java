package com.acorn.exception;

public class ExceptionTest0 {

	public static void main(String[] args) {
		ExceptionTest0 ex = new ExceptionTest0();
		try {
			ex.method();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("나머지처리");
		}
		System.out.println("정상 종료");
	
	}
	
	public void method() throws Exception{
		
		//조건일때
		try {
			throw new Exception(); //예외발생코드
		}catch(Exception ex) {
			System.out.println("예외상황 인식하고 적절한 코드");
			throw ex;
		}
	}
}
