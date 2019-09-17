package com.kh.market.auction.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.auction.model.vo.Auction;

public interface AuctionDAO {

	List<Map<String, String>> auctionList();

}
