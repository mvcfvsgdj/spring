package com.acorn.day2.db;

public class 랩퍼클래스테스트 {

	public static void main(String[] args) {
	int a =3 ;
	Integer i1 = a; //autoboxing 기본형 - > 객체형으로 자동으로 만들어줌
	Integer i2 = new Integer(a); 
	
	int result = i2.intValue();  //unboxing
	System.out.println(i1);
	System.out.println(result);
	Integer i3= 9;
	Integer i4 = 10;
	int result2 =i3+i4;
	System.out.println(result2);
	}

}
