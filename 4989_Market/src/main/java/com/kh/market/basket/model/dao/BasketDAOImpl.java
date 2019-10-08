package com.kh.market.basket.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.auction.model.vo.Auction;
import com.kh.market.basket.model.service.BasketService;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> basketView(Map<String, Object> map) {
		return sqlSession.selectList("basket.basketView",map);
	}

	@Override
	public int totalBasketCount(String basketMemberId) {
		
		return sqlSession.selectOne("basket.totalBasketCount",basketMemberId);
	}

	@Override
	public int basketInsert(Basket b) {
		
		return sqlSession.insert("basket.basketInsert",b);
	}

	@Override
	public int basketDelete(Basket b) {
		
		return sqlSession.delete("basket.basketDelete",b);
	}

	@Override
	public Basket basketCheck(Basket b) {
		
		return sqlSession.selectOne("basket.basketCheck",b);
	}

	@Override
	public List<Auction> basketAuctionView(Map<String, Object> map) {
		
		return sqlSession.selectList("basket.basketAuctionView",map);
	}

	@Override
	public int auctionBasketCnt(String basketMemberId) {
		return sqlSession.selectOne("basket.auctionBasketCnt",basketMemberId);
	}
}
