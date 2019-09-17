package com.kh.market.review.model.vo;

import java.util.Arrays;

public class Review {

	private int reviewNo;
	private String reviewWriter;
	private String reviewReceiver;
	private String[] reviewPoint;
	private String reviewContent;
	public Review() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Review(int reviewNo, String reviewWriter, String reviewReceiver, String[] reviewPoint,
			String reviewContent) {
		super();
		this.reviewNo = reviewNo;
		this.reviewWriter = reviewWriter;
		this.reviewReceiver = reviewReceiver;
		this.reviewPoint = reviewPoint;
		this.reviewContent = reviewContent;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getReviewWriter() {
		return reviewWriter;
	}
	public void setReviewWriter(String reviewWriter) {
		this.reviewWriter = reviewWriter;
	}
	public String getReviewReceiver() {
		return reviewReceiver;
	}
	public void setReviewReceiver(String reviewReceiver) {
		this.reviewReceiver = reviewReceiver;
	}
	public String[] getReviewPoint() {
		return reviewPoint;
	}
	public void setReviewPoint(String[] reviewPoint) {
		this.reviewPoint = reviewPoint;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	@Override
	public String toString() {
		return "Review [reviewNo=" + reviewNo + ", reviewWriter=" + reviewWriter + ", reviewReceiver=" + reviewReceiver
				+ ", reviewPoint=" + Arrays.toString(reviewPoint) + ", reviewContent=" + reviewContent + "]";
	}
	
}
