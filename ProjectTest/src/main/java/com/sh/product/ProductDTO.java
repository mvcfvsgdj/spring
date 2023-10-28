package com.sh.product;

import lombok.Data;

@Data
public class ProductDTO {

	/*
	 * 
	 * ------------- -------- ------------- BOARD_ID NOT NULL VARCHAR2(50)
	 * BOARD_DATE NOT NULL VARCHAR2(40) BOARD_TITLE NOT NULL VARCHAR2(200)
	 * BOARD_PRICE NOT NULL NUMBER(10) BOARD_TEXT NOT NULL VARCHAR2(500) BOARD_IMG
	 * NOT NULL VARCHAR2(500) BOARD_LIKES NOT NULL NUMBER(10) BOARD_SOLDOUT NOT NULL
	 * NUMBER(10) BOARD_CLICK
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
	private String board_Category;
	
	//카테고리
	private String loc_code;
	private String detail_loc;
	//유저정보
	private String user_code;
	private String user_nickname;
	// getters and setters
}