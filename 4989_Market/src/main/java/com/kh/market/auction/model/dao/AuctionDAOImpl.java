package com.kh.market.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.auction.model.vo.Auction;

@Repository
public class AuctionDAOImpl implements AuctionDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> auctionList() {
		return sqlSession.selectList("auction.auctionList");
	}
	

}
