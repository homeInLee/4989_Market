package com.kh.market.product.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int attachmentNo;
	private String boardName;
	private int boardNo;
	private String originalfileName;
	private String renamedfileName;
	private Date attachmentDate;
	private String attachmentDeltype;
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Attachment(int attachmentNo, String boardName, int boardNo, String originalfileName, String renamedfileName,
			Date attachmentDate, String attachmentDeltype) {
		super();
		this.attachmentNo = attachmentNo;
		this.boardName = boardName;
		this.boardNo = boardNo;
		this.originalfileName = originalfileName;
		this.renamedfileName = renamedfileName;
		this.attachmentDate = attachmentDate;
		this.attachmentDeltype = attachmentDeltype;
	}
	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", boardName=" + boardName + ", boardNo=" + boardNo
				+ ", originalfileName=" + originalfileName + ", renamedfileName=" + renamedfileName
				+ ", attachmentDate=" + attachmentDate + ", attachmentDeltype=" + attachmentDeltype + "]";
	}
	public int getAttachmentNo() {
		return attachmentNo;
	}
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
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
	public Date getAttachmentDate() {
		return attachmentDate;
	}
	public void setAttachmentDate(Date attachmentDate) {
		this.attachmentDate = attachmentDate;
	}
	public String getAttachmentDeltype() {
		return attachmentDeltype;
	}
	public void setAttachmentDeltype(String attachmentDeltype) {
		this.attachmentDeltype = attachmentDeltype;
	}
	
	

}
