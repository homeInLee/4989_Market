package com.kh.market.member.model.vo;

import java.util.Date;

public class Member {
	private String memberId;
	private String memberName;
	private String memberPassword;
	private String memberPhone;
	private String memberEmail;
	private String memberAddress;
	private Date memberEnrolldate;
	private Date memberDeldate;
	private String memberDeltype;
	private int memberNo;
	public Member() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Member(String memberId, String memberName, String memberPassword, String memberPhone, String memberEmail,
			String memberAddress, Date memberEnrolldate, Date memberDeldate, String memberDeltype, int memberNo) {
		super();
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPassword = memberPassword;
		this.memberPhone = memberPhone;
		this.memberEmail = memberEmail;
		this.memberAddress = memberAddress;
		this.memberEnrolldate = memberEnrolldate;
		this.memberDeldate = memberDeldate;
		this.memberDeltype = memberDeltype;
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPassword() {
		return memberPassword;
	}
	public void setMemberPassword(String memberPassword) {
		this.memberPassword = memberPassword;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public Date getMemberEnrolldate() {
		return memberEnrolldate;
	}
	public void setMemberEnrolldate(Date memberEnrolldate) {
		this.memberEnrolldate = memberEnrolldate;
	}
	public Date getMemberDeldate() {
		return memberDeldate;
	}
	public void setMemberDeldate(Date memberDeldate) {
		this.memberDeldate = memberDeldate;
	}
	public String getMemberDeltype() {
		return memberDeltype;
	}
	public void setMemberDeltype(String memberDeltype) {
		this.memberDeltype = memberDeltype;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberName=" + memberName + ", memberPassword=" + memberPassword
				+ ", memberPhone=" + memberPhone + ", memberEmail=" + memberEmail + ", memberAddress=" + memberAddress
				+ ", memberEnrolldate=" + memberEnrolldate + ", memberDeldate=" + memberDeldate + ", memberDeltype="
				+ memberDeltype + ", memberNo=" + memberNo + "]";
	}
	
	
	
}
