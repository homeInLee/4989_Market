package com.kh.market.product.model.vo;

public class Page {
	private int startCount;
	private int endCount;
	
	
	
	
	
	public Page() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public Page(int startCount, int endCount) {
		super();
		this.startCount = startCount;
		this.endCount = endCount;
	}
	
	
	@Override
	public String toString() {
		return "Page [startCount=" + startCount + ", endCount=" + endCount + "]";
	}
	
	
	public int getStartCount() {
		return startCount;
	}
	public void setStartCount(int startCount) {
		this.startCount = startCount;
	}
	public int getEndCount() {
		return endCount;
	}
	public void setEndCount(int endCount) {
		this.endCount = endCount;
	}
	
	
	
}
