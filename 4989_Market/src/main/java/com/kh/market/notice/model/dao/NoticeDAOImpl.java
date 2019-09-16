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
	
}
