package com.acorn.cart;


public class GoodsDTO {
	
	String goodsNo;
	String name;
	int price;
	
	
	public GoodsDTO(String goodsNo, String name, int price) {
		super();
		this.goodsNo = goodsNo;
		this.name = name;
		this.price = price;
	}
	@Override
	public String toString() {
		return "GoodsDTO [goodsNo=" + goodsNo + ", name=" + name + ", price=" + price + "]";
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	
	 
	
	

}
