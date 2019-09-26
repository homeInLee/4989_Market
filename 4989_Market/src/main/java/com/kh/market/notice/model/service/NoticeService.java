package com.kh.market.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

public interface NoticeService {
	
	int NUM_PER_PAGE = 10;

	List<Notice> selectNoticeMember();

	List<Notice> selectNoticePayment();

	List<Notice> selectNoticeSell();

	List<Notice> selectNoticeAuction();

	List<Notice> selectNoticeOther();

	int insertNotice(Notice notice, List<Attachment> attachList);

	Notice selectNoticeOne(int noticeNo);

	int deleteNotice(int noticeNo);

	List<Notice> selectNoticeAll(int cPage);

	int totalContents();

	List<Map<Attachment, String>> selectAttachmentOne(int noticeNo);

	int noticeUpdateEnd(Notice notice, List<Attachment> attachList);

	List<String> selectOldFile(int noticeNo);

	int noticeDelFile(Map<Object, Object> map);



}
