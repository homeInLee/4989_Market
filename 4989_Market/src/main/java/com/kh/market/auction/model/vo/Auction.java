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
	private String auctionAddress;

	public Auction() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Auction(int auctionNo, String auctionTitle, String auctionWriter, String auctionBuyer, int auctionPrice,
			int auctionDirectPrice, int auctionUnitPrice, String auctionContent, int auctionReadcount, Date auctionDate,
			Date auctionEndDate, String auctionType, String auctionCategory, Date auctionDeldate,
			String auctionDeltype, String auctionAddress) {
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
		this.auctionAddress = auctionAddress;
	}

	@Override
	public String toString() {
		return "Auction [auctionNo=" + auctionNo + ", auctionTitle=" + auctionTitle + ", auctionWriter=" + auctionWriter
				+ ", auctionBuyer=" + auctionBuyer + ", auctionPrice=" + auctionPrice + ", auctionDirectPrice="
				+ auctionDirectPrice + ", auctionUnitPrice=" + auctionUnitPrice + ", auctionContent=" + auctionContent
				+ ", auctionReadcount=" + auctionReadcount + ", auctionDate=" + auctionDate + ", auctionEndDate="
				+ auctionEndDate + ", auctionType=" + auctionType + ", auctionCategory=" + auctionCategory
				+ ", auctionDeldate=" + auctionDeldate + ", auctionDeltype=" + auctionDeltype + ", auctionAddress=" + auctionAddress + "]";
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
	
	public String getAuctionAddress() {
		return auctionAddress;
	}
	public void setAuctionAddress(String auctionAddress) {
		this.auctionAddress = auctionAddress;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((auctionAddress == null) ? 0 : auctionAddress.hashCode());
		result = prime * result + ((auctionBuyer == null) ? 0 : auctionBuyer.hashCode());
		result = prime * result + ((auctionCategory == null) ? 0 : auctionCategory.hashCode());
		result = prime * result + ((auctionContent == null) ? 0 : auctionContent.hashCode());
		result = prime * result + ((auctionDate == null) ? 0 : auctionDate.hashCode());
		result = prime * result + ((auctionDeldate == null) ? 0 : auctionDeldate.hashCode());
		result = prime * result + ((auctionDeltype == null) ? 0 : auctionDeltype.hashCode());
		result = prime * result + auctionDirectPrice;
		result = prime * result + ((auctionEndDate == null) ? 0 : auctionEndDate.hashCode());
		result = prime * result + auctionNo;
		result = prime * result + auctionPrice;
		result = prime * result + auctionReadcount;
		result = prime * result + ((auctionTitle == null) ? 0 : auctionTitle.hashCode());
		result = prime * result + ((auctionType == null) ? 0 : auctionType.hashCode());
		result = prime * result + auctionUnitPrice;
		result = prime * result + ((auctionWriter == null) ? 0 : auctionWriter.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Auction other = (Auction) obj;
		if (auctionAddress == null) {
			if (other.auctionAddress != null)
				return false;
		} else if (!auctionAddress.equals(other.auctionAddress))
			return false;
		if (auctionBuyer == null) {
			if (other.auctionBuyer != null)
				return false;
		} else if (!auctionBuyer.equals(other.auctionBuyer))
			return false;
		if (auctionCategory == null) {
			if (other.auctionCategory != null)
				return false;
		} else if (!auctionCategory.equals(other.auctionCategory))
			return false;
		if (auctionContent == null) {
			if (other.auctionContent != null)
				return false;
		} else if (!auctionContent.equals(other.auctionContent))
			return false;
		if (auctionDate == null) {
			if (other.auctionDate != null)
				return false;
		} else if (!auctionDate.equals(other.auctionDate))
			return false;
		if (auctionDeldate == null) {
			if (other.auctionDeldate != null)
				return false;
		} else if (!auctionDeldate.equals(other.auctionDeldate))
			return false;
		if (auctionDeltype == null) {
			if (other.auctionDeltype != null)
				return false;
		} else if (!auctionDeltype.equals(other.auctionDeltype))
			return false;
		if (auctionDirectPrice != other.auctionDirectPrice)
			return false;
		if (auctionEndDate == null) {
			if (other.auctionEndDate != null)
				return false;
		} else if (!auctionEndDate.equals(other.auctionEndDate))
			return false;
		if (auctionNo != other.auctionNo)
			return false;
		if (auctionPrice != other.auctionPrice)
			return false;
		if (auctionReadcount != other.auctionReadcount)
			return false;
		if (auctionTitle == null) {
			if (other.auctionTitle != null)
				return false;
		} else if (!auctionTitle.equals(other.auctionTitle))
			return false;
		if (auctionType == null) {
			if (other.auctionType != null)
				return false;
		} else if (!auctionType.equals(other.auctionType))
			return false;
		if (auctionUnitPrice != other.auctionUnitPrice)
			return false;
		if (auctionWriter == null) {
			if (other.auctionWriter != null)
				return false;
		} else if (!auctionWriter.equals(other.auctionWriter))
			return false;
		return true;
	}
	
}
	