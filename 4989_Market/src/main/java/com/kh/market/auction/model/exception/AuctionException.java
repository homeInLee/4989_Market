package com.kh.market.auction.model.exception;

public class AuctionException extends RuntimeException {

	public AuctionException() {
		super();
	}

	public AuctionException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
	}

	public AuctionException(String message, Throwable cause) {
		super(message, cause);
	}

	public AuctionException(String message) {
		super(message);
	}

	public AuctionException(Throwable cause) {
		super(cause);
	}

	
	
}
