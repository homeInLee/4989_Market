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
	public List<Notice> selectNoticeDeclaration() {
		return noticeDAO.selectNoticeDeclaration();
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
		return noticeDAO.selectNoticeOne(noticeNo);
	}

	
}
