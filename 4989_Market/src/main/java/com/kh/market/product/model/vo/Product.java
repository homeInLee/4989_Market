package com.kh.market.product.model.vo;

import java.sql.Date;

public class Product {
	
//	SELL_NO	NUMBER
//	SELL_TITLE	VARCHAR2(100 BYTE)
//	SELL_WRITER	VARCHAR2(15 BYTE)
//	SELL_BUYER	VARCHAR2(15 BYTE)
//	SELL_CONTENT	VARCHAR2(1000 BYTE)
//	SELL_STATE	CHAR(10 BYTE)
//	SELL_PRICE	NUMBER
//	SELL_DATE	DATE
//	SELL_READCOUNT	NUMBER
//	SELL_DELDATE	DATE
//	SELL_DELTYPE	CHAR(1 BYTE)
	
	
	private int sellNo;
	private String sellTitle;
	private String sellWriter;
	private String sellBuyer;
	private String sellContent;
	private String sellState;
	private int sellPrice;
	private Date sellDate;
	private int sellReadCount;
	private Date sellDelDate;
	private String sellDelType;
	
	
	
	
	
	
	public int getSellNo() {
		return sellNo;
	}
	public void setSellNo(int sellNo) {
		this.sellNo = sellNo;
	}
	public String getSellTitle() {
		return sellTitle;
	}
	public void setSellTitle(String sellTitle) {
		this.sellTitle = sellTitle;
	}
	public String getSellWriter() {
		return sellWriter;
	}
	public void setSellWriter(String sellWriter) {
		this.sellWriter = sellWriter;
	}
	public String getSellBuyer() {
		return sellBuyer;
	}
	public void setSellBuyer(String sellBuyer) {
		this.sellBuyer = sellBuyer;
	}
	public String getSellContent() {
		return sellContent;
	}
	public void setSellContent(String sellContent) {
		this.sellContent = sellContent;
	}
	public String getSellState() {
		return sellState;
	}
	public void setSellState(String sellState) {
		this.sellState = sellState;
	}
	public int getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(int sellPrice) {
		this.sellPrice = sellPrice;
	}
	public Date getSellDate() {
		return sellDate;
	}
	public void setSellDate(Date sellDate) {
		this.sellDate = sellDate;
	}
	public int getSellReadCount() {
		return sellReadCount;
	}
	public void setSellReadCount(int sellReadCount) {
		this.sellReadCount = sellReadCount;
	}
	public Date getSellDelDate() {
		return sellDelDate;
	}
	public void setSellDelDate(Date sellDelDate) {
		this.sellDelDate = sellDelDate;
	}
	public String getSellDelType() {
		return sellDelType;
	}
	public void setSellDelType(String sellDelType) {
		this.sellDelType = sellDelType;
	}
	
	
	
	@Override
	public String toString() {
		return "Product [sellNo=" + sellNo + ", sellTitle=" + sellTitle + ", sellWriter=" + sellWriter + ", sellBuyer="
				+ sellBuyer + ", sellContent=" + sellContent + ", sellState=" + sellState + ", sellPrice=" + sellPrice
				+ ", sellDate=" + sellDate + ", sellReadCount=" + sellReadCount + ", sellDelDate=" + sellDelDate
				+ ", sellDelType=" + sellDelType + "]";
	}
	
	
	
	public Product(int sellNo, String sellTitle, String sellWriter, String sellBuyer, String sellContent,
			String sellState, int sellPrice, Date sellDate, int sellReadCount, Date sellDelDate, String sellDelType) {
		super();
		this.sellNo = sellNo;
		this.sellTitle = sellTitle;
		this.sellWriter = sellWriter;
		this.sellBuyer = sellBuyer;
		this.sellContent = sellContent;
		this.sellState = sellState;
		this.sellPrice = sellPrice;
		this.sellDate = sellDate;
		this.sellReadCount = sellReadCount;
		this.sellDelDate = sellDelDate;
		this.sellDelType = sellDelType;
	}
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	

	
	
	
}
