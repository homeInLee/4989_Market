package com.kh.market.notice.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.notice.model.dao.NoticeDAO;
import com.kh.market.notice.model.exception.NoticeException;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public List<Notice> selectNoticeMember(Paging paging) {
		return noticeDAO.selectNoticeMember(paging);
	}

	@Override
	public List<Notice> selectNoticePayment(Paging paging) {
		return noticeDAO.selectNoticePayment(paging);
	}

	@Override
	public List<Notice> selectNoticeSell(Paging paging) {
		return noticeDAO.selectNoticeSell(paging);
	}

	@Override
	public List<Notice> selectNoticeAuction(Paging paging) {
		return noticeDAO.selectNoticeAuction(paging);
	}

	@Override
	public List<Notice> selectNoticeOther(Paging paging) {
		return noticeDAO.selectNoticeOther(paging);
	}

	@Override
	public int insertNotice(Notice notice, List<Attachment> attachList) {
		 logger.info("Notice={}",notice);
		 int result = noticeDAO.insertNotice(notice);
		 
		 if(result == 0) {
				throw new NoticeException("게시글 등록 오류");
			}
		 
		 int noticeNo = noticeDAO.selectNoticeNo();
		 System.out.println("noticeNo = "+noticeNo);
		 
		 if(attachList.size() > 0) {
			 for(Attachment a : attachList) {
				 a.setBoardNo(noticeNo);//생성된 게시물 번호 대입
				 result = noticeDAO.insertAttachment(a);
				 if(result == 0) {
						throw new NoticeException("첨부파일 등록 오류");
				 }
				 
			 }
		 }
		 System.out.println("attachment_service@result="+result);
		 return result;
	}

	@Override
	public Notice selectNoticeOne(int noticeNo) {
		return noticeDAO.selectNoticeOne(noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDAO.deleteNotice(noticeNo);
	}

	@Override
	public List<Notice> selectNoticeAll(Paging paging) {
		return noticeDAO.selectNoticeAll(paging);
	}

	@Override
	public int totalContents() {
		return noticeDAO.totalContents();
	}

	@Override
	public List<Map<Attachment, String>> selectAttachmentOne(int noticeNo) {
		return noticeDAO.selectAttachmentOne(noticeNo);
	}

	@Override
	public int noticeUpdateEnd(Notice notice, List<Attachment> attachList) {
		 logger.info("Notice={}",notice);
		 int result = noticeDAO.noticeUpdateEnd(notice);
		 
		 if(result == 0) {
				throw new NoticeException("게시글 등록 오류");
			}
		 System.out.println(notice.getNoticeNo()); // 게시물번호
		 
		 if(attachList.size() > 0) {
			 for(Attachment a : attachList) {
				 a.setBoardNo(notice.getNoticeNo());//생성된 게시물 번호 대입
				 result = noticeDAO.insertAttachment(a);
				 if(result == 0) {
						throw new NoticeException("첨부파일 등록 오류");
				 }
				 
			 }
		 }
		 System.out.println("attachment_service@result="+result);
		return result;
	}

	@Override
	public List<String> selectOldFile(int noticeNo) {
		return noticeDAO.selectOldFile(noticeNo);
	}

	@Override
	public int noticeDelFile(Map<Object, Object> map) {
		return noticeDAO.noticeDelFile(map);
	}

	@Override
	public int noticeListCnt() {
		return noticeDAO.noticeListCnt();
	}

	@Override
	public int noticeMemberCnt() {
		return noticeDAO.noticeMemberCnt();
	}

	@Override
	public int noticePaymentCnt() {
		return noticeDAO.noticePaymentCnt();
	}

	@Override
	public int noticeSellCnt() {
		return noticeDAO.noticeSellCnt();
	}

	@Override
	public int noticeAuctionCnt() {
		return noticeDAO.noticeAuctionCnt();
	}

	@Override
	public int noticeOtherCnt() {
		return noticeDAO.noticeOtherCnt();
	}

	@Override
	public int noticeViewCount(int noticeNo) {
		return noticeDAO.noticeViewCount(noticeNo);
	}

	
}
