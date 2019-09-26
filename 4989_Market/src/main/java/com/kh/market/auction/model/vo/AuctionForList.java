package com.kh.market.auction.model.vo;

import java.sql.Date;

public class AuctionForList extends Auction {
	
	private String boardName;
	private int boardNo;
	private String originalfileName;
	private String renamedfileName;
	
	public AuctionForList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AuctionForList(int auctionNo, String auctionTitle, String auctionWriter, String auctionBuyer,
			int auctionPrice, int auctionDirectPrice, int auctionIngPrice, int auctionUnitPrice, String auctionContent,
			int auctionReadcount, Date auctionDate, Date auctionEndDate, String auctionType, String auctionCategory,
			Date auctionDeldate, String auctionDeltype, String auctionAddress, String boardName, int boardNo, String originalfileName, String renamedfileName) {
		super(auctionNo, auctionTitle, auctionWriter, auctionBuyer, auctionPrice, auctionDirectPrice, auctionIngPrice,
				auctionUnitPrice, auctionContent, auctionReadcount, auctionDate, auctionEndDate, auctionType, auctionCategory,
				auctionDeldate, auctionDeltype, auctionAddress);
				this.boardName = boardName;
				this.boardNo = boardNo;
				this.originalfileName = originalfileName;
				this.renamedfileName = renamedfileName;
	}
	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "AuctionForList [boardName=" + boardName + ", boardNo=" + boardNo + ", originalfileName="
				+ originalfileName + ", renamedfileName=" + renamedfileName + ", auctionNo=" + auctionNo
				+ ", auctionTitle=" + auctionTitle + ", auctionWriter=" + auctionWriter + ", auctionBuyer="
				+ auctionBuyer + ", auctionPrice=" + auctionPrice + ", auctionDirectPrice=" + auctionDirectPrice
				+ ", auctionIngPrice=" + auctionIngPrice + ", auctionUnitPrice=" + auctionUnitPrice
				+ ", auctionContent=" + auctionContent + ", auctionReadcount=" + auctionReadcount + ", auctionDate="
				+ auctionDate + ", auctionEndDate=" + auctionEndDate + ", auctionType=" + auctionType
				+ ", auctionCategory=" + auctionCategory + ", auctionDeldate=" + auctionDeldate + ", auctionDeltype="
				+ auctionDeltype + ", auctionAddress=" + auctionAddress + "]";
	}
	/**
	 * @return the boardName
	 */
	public String getBoardName() {
		return boardName;
	}
	/**
	 * @param boardName the boardName to set
	 */
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	/**
	 * @return the boardNo
	 */
	public int getBoardNo() {
		return boardNo;
	}
	/**
	 * @param boardNo the boardNo to set
	 */
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	/**
	 * @return the originalfileName
	 */
	public String getOriginalfileName() {
		return originalfileName;
	}
	/**
	 * @param originalfileName the originalfileName to set
	 */
	public void setOriginalfileName(String originalfileName) {
		this.originalfileName = originalfileName;
	}
	/**
	 * @return the renamedfileName
	 */
	public String getRenamedfileName() {
		return renamedfileName;
	}
	/**
	 * @param renamedfileName the renamedfileName to set
	 */
	public void setRenamedfileName(String renamedfileName) {
		this.renamedfileName = renamedfileName;
	}
	
	
	

}
