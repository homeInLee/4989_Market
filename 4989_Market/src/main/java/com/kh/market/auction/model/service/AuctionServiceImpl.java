package com.kh.market.auction.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.auction.model.dao.AuctionDAO;
import com.kh.market.auction.model.exception.AuctionException;
import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;

@Service
public class AuctionServiceImpl implements AuctionService {
	
	@Autowired
	AuctionDAO auctionDAO;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public List<Map<String, String>> auctionList() {
		return auctionDAO.auctionList();
	}

	@Override
	public Auction auctionSelectOne(int auctionNo) {
		return auctionDAO.auctionSelectOne(auctionNo);
	}

	@Override
	public int insertAuction(Auction auction, List<Attachment> attachList) {
		System.out.println("------------------------------------------------result-------------------------------");
		int result = auctionDAO.insertAuction(auction);
		System.out.println("------------------------------------------------"+result+"-------------------------------");
		if(result == 0) {
			throw new AuctionException("게시글 등록 오류!");
		}
		
		int boardNo = auction.getAuctionNo();
		logger.info("auction={}",auction);
		
		//첨부파일 등록
		if(attachList.size() > 0) {
			for(Attachment a: attachList) {
				a.setBoardNo(boardNo);//생성된 게시물번호 대입
				
				result = auctionDAO.insertAttachment(a);
				if(result ==0) {
					throw new AuctionException("첨부파일 등록 오류!");
				}
			}
		}
		
		return result;
	}

}
