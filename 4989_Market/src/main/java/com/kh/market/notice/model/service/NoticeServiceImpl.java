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
}
