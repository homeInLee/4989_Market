package com.kh.market.notice.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.notice.model.dao.NoticeDAO;
import com.kh.market.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeDAO noticeDAO;

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
	public int insertNotice(Notice notice) {
		return noticeDAO.insertNotice(notice);
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

	
}
