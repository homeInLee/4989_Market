package com.kh.market.basket.model.vo;

public class Basket {

	private int basketSellNo;
	private String basketMemberId;
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Basket(int basketSellNo, String basketMemberId) {
		super();
		this.basketSellNo = basketSellNo;
		this.basketMemberId = basketMemberId;
	}
	public int getBasketSellNo() {
		return basketSellNo;
	}
	public void setBasketSellNo(int basketSellNo) {
		this.basketSellNo = basketSellNo;
	}
	public String getBasketMemberId() {
		return basketMemberId;
	}
	public void setBasketMemberId(String basketMemberId) {
		this.basketMemberId = basketMemberId;
	}
	@Override
	public String toString() {
		return "Basket [basketSellNo=" + basketSellNo + ", basketMemberId=" + basketMemberId + "]";
	}
	
}
