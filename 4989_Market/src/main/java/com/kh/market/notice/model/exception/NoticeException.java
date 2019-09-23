package com.kh.market.notice.model.exception;

public class NoticeException extends RuntimeException{

	public NoticeException() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public NoticeException(String message, Throwable cause) {
		super(message, cause);
	}

	public NoticeException(String message) {
		super(message);
	}

	public NoticeException(Throwable cause) {
		super(cause);
	}

	
}
