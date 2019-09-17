package com.kh.market.notice.model.vo;

public class Notice {

	private int noticeNo;
	private String noticeTitle;
	private String noticeWriter;
	private String noticeContent;
	private String noticeDate;
	private int noticeReadCount;
	private String noticeDelDate;
	private String noticeDelType;
	private String noticeType;
	
	public Notice() {}

	public Notice(int noticeNo, String noticeTitle, String noticeWriter, String noticeContent, String noticeDate,
			int noticeReadCount, String noticeDelDate, String noticeDelType, String noticeType) {
		super();
		this.noticeNo = noticeNo;
		this.noticeTitle = noticeTitle;
		this.noticeWriter = noticeWriter;
		this.noticeContent = noticeContent;
		this.noticeDate = noticeDate;
		this.noticeReadCount = noticeReadCount;
		this.noticeDelDate = noticeDelDate;
		this.noticeDelType = noticeDelType;
		this.noticeType = noticeType;
	}

	public int getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
	}

	public String getNoticeTitle() {
		return noticeTitle;
	}

	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}

	public String getNoticeWriter() {
		return noticeWriter;
	}

	public void setNoticeWriter(String noticeWriter) {
		this.noticeWriter = noticeWriter;
	}

	public String getNoticeContent() {
		return noticeContent;
	}

	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}

	public String getNoticeDate() {
		return noticeDate;
	}

	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}

	public int getNoticeReadCount() {
		return noticeReadCount;
	}

	public void setNoticeReadCount(int noticeReadCount) {
		this.noticeReadCount = noticeReadCount;
	}

	public String getNoticeDelDate() {
		return noticeDelDate;
	}

	public void setNoticeDelDate(String noticeDelDate) {
		this.noticeDelDate = noticeDelDate;
	}

	public String getNoticeDelType() {
		return noticeDelType;
	}

	public void setNoticeDelType(String noticeDelType) {
		this.noticeDelType = noticeDelType;
	}

	public String getNoticeType() {
		return noticeType;
	}

	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}

	@Override
	public String toString() {
		return "Notice [noticeNo=" + noticeNo + ", noticeTitle=" + noticeTitle + ", noticeWriter=" + noticeWriter
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticeReadCount="
				+ noticeReadCount + ", noticeDelDate=" + noticeDelDate + ", noticeDelType=" + noticeDelType
				+ ", noticeType=" + noticeType + "]";
	}

	

	
	
}
