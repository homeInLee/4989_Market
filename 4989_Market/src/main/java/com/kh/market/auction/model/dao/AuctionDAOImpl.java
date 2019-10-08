package com.kh.market.auction.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.auction.model.vo.AuctionForList;

@Repository
public class AuctionDAOImpl implements AuctionDAO {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> auctionList() {
		return sqlSession.selectList("auction.auctionList");
	}

	@Override
	public List<AuctionForList> auctionSelectOne(int auctionNo) {
		return sqlSession.selectList("auction.auctionSelectOne",auctionNo);
	}

	@Override
	public int insertAuction(Auction auction) {
		return sqlSession.insert("auction.insertAuction",auction);
	}

	@Override
	public int insertAttachment(Attachment a) {
		System.out.println("-------------insertAttachment-------------");
		return sqlSession.insert("auction.insertAttachment",a);
	}

	@Override
	public List<Auction> productSearch(String searchWord) {
		return sqlSession.selectList("auction.productSearch", searchWord);
	}

	@Override
	public int selectBoardNo() {
		return sqlSession.selectOne("auction.selectBoardNo");
	}


	@Override
	public List<Map<String, String>> mainImage() {
		return sqlSession.selectList("auction.mainImage");
	}

	@Override
	public List<Auction> memberAuctionSellView(Map<String, Object> map) {
		
		return sqlSession.selectList("auction.memberAuctionSellView",map);
	}

	@Override
	public List<Attachment> auctionAttachment(String boardName) {
		
		return sqlSession.selectList("auction.auctionAttachment",boardName);
	}

	@Override
	public List<Auction> memberAuctionBuyView(Map<String, Object> map) {
		
		return sqlSession.selectList("auction.memberAuctionBuyView",map);
	}

	@Override
	public int ingPrice(Map<String, Object> ingMap) {
		return sqlSession.update("auction.ingPrice", ingMap);
	}

	@Override
	public int auctionComplete(int auctionNo) {
		
		return sqlSession.update("auction.auctionComplete",auctionNo);
	}
	
	@Override
	public int directPrice(Map<String, Object> directMap) {
		return sqlSession.update("auction.directPrice", directMap);
	}

	@Override
	public int auctionSellCnt(String memberId) {
		return sqlSession.selectOne("auction.auctionSellCnt", memberId);
	}

	@Override
	public int auctionBuyCnt(String memberId) {
		return sqlSession.selectOne("auction.auctionBuyCnt", memberId);
	}
	

}
