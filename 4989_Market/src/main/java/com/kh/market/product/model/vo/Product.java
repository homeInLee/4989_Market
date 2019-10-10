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
	private String sellAddress;
	private String sellCategory;
	
	
	
	
	
	
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
	public String getSellAddress() {
		return sellAddress;
	}
	public void setSellAddress(String sellAddress) {
		this.sellAddress = sellAddress;
	}
	public String getSellCategory() {
		return sellCategory;
	}
	public void setSellCategory(String sellCategory) {
		this.sellCategory = sellCategory;
	}
	
	
	@Override
	public String toString() {
		return "Product [sellNo=" + sellNo + ", sellTitle=" + sellTitle + ", sellWriter=" + sellWriter + ", sellBuyer="
				+ sellBuyer + ", sellContent=" + sellContent + ", sellState=" + sellState + ", sellPrice=" + sellPrice
				+ ", sellDate=" + sellDate + ", sellReadCount=" + sellReadCount + ", sellDelDate=" + sellDelDate
				+ ", sellDelType=" + sellDelType + ", sellAddress=" + sellAddress +  ", sellCategory=" + sellCategory + "]";
	}
	
	
	
	public Product(int sellNo, String sellTitle, String sellWriter, String sellBuyer, String sellContent,
			String sellState, int sellPrice, Date sellDate, int sellReadCount, Date sellDelDate, String sellDelType, String sellAddress, String sellCategory) {
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
		this.sellAddress = sellAddress;
		this.sellCategory = sellCategory;
	}
	
	
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((sellAddress == null) ? 0 : sellAddress.hashCode());
		result = prime * result + ((sellBuyer == null) ? 0 : sellBuyer.hashCode());
		result = prime * result + ((sellCategory == null) ? 0 : sellCategory.hashCode());
		result = prime * result + ((sellContent == null) ? 0 : sellContent.hashCode());
		result = prime * result + ((sellDate == null) ? 0 : sellDate.hashCode());
		result = prime * result + ((sellDelDate == null) ? 0 : sellDelDate.hashCode());
		result = prime * result + ((sellDelType == null) ? 0 : sellDelType.hashCode());
		result = prime * result + sellNo;
		result = prime * result + sellPrice;
		result = prime * result + sellReadCount;
		result = prime * result + ((sellState == null) ? 0 : sellState.hashCode());
		result = prime * result + ((sellTitle == null) ? 0 : sellTitle.hashCode());
		result = prime * result + ((sellWriter == null) ? 0 : sellWriter.hashCode());
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
		Product other = (Product) obj;
		if (sellAddress == null) {
			if (other.sellAddress != null)
				return false;
		} else if (!sellAddress.equals(other.sellAddress))
			return false;
		if (sellBuyer == null) {
			if (other.sellBuyer != null)
				return false;
		} else if (!sellBuyer.equals(other.sellBuyer))
			return false;
		if (sellCategory == null) {
			if (other.sellCategory != null)
				return false;
		} else if (!sellCategory.equals(other.sellCategory))
			return false;
		if (sellContent == null) {
			if (other.sellContent != null)
				return false;
		} else if (!sellContent.equals(other.sellContent))
			return false;
		if (sellDate == null) {
			if (other.sellDate != null)
				return false;
		} else if (!sellDate.equals(other.sellDate))
			return false;
		if (sellDelDate == null) {
			if (other.sellDelDate != null)
				return false;
		} else if (!sellDelDate.equals(other.sellDelDate))
			return false;
		if (sellDelType == null) {
			if (other.sellDelType != null)
				return false;
		} else if (!sellDelType.equals(other.sellDelType))
			return false;
		if (sellNo != other.sellNo)
			return false;
		if (sellPrice != other.sellPrice)
			return false;
		if (sellReadCount != other.sellReadCount)
			return false;
		if (sellState == null) {
			if (other.sellState != null)
				return false;
		} else if (!sellState.equals(other.sellState))
			return false;
		if (sellTitle == null) {
			if (other.sellTitle != null)
				return false;
		} else if (!sellTitle.equals(other.sellTitle))
			return false;
		if (sellWriter == null) {
			if (other.sellWriter != null)
				return false;
		} else if (!sellWriter.equals(other.sellWriter))
			return false;
		return true;
	}
	
	
	
	
	

	
	
	
}
