package com.kh.market.auction.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.auction.model.dao.AuctionDAO;
import com.kh.market.auction.model.vo.Auction;

@Service
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	AuctionDAO auctionDAO;

	@Override
	public List<Map<String, String>> auctionList() {
		return auctionDAO.auctionList();
	}

	@Override
	public Auction auctionSelectOne(int auctionNo) {
		return auctionDAO.auctionSelectOne(auctionNo);
	}

}
