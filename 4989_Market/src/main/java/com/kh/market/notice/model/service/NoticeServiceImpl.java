package com.kh.market.notice.model.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	public List<Notice> selectNoticeMember() {
		return noticeDAO.selectNoticeMember();
	}

	@Override
	public List<Notice> selectNoticePayment() {
		return noticeDAO.selectNoticePayment();
	}

	@Override
	public List<Notice> selectNoticeSell() {
		return noticeDAO.selectNoticeSell();
	}

	@Override
	public List<Notice> selectNoticeAuction() {
		return noticeDAO.selectNoticeAuction();
	}

	@Override
	public List<Notice> selectNoticeOther() {
		return noticeDAO.selectNoticeOther();
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
		int result = noticeDAO.updateReadCount(noticeNo);
		Notice notice = new Notice();
		if(result > 0) {
			notice = noticeDAO.selectNoticeOne(noticeNo);
		}
		return notice;
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return noticeDAO.deleteNotice(noticeNo);
	}

	@Override
	public List<Notice> selectNoticeAll(int cPage) {
		return noticeDAO.selectNoticeAll(cPage);
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

	
}
