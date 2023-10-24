package com.test.product;

import lombok.Data;

@Data
public class Product {
	
	
	/*
	 * 
	 * ------------- -------- ------------- 
	BOARD_ID      NOT NULL VARCHAR2(50)  
	BOARD_DATE    NOT NULL VARCHAR2(40)  
	BOARD_TITLE   NOT NULL VARCHAR2(200) 
	BOARD_PRICE   NOT NULL NUMBER(10)    
	BOARD_TEXT    NOT NULL VARCHAR2(500) 
	BOARD_IMG     NOT NULL VARCHAR2(500) 
	BOARD_LIKES   NOT NULL NUMBER(10)    
	BOARD_SOLDOUT NOT NULL NUMBER(10)    
	BOARD_CLICK
		 * 
	 * 
	 * 
	 */
	 private String board_Id;
	    private String board_Date;
	    private String board_Title;
	    private int board_Price;
	    private String board_Text;
	    private String board_Img;
	    private int board_Likes = 0;
	    private int board_Soldout = 0;
	    private int board_Click = 0;

    // getters and setters
}