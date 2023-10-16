package com.acorn.cart;

public class CartDTO {
	
	String cartNO;
	String memberId;
	String goodsNo;
	int cartQty;
	
	public String getCartNO() {
		return cartNO;
	}
	public void setCartNO(String cartNO) {
		this.cartNO = cartNO;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getGoodsNo() {
		return goodsNo;
	}
	public void setGoodsNo(String goodsNo) {
		this.goodsNo = goodsNo;
	}
	public int getCartQty() {
		return cartQty;
	}
	public void setCartQty(int cartQty) {
		this.cartQty = cartQty;
	}
	public CartDTO(String cartNO, String memberId, String goodsNo, int cartQty) {
		super();
		this.cartNO = cartNO;
		this.memberId = memberId;
		this.goodsNo = goodsNo;
		this.cartQty = cartQty;
	}
	
	public CartDTO() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "CartDTO [cartNO=" + cartNO + ", memberId=" + memberId + ", goodsNo=" + goodsNo + ", cartQty=" + cartQty
				+ "]";
	}
	
	

}
