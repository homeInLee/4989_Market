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
	public List<Product> basketView(Map<Object, Object> map) {
		int cPage=(int)map.get("cPage");
		int offset = (cPage-1)*BasketService.NUM_PER_PAGE;
		int limit = BasketService.NUM_PER_PAGE;
		RowBounds rowBounds=new RowBounds(offset, limit);
				
		return sqlSession.selectList("basket.basketView",map,rowBounds);
	}

	@Override
	public List<Basket> totalBasketCount(String basketMemberId) {
		
		return sqlSession.selectList("basket.totalBasketCount",basketMemberId);
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
	public List<Auction> basketAuctionView(Map<Object, Object> map) {
		int cPage=(int)map.get("cPage");
		int offset = (cPage-1)*BasketService.NUM_PER_PAGE;
		int limit = BasketService.NUM_PER_PAGE;
		RowBounds rowBounds=new RowBounds(offset, limit);
		
		return sqlSession.selectList("basket.basketAuctionView",map,rowBounds);
	}

	@Override
	public List<Basket> basketSelectCnt(int sellNo) {
		
		return sqlSession.selectList("basket.basketSelectCnt",sellNo);
	}

	@Override
	public List<Basket> basketSelectAuctionCnt(int auctionNo) {
		
		return sqlSession.selectList("basket.basketSelectAuctionCnt",auctionNo);
	}

	@Override
	public int basketSellCompleteDelete(int sellNo) {
		
		return sqlSession.delete("basket.basketSellCompleteDelete",sellNo);
	}

	@Override
	public int basketAuctionCompleteDelete(int auctionNo) {
		
		return sqlSession.delete("basket.basketAuctionCompleteDelete",auctionNo);
	}
}
