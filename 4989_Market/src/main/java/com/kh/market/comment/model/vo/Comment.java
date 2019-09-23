package com.kh.market.comment.model.vo;

import java.util.Date;

public class Comment {
	

	private int commentNo;
	private int commentLevel;
	private String commentWriter;
	private String commentContent;
	private int commentREF;
	private Date commentDate;
	private Date commentDeldate;
	private String commentDeltype;
	
	public Comment() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Comment(int commentNo, int commentLevel, String commentWriter, String commentContent, int commentREF,
			Date commentDate, Date commentDeldate, String commentDeltype) {
		super();
		this.commentNo = commentNo;
		this.commentLevel = commentLevel;
		this.commentWriter = commentWriter;
		this.commentContent = commentContent;
		this.commentREF = commentREF;
		this.commentDate = commentDate;
		this.commentDeldate = commentDeldate;
		this.commentDeltype = commentDeltype;
	}

	public int getCommentNo() {
		return commentNo;
	}

	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}

	public int getCommentLevel() {
		return commentLevel;
	}

	public void setCommentLevel(int commentLevel) {
		this.commentLevel = commentLevel;
	}

	public String getCommentWriter() {
		return commentWriter;
	}

	public void setCommentWriter(String commentWriter) {
		this.commentWriter = commentWriter;
	}

	public String getCommentContent() {
		return commentContent;
	}

	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}

	public int getCommentREF() {
		return commentREF;
	}

	public void setCommentREF(int commentREF) {
		this.commentREF = commentREF;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public Date getCommentDeldate() {
		return commentDeldate;
	}

	public void setCommentDeldate(Date commentDeldate) {
		this.commentDeldate = commentDeldate;
	}

	public String getCommentDeltype() {
		return commentDeltype;
	}

	public void setCommentDeltype(String commentDeltype) {
		this.commentDeltype = commentDeltype;
	}

	@Override
	public String toString() {
		return "Comment [commentNo=" + commentNo + ", commentLevel=" + commentLevel + ", commentWriter=" + commentWriter
				+ ", commentContent=" + commentContent + ", commentREF=" + commentREF + ", commentDate=" + commentDate
				+ ", commentDeldate=" + commentDeldate + ", commentDeltype=" + commentDeltype + "]";
	}
	

}
