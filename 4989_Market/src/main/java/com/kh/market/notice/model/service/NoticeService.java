package com.kh.market.notice.model.service;

import java.util.List;

import com.kh.market.notice.model.vo.Notice;

public interface NoticeService {

	List<Notice> selectNoticeMember();

	List<Notice> selectNoticePayment();

	List<Notice> selectNoticeSell();

	List<Notice> selectNoticeDeclaration();

	List<Notice> selectNoticeOther();

	int insertNotice(Notice notice);

	Notice selectNoticeOne(int noticeNo);

}
