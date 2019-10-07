package com.kh.market.auction.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.auction.model.vo.AuctionForList;

public interface AuctionDAO {

	List<Map<String, String>> auctionList();

	List<AuctionForList> auctionSelectOne(int auctionNo);

	int insertAuction(Auction auction);

	int insertAttachment(Attachment a);

	List<Auction> productSearch(String searchWord);

	int selectBoardNo();


	List<Map<String, String>> mainImage();

	List<Auction> memberAuctionSellView(String memberId);

	List<Attachment> auctionAttachment(String boardName);

	List<Auction> memberAuctionBuyView(String memberId);

	int ingPrice(Map<String, Object> ingMap);

}
