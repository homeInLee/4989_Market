package com.kh.market.notice.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.notice.model.dao.NoticeDAO;

@Service
public class NoticeServiceImpl {

	@Autowired
	NoticeDAO noticeDAO;
}
