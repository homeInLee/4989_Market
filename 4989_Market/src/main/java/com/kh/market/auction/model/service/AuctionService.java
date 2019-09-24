package com.kh.market.auction.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;

public interface AuctionService {

	List<Map<String, String>> auctionList();

	Auction auctionSelectOne(int auctionNo);

	int insertAuction(Auction auction, List<Attachment> attachList);

	List<Auction> productSearch(String searchWord);

}
