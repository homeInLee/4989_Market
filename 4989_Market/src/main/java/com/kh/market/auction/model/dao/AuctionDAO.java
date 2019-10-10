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

	List<Auction> memberAuctionSellView(Map<String, Object> map);

	List<Attachment> auctionAttachment(String boardName);

	List<Auction> memberAuctionBuyView(Map<String, Object> map);

	int ingPrice(Map<String, Object> ingMap);

	int auctionComplete(int auctionNo);

	int directPrice(Map<String, Object> directMap);

	int auctionSellCnt(String memberId);

	int auctionBuyCnt(String memberId);

	List<Auction> moreResult(Map<String, Integer> pageMap);

	List<Attachment> moreAttach();


}
