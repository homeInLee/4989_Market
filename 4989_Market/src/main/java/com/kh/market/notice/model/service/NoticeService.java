package com.kh.market.notice.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

public interface NoticeService {
	
	List<Notice> selectNoticeMember(Paging paging);

	List<Notice> selectNoticePayment(Paging paging);

	List<Notice> selectNoticeSell(Paging paging);

	List<Notice> selectNoticeAuction(Paging paging);

	List<Notice> selectNoticeOther(Paging paging);

	int insertNotice(Notice notice, List<Attachment> attachList);

	Notice selectNoticeOne(int noticeNo);

	int deleteNotice(int noticeNo);

	List<Notice> selectNoticeAll(Paging paging);

	int totalContents();

	List<Map<Attachment, String>> selectAttachmentOne(int noticeNo);

	int noticeUpdateEnd(Notice notice, List<Attachment> attachList);

	List<String> selectOldFile(int noticeNo);

	int noticeDelFile(Map<Object, Object> map);

	int noticeListCnt();

	int noticeMemberCnt();

	int noticePaymentCnt();

	int noticeSellCnt();

	int noticeAuctionCnt();

	int noticeOtherCnt();

	int noticeViewCount(int noticeNo);



}
