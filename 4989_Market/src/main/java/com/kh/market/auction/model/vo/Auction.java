package com.kh.market.auction.model.vo;

import java.sql.Date;

public class Auction {

	private int auctionNo;
	private String auctionTitle;
	private String auctionWriter;
	private String auctionBuyer;
	private int auctionPrice;
	private int auctionDirectPrice;
	private String auctionContent;
	private int auctionReadCount;
	private Date auctionDate;
	private String auctionType;
	private Date auctionDelDate;
	private String auctionDelType;

	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auction(int auctionNo, String auctionTitle, String auctionWriter, String auctionBuyer, int auctionPrice,
			int auctionDirectPrice, String auctionContent, int auctionReadCount, Date auctionDate, String auctionType,
			Date auctionDelDate, String auctionDelType) {
		super();
		this.auctionNo = auctionNo;
		this.auctionTitle = auctionTitle;
		this.auctionWriter = auctionWriter;
		this.auctionBuyer = auctionBuyer;
		this.auctionPrice = auctionPrice;
		this.auctionDirectPrice = auctionDirectPrice;
		this.auctionContent = auctionContent;
		this.auctionReadCount = auctionReadCount;
		this.auctionDate = auctionDate;
		this.auctionType = auctionType;
		this.auctionDelDate = auctionDelDate;
		this.auctionDelType = auctionDelType;
	}

	@Override
	public String toString() {
		return "Auction [auctionNo=" + auctionNo + ", auctionTitle=" + auctionTitle + ", auctionWriter=" + auctionWriter
				+ ", auctionBuyer=" + auctionBuyer + ", auctionPrice=" + auctionPrice + ", auctionDirectPrice="
				+ auctionDirectPrice + ", auctionContent=" + auctionContent + ", auctionReadCount=" + auctionReadCount
				+ ", auctionDate=" + auctionDate + ", auctionType=" + auctionType + ", auctionDelDate=" + auctionDelDate
				+ ", auctionDelType=" + auctionDelType + "]";
	}

	public int getAuctionNo() {
		return auctionNo;
	}

	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}

	public String getAuctionTitle() {
		return auctionTitle;
	}

	public void setAuctionTitle(String auctionTitle) {
		this.auctionTitle = auctionTitle;
	}

	public String getAuctionWriter() {
		return auctionWriter;
	}

	public void setAuctionWriter(String auctionWriter) {
		this.auctionWriter = auctionWriter;
	}

	public String getAuctionBuyer() {
		return auctionBuyer;
	}

	public void setAuctionBuyer(String auctionBuyer) {
		this.auctionBuyer = auctionBuyer;
	}

	public int getAuctionPrice() {
		return auctionPrice;
	}

	public void setAuctionPrice(int auctionPrice) {
		this.auctionPrice = auctionPrice;
	}

	public int getAuctionDirectPrice() {
		return auctionDirectPrice;
	}

	public void setAuctionDirectPrice(int auctionDirectPrice) {
		this.auctionDirectPrice = auctionDirectPrice;
	}

	public String getAuctionContent() {
		return auctionContent;
	}

	public void setAuctionContent(String auctionContent) {
		this.auctionContent = auctionContent;
	}

	public int getAuctionReadCount() {
		return auctionReadCount;
	}

	public void setAuctionReadCount(int auctionReadCount) {
		this.auctionReadCount = auctionReadCount;
	}

	public Date getAuctionDate() {
		return auctionDate;
	}

	public void setAuctionDate(Date auctionDate) {
		this.auctionDate = auctionDate;
	}

	public String getAuctionType() {
		return auctionType;
	}

	public void setAuctionType(String auctionType) {
		this.auctionType = auctionType;
	}

	public Date getAuctionDelDate() {
		return auctionDelDate;
	}

	public void setAuctionDelDate(Date auctionDelDate) {
		this.auctionDelDate = auctionDelDate;
	}

	public String getAuctionDelType() {
		return auctionDelType;
	}

	public void setAuctionDelType(String auctionDelType) {
		this.auctionDelType = auctionDelType;
	}
	
	


}
