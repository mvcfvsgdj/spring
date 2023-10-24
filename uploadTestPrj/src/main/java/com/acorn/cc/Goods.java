package com.acorn.cc;

public class Goods {

	String  goodsCode ;
	String  goodsTitle;
	String  goodsPrice;
	public String getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(String goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getGoodsTitle() {
		return goodsTitle;
	}
	public void setGoodsTitle(String goodsTitle) {
		this.goodsTitle = goodsTitle;
	}
	public String getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(String goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	@Override
	public String toString() {
		return "Goods [goodsCode=" + goodsCode + ", goodsTitle=" + goodsTitle + ", goodsPrice=" + goodsPrice + "]";
	} 
	
	
	
	
	
}
