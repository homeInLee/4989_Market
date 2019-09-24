package com.kh.market.notice.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.notice.model.service.NoticeService;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;

@Repository
public class NoticeDAOImpl implements NoticeDAO {

	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Notice> selectNoticeMember() {
		return session.selectList("notice.selectNoticeMember");
	}

	@Override
	public List<Notice> selectNoticePayment() {
		return session.selectList("notice.selectNoticePayment");
	}

	@Override
	public List<Notice> selectNoticeSell() {
		return session.selectList("notice.selectNoticeSell");
	}

	@Override
	public List<Notice> selectNoticeAuction() {
		return session.selectList("notice.selectNoticeAuction");
	}

	@Override
	public List<Notice> selectNoticeOther() {
		return session.selectList("notice.selectNoticeOther");
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
	public List<Notice> selectNoticeAll(int cPage) {
		int offset = (cPage -1)*NoticeService.NUM_PER_PAGE;
		int limit = NoticeService.NUM_PER_PAGE;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return session.selectList("notice.selectNoticeAll", null, rowBounds);
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
	
}
