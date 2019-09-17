package com.kh.market.message.model.vo;

import java.util.Date;

public class Message {
	
	private int messageNo;
	private String messageTitle;
	private String messageWriter;
	private String messageReciver;
	private String messageContent;
	private String messageReadState;
	private String messageDate;
	private Date messageDeldate;
	private String messageDeltype;

	public Message(int messageNo, String messageTitle, String messageWriter, String messageReciver,
			String messageContent, String messageReadState, String messageDate, Date messageDeldate,
			String messageDeltype) {
		super();
		this.messageNo = messageNo;
		this.messageTitle = messageTitle;
		this.messageWriter = messageWriter;
		this.messageReciver = messageReciver;
		this.messageContent = messageContent;
		this.messageReadState = messageReadState;
		this.messageDate = messageDate;
		this.messageDeldate = messageDeldate;
		this.messageDeltype = messageDeltype;
	}
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	public int getMessageNo() {
		return messageNo;
	}
	public void setMessageNo(int messageNo) {
		this.messageNo = messageNo;
	}
	public String getMessageTitle() {
		return messageTitle;
	}
	public void setMessageTitle(String messageTitle) {
		this.messageTitle = messageTitle;
	}
	public String getMessageWriter() {
		return messageWriter;
	}
	public void setMessageWriter(String messageWriter) {
		this.messageWriter = messageWriter;
	}
	public String getMessageReciver() {
		return messageReciver;
	}
	public void setMessageReciver(String messageReciver) {
		this.messageReciver = messageReciver;
	}
	public String getMessageContent() {
		return messageContent;
	}
	public void setMessageContent(String messageContent) {
		this.messageContent = messageContent;
	}
	public String getMessageReadState() {
		return messageReadState;
	}
	public void setMessageReadState(String messageReadState) {
		this.messageReadState = messageReadState;
	}
	public String getMessageDate() {
		return messageDate;
	}
	public void setMessageDate(String messageDate) {
		this.messageDate = messageDate;
	}
	public Date getMessageDeldate() {
		return messageDeldate;
	}
	public void setMessageDeldate(Date messageDeldate) {
		this.messageDeldate = messageDeldate;
	}
	public String getMessageDeltype() {
		return messageDeltype;
	}
	public void setMessageDeltype(String messageDeltype) {
		this.messageDeltype = messageDeltype;
	}
	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageTitle=" + messageTitle + ", messageWriter=" + messageWriter
				+ ", messageReciver=" + messageReciver + ", messageContent=" + messageContent + ", messageReadState="
				+ messageReadState + ", messageDate=" + messageDate + ", messageDeldate=" + messageDeldate
				+ ", messageDeltype=" + messageDeltype + "]";
	}
	
	
	
}
