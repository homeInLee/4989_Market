package com.kh.market.basket.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.auction.model.vo.Auction;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

public interface BasketDAO {

	List<Product> basketView(Map<Object, Object> map);

	List<Basket> totalBasketCount(String basketMemberId);

	int basketInsert(Basket b);

	int basketDelete(Basket b);

	Basket basketCheck(Basket b);

	List<Auction> basketAuctionView(Map<Object, Object> map);

}
