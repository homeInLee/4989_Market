package com.kh.market.notice.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Notice> selectNoticeDeclaration() {
		return session.selectList("notice.selectNoticeDeclaration");
	}

	@Override
	public List<Notice> selectNoticeOther() {
		return session.selectList("notice.selectNoticeOther");
	}

	@Override
	public int insertNotice(Notice notice) {
		return session.insert("notice.insertNotice", notice);
	}
	
}
