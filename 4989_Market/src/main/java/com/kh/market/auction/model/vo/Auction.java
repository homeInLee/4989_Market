package com.kh.market.auction.model.vo;

import java.sql.Date;

public class Auction {

	private int auctionNo;
	private String auctionTitle;
	private String auctionWriter;
	private String auctionBuyer;
	private int auctionPrice;
	private int auctionDirectPrice;
	private int auctionUnitPrice;
	private String auctionContent;
	private int auctionReadcount;
	private Date auctionDate;
	private Date auctionEndDate;
	private String auctionType;
	private String auctionCategory;
	private Date auctionDeldate;
	private String auctionDeltype;

	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auction(int auctionNo, String auctionTitle, String auctionWriter, String auctionBuyer, int auctionPrice,
			int auctionDirectPrice, int auctionUnitPrice, String auctionContent, int auctionReadcount, Date auctionDate,
			Date auctionEndDate, String auctionType, String auctionCategory, Date auctionDeldate,
			String auctionDeltype) {
		super();
		this.auctionNo = auctionNo;
		this.auctionTitle = auctionTitle;
		this.auctionWriter = auctionWriter;
		this.auctionBuyer = auctionBuyer;
		this.auctionPrice = auctionPrice;
		this.auctionDirectPrice = auctionDirectPrice;
		this.auctionUnitPrice = auctionUnitPrice;
		this.auctionContent = auctionContent;
		this.auctionReadcount = auctionReadcount;
		this.auctionDate = auctionDate;
		this.auctionEndDate = auctionEndDate;
		this.auctionType = auctionType;
		this.auctionCategory = auctionCategory;
		this.auctionDeldate = auctionDeldate;
		this.auctionDeltype = auctionDeltype;
	}

	@Override
	public String toString() {
		return "Auction [auctionNo=" + auctionNo + ", auctionTitle=" + auctionTitle + ", auctionWriter=" + auctionWriter
				+ ", auctionBuyer=" + auctionBuyer + ", auctionPrice=" + auctionPrice + ", auctionDirectPrice="
				+ auctionDirectPrice + ", auctionUnitPrice=" + auctionUnitPrice + ", auctionContent=" + auctionContent
				+ ", auctionReadcount=" + auctionReadcount + ", auctionDate=" + auctionDate + ", auctionEndDate="
				+ auctionEndDate + ", auctionType=" + auctionType + ", auctionCategory=" + auctionCategory
				+ ", auctionDeldate=" + auctionDeldate + ", auctionDeltype=" + auctionDeltype + "]";
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

	public int getAuctionUnitPrice() {
		return auctionUnitPrice;
	}

	public void setAuctionUnitPrice(int auctionUnitPrice) {
		this.auctionUnitPrice = auctionUnitPrice;
	}

	public String getAuctionContent() {
		return auctionContent;
	}

	public void setAuctionContent(String auctionContent) {
		this.auctionContent = auctionContent;
	}

	public int getAuctionReadcount() {
		return auctionReadcount;
	}

	public void setAuctionReadcount(int auctionReadcount) {
		this.auctionReadcount = auctionReadcount;
	}

	public Date getAuctionDate() {
		return auctionDate;
	}

	public void setAuctionDate(Date auctionDate) {
		this.auctionDate = auctionDate;
	}

	public Date getAuctionEndDate() {
		return auctionEndDate;
	}

	public void setAuctionEndDate(Date auctionEndDate) {
		this.auctionEndDate = auctionEndDate;
	}

	public String getAuctionType() {
		return auctionType;
	}

	public void setAuctionType(String auctionType) {
		this.auctionType = auctionType;
	}

	public String getAuctionCategory() {
		return auctionCategory;
	}

	public void setAuctionCategory(String auctionCategory) {
		this.auctionCategory = auctionCategory;
	}

	public Date getAuctionDeldate() {
		return auctionDeldate;
	}

	public void setAuctionDeldate(Date auctionDeldate) {
		this.auctionDeldate = auctionDeldate;
	}

	public String getAuctionDeltype() {
		return auctionDeltype;
	}

	public void setAuctionDeltype(String auctionDeltype) {
		this.auctionDeltype = auctionDeltype;
	}
	
	
	
}
	