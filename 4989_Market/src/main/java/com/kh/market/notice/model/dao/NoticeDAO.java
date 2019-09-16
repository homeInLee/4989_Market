package com.kh.market.notice.model.dao;

import java.util.List;

import com.kh.market.notice.model.vo.Notice;

public interface NoticeDAO {

	List<Notice> selectNoticeMember();

}
