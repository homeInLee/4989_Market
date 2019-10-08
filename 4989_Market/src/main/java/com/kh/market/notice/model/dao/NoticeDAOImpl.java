package com.kh.market.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Notice> selectNoticeMember(Paging paging) {
		return session.selectList("notice.selectNoticeMember", paging);
	}

	@Override
	public List<Notice> selectNoticePayment(Paging paging) {
		return session.selectList("notice.selectNoticePayment", paging);
	}

	@Override
	public List<Notice> selectNoticeSell(Paging paging) {
		return session.selectList("notice.selectNoticeSell", paging);
	}

	@Override
	public List<Notice> selectNoticeAuction(Paging paging) {
		return session.selectList("notice.selectNoticeAuction", paging);
	}

	@Override
	public List<Notice> selectNoticeOther(Paging paging) {
		return session.selectList("notice.selectNoticeOther", paging);
	}

	@Override
	public int insertNotice(Notice notice) {
		return session.insert("notice.insertNotice", notice);
	}

	@Override
	public Notice selectNoticeOne(int noticeNo) {
		return session.selectOne("notice.selectNoticeOne", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		return session.update("notice.deleteNotice", noticeNo);
	}

	@Override
	public List<Notice> selectNoticeAll(Paging paging) {
		return session.selectList("notice.selectNoticeAll", paging);
	}

	@Override
	public int totalContents() {
		return session.selectOne("notice.totalContents");
	}

	@Override
	public int updateReadCount(int noticeNo) {
		return session.update("notice.updateReadCount", noticeNo);
	}

	@Override
	public int insertAttachment(Attachment a) {
		int result =session.insert("notice.noticeInsertAttachment",a);
		System.out.println("insertAttachment@result= "+result);
		return result;
	}

	@Override
	public int selectNoticeNo() {
		int result = session.selectOne("notice.selectNoticeNo");
		System.out.println("selectNoticeNo@result= "+result);
		return result;
	}

	@Override
	public List<Map<Attachment, String>> selectAttachmentOne(int noticeNo) {
		return session.selectList("notice.selectAttachmentOne",noticeNo);
	}

	@Override
	public int noticeUpdateEnd(Notice notice) {
		return session.update("notice.noticeUpdateEnd",notice);
	}

	@Override
	public List<String> selectOldFile(int noticeNo) {
		return session.selectList("notice.selectOldFile", noticeNo);
	}

	@Override
	public int noticeDelFile(Map<Object, Object> map) {
		return session.update("notice.noticeDelFile",map);
	}

	@Override
	public int noticeListCnt() {
		return session.selectOne("notice.noticeListCnt");
	}

	@Override
	public int noticeMemberCnt() {
		return session.selectOne("notice.noticeMemberCnt");
	}

	@Override
	public int noticePaymentCnt() {
		return session.selectOne("notice.noticePaymentCnt");
	}

	@Override
	public int noticeSellCnt() {
		return session.selectOne("notice.noticeSellCnt");
	}

	@Override
	public int noticeAuctionCnt() {
		return session.selectOne("notice.noticeAuctionCnt");
	}

	@Override
	public int noticeOtherCnt() {
		return session.selectOne("notice.noticeOtherCnt");
	}
	
}
