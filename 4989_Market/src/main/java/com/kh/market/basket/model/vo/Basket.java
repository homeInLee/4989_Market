package com.kh.market.basket.model.vo;

public class Basket {

	private int basketSellNo;
	private String basketMemberId;
	private String boardName;
	public Basket() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Basket(int basketSellNo, String basketMemberId, String boardName) {
		super();
		this.basketSellNo = basketSellNo;
		this.basketMemberId = basketMemberId;
		this.boardName = boardName;
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
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	@Override
	public String toString() {
		return "Basket [basketSellNo=" + basketSellNo + ", basketMemberId=" + basketMemberId + ", boardName="
				+ boardName + "]";
	}
	
	
}
