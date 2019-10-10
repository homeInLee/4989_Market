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
import com.kh.market.auction.model.vo.AuctionForList;

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
	public List<AuctionForList> auctionSelectOne(int auctionNo) {
		return auctionDAO.auctionSelectOne(auctionNo);
	}

	@Override
	public int insertAuction(Auction auction, List<Attachment> attachList) {
		int result = auctionDAO.insertAuction(auction);
		if(result == 0) {
			throw new AuctionException("게시글 등록 오류!");
		}
		int boardNo = auctionDAO.selectBoardNo();
		logger.info("selectBoardNo={}",boardNo);
		
		//첨부파일 등록
		if(attachList.size() > 0) {
			for(Attachment a: attachList) {
				a.setBoardNo(boardNo);//생성된 게시물번호 대입
				
				result = auctionDAO.insertAttachment(a);
				logger.info("-------------result={}------------",result);
				if(result ==0) {
					throw new AuctionException("첨부파일 등록 오류!");
				}
			}
		}
		
		return result;
	}

	@Override
	public List<Auction> productSearch(String searchWord) {
		return auctionDAO.productSearch(searchWord);
	}

	@Override
	public int selectBoardNo() {
		return auctionDAO.selectBoardNo();
	}


	@Override
	public List<Map<String, String>> mainImage() {
		return auctionDAO.mainImage();
	}

	@Override
	public List<Auction> memberAutionSellView(Map<String, Object> map) {
		
		return auctionDAO.memberAuctionSellView(map);
	}

	@Override
	public List<Attachment> auctionAttachment(String boardName) {
		
		return auctionDAO.auctionAttachment(boardName);
	}

	@Override
	public List<Auction> memberAuctionBuyView(Map<String, Object> map) {
		
		return auctionDAO.memberAuctionBuyView(map);
	}

	@Override
	public int ingPrice(Map<String, Object> ingMap) {
		return auctionDAO.ingPrice(ingMap);
	}

	@Override
	public int auctionComplete(int auctionNo) {
		
		return auctionDAO.auctionComplete(auctionNo);
	}
	
	@Override
	public int directPrice(Map<String, Object> directMap) {
		return auctionDAO.directPrice(directMap);
	}
	
	@Override
	public int auctionSellCnt(String memberId) {
		return auctionDAO.auctionSellCnt(memberId);
	}

	@Override
	public int auctionBuyCnt(String memberId) {
		return auctionDAO.auctionBuyCnt(memberId);
	}

	@Override
	public Auction updateAuction(int auctionNo) {
		return auctionDAO.updateAuction(auctionNo);
	}

	@Override
	public List<Map<String, String>> updateAttachment(int auctionNo) {
		return auctionDAO.updateAttachment(auctionNo);
	}

	@Override
	public int updateAuctionEnd(Auction auction, List<Attachment> attachList) {
		int result = auctionDAO.updateAuctionEnd(auction);
		System.out.println("업데이트 서비스");
		if(result == 0) {
			throw new AuctionException("게시글 수정 오류!");
		}
//		int boardNo = auctionDAO.selectBoardNo();
//		logger.info("selectBoardNo={}",boardNo);
		
		int delResult = auctionDAO.updateAttachmentBefore(attachList.get(0).getBoardNo());
		//첨부파일 등록
		if(attachList.size() > 0) {
			for(Attachment a: attachList) {
//				a.setBoardNo(auction.getAuctionNo());//생성된 게시물번호 대입
				
//				int result2 = auctionDAO.updateAttachmentEnd(a);
				int result2 = auctionDAO.insertAttachment(a);
				
				logger.info("-------------result={}------------",result);
				if(result2 ==0) {
					throw new AuctionException("첨부파일 수정 오류!");
				}
			}
		}
		
		return result;
	}

	@Override
	public int deleteAuction(int auctionNo) {
		auctionDAO.updateAttachmentBefore(auctionNo);
		return auctionDAO.deleteAuction(auctionNo);
	}


}
