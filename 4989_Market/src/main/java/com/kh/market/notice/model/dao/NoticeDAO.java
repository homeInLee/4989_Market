package com.kh.market.notice.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Notice> selectNoticeMember();

	List<Notice> selectNoticePayment();

	List<Notice> selectNoticeSell();

	List<Notice> selectNoticeAuction();

	List<Notice> selectNoticeOther();

	int insertNotice(Notice notice);

	Notice selectNoticeOne(int noticeNo);

	int deleteNotice(int noticeNo);

	List<Notice> selectNoticeAll(int cPage);

	int totalContents();

	int updateReadCount(int noticeNo);

	int insertAttachment(Attachment a);

	int selectNoticeNo();

	List<Map<Attachment, String>> selectAttachmentOne(int noticeNo);

	int noticeUpdateEnd(Notice notice);

	List<String> selectOldFile(int noticeNo);

}
