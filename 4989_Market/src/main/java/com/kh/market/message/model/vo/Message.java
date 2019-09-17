package com.kh.market.message.model.vo;

import java.util.Date;

public class Message {
	

	private int messageNo;
	private String messageTitle;
	private String messageWriter;
	private String messageReciver;
	private String content;
	private String messageReadState;
	private Date messageDate;
	private Date messageDelDate;
	private String messageDelType;
	
	public Message() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Message(int messageNo, String messageTitle, String messageWriter, String messageReciver, String content,
			String messageReadState, Date messageDate, Date messageDelDate, String messageDelType) {
		super();
		this.messageNo = messageNo;
		this.messageTitle = messageTitle;
		this.messageWriter = messageWriter;
		this.messageReciver = messageReciver;
		this.content = content;
		this.messageReadState = messageReadState;
		this.messageDate = messageDate;
		this.messageDelDate = messageDelDate;
		this.messageDelType = messageDelType;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMessageReadState() {
		return messageReadState;
	}

	public void setMessageReadState(String messageReadState) {
		this.messageReadState = messageReadState;
	}

	public Date getMessageDate() {
		return messageDate;
	}

	public void setMessageDate(Date messageDate) {
		this.messageDate = messageDate;
	}

	public Date getMessageDelDate() {
		return messageDelDate;
	}

	public void setMessageDelDate(Date messageDelDate) {
		this.messageDelDate = messageDelDate;
	}

	public String getMessageDelType() {
		return messageDelType;
	}

	public void setMessageDelType(String messageDelType) {
		this.messageDelType = messageDelType;
	}

	@Override
	public String toString() {
		return "Message [messageNo=" + messageNo + ", messageTitle=" + messageTitle + ", messageWriter=" + messageWriter
				+ ", messageReciver=" + messageReciver + ", content=" + content + ", messageReadState="
				+ messageReadState + ", messageDate=" + messageDate + ", messageDelDate=" + messageDelDate
				+ ", messageDelType=" + messageDelType + "]";
	}
	
}
