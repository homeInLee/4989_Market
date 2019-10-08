package com.kh.market.basket.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.auction.model.vo.Auction;
import com.kh.market.basket.model.dao.BasketDAO;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDAO basketDAO;

	@Override
	public List<Product> basketView(Map<String, Object> map) {
		
		return basketDAO.basketView(map);
	}

	@Override
	public int totalBasketCount(String basketMemberId) {
		
		return basketDAO.totalBasketCount(basketMemberId);
	}

	@Override
	public int basketInsert(Basket b) {
		
		return basketDAO.basketInsert(b);
	}

	@Override
	public int basketDelete(Basket b) {
		
		return basketDAO.basketDelete(b);
	}

	@Override
	public Basket basketCheck(Basket b) {
		
		return basketDAO.basketCheck(b);
	}

	@Override
	public List<Auction> basketAuctionView(Map<String, Object> map) {
		
		return basketDAO.basketAuctionView(map);
	}

	@Override
	public List<Basket> basketSelectCnt(int sellNo) {
		
		return basketDAO.basketSelectCnt(sellNo);
	}

	@Override
	public List<Basket> basketSelectAuctionCnt(int auctionNo) {
		
		return basketDAO.basketSelectAuctionCnt(auctionNo);
	}

	@Override
	public int basketSellCompleteDelete(int sellNo) {
		
		return basketDAO.basketSellCompleteDelete(sellNo);
	}

	@Override
	public int basketAuctionCompleteDelete(int auctionNo) {
		
		return basketDAO.basketAuctionCompleteDelete(auctionNo);
	}
	
	@Override
	public int auctionBasketCnt(String basketMemberId) {
		return basketDAO.auctionBasketCnt(basketMemberId);
	}
}
