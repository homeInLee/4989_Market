package com.kh.market.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Notice> selectNoticeMember(Paging paging);

	List<Notice> selectNoticePayment(Paging paging);

	List<Notice> selectNoticeSell(Paging paging);

	List<Notice> selectNoticeAuction(Paging paging);

	List<Notice> selectNoticeOther(Paging paging);

	int insertNotice(Notice notice);

	Notice selectNoticeOne(int noticeNo);

	int deleteNotice(int noticeNo);

	List<Notice> selectNoticeAll(Paging paging);

	int totalContents();

	int updateReadCount(int noticeNo);

	int insertAttachment(Attachment a);

	int selectNoticeNo();

	List<Map<Attachment, String>> selectAttachmentOne(int noticeNo);

	int noticeUpdateEnd(Notice notice);

	List<String> selectOldFile(int noticeNo);

	int noticeDelFile(Map<Object, Object> map);

	int noticeListCnt();

	int noticeMemberCnt();

	int noticePaymentCnt();

	int noticeSellCnt();

	int noticeAuctionCnt();

	int noticeOtherCnt();

}
