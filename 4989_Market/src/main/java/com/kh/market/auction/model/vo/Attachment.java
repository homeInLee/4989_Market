package com.kh.market.auction.model.vo;

import java.sql.Date;

public class Attachment {
	
	private int attachmentNo;
	private String boardName;
	private int boardNo;
	private String originalfileName;
	private String renamedfileName;
	private Date attachmentDate;
	private String attachmentDeltype;
	private String attachmentMainImage;
	
	public Attachment() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Attachment(int attachmentNo, String boardName, int boardNo, String originalfileName, String renamedfileName,
			Date attachmentDate, String attachmentDeltype, String attachmentMainImage) {
		super();
		this.attachmentNo = attachmentNo;
		this.boardName = boardName;
		this.boardNo = boardNo;
		this.originalfileName = originalfileName;
		this.renamedfileName = renamedfileName;
		this.attachmentDate = attachmentDate;
		this.attachmentDeltype = attachmentDeltype;
		this.attachmentMainImage = attachmentMainImage;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 */
	@Override
	public String toString() {
		return "Attachment [attachmentNo=" + attachmentNo + ", boardName=" + boardName + ", boardNo=" + boardNo
				+ ", originalfileName=" + originalfileName + ", renamedfileName=" + renamedfileName
				+ ", attachmentDate=" + attachmentDate + ", attachmentDeltype=" + attachmentDeltype
				+ ", attachmentMainImage=" + attachmentMainImage + "]";
	}

	/**
	 * @return the attachmentNo
	 */
	public int getAttachmentNo() {
		return attachmentNo;
	}

	/**
	 * @param attachmentNo the attachmentNo to set
	 */
	public void setAttachmentNo(int attachmentNo) {
		this.attachmentNo = attachmentNo;
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

	/**
	 * @return the attachmentDate
	 */
	public Date getAttachmentDate() {
		return attachmentDate;
	}

	/**
	 * @param attachmentDate the attachmentDate to set
	 */
	public void setAttachmentDate(Date attachmentDate) {
		this.attachmentDate = attachmentDate;
	}

	/**
	 * @return the attachmentDeltype
	 */
	public String getAttachmentDeltype() {
		return attachmentDeltype;
	}

	/**
	 * @param attachmentDeltype the attachmentDeltype to set
	 */
	public void setAttachmentDeltype(String attachmentDeltype) {
		this.attachmentDeltype = attachmentDeltype;
	}

	/**
	 * @return the attachmentMainImage
	 */
	public String getAttachmentMainImage() {
		return attachmentMainImage;
	}

	/**
	 * @param attachmentMainImage the attachmentMainImage to set
	 */
	public void setAttachmentMainImage(String attachmentMainImage) {
		this.attachmentMainImage = attachmentMainImage;
	}
	
	

}
