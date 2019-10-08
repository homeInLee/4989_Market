package com.kh.market.basket.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.auction.model.vo.Auction;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

public interface BasketService {

	//페이지당 게시물수
	int NUM_PER_PAGE=8;
	
	List<Product> basketView(Map<String, Object> map);

	int totalBasketCount(String basketMemberId);

	int basketInsert(Basket b);

	int basketDelete(Basket b);

	Basket basketCheck(Basket b);

	List<Auction> basketAuctionView(Map<String, Object> map);

	int auctionBasketCnt(String basketMemberId);

}
