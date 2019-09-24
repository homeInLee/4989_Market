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
	
	
	@Override
	public String toString() {
		return "AuctionForList [boardName=" + boardName + ", boardNo=" + boardNo + ", originalfileName="
				+ originalfileName + ", renamedfileName=" + renamedfileName + ", toString()=" + super.toString() + "]";
	}
	public String getBoardName() {
		return boardName;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getOriginalfileName() {
		return originalfileName;
	}
	public void setOriginalfileName(String originalfileName) {
		this.originalfileName = originalfileName;
	}
	public String getRenamedfileName() {
		return renamedfileName;
	}
	public void setRenamedfileName(String renamedfileName) {
		this.renamedfileName = renamedfileName;
	}
	
	

}
