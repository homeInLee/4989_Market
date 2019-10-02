package com.kh.market.message.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Message> selectMessageList(Map<String, Object> idPageMap) {
		return session.selectList("message.selectMessageList", idPageMap);
	}

	@Override
	public int insertMessage(Message message) {
		return session.insert("message.insertMessage", message);
	}

	@Override
	public Message messageSelect(String messageNo) {
		return session.selectOne("message.messageSelect", messageNo);
	}

	@Override
	public int messageDelete(String messageNo) {
		return session.update("message.messageDelete", messageNo);
	}

	@Override
	public List<Message> selectMessageList2(Map<String, Object> idPageMap) {
		return session.selectList("message.selectMessageList2", idPageMap);
	}

	@Override
	public int messageRead(String messageNo) {
		return session.update("message.messageRead", messageNo);
	}

	@Override
	public int messageReview(Message m) {
		
		return session.insert("message.messageReview",m);
	}

	@Override
	public int messageReviewUpdate(int messageNo) {
		
		return session.update("message.messageReviewUpdate",messageNo);
	}

	@Override
	public int messageListCnt1(String memberId) {
		
		return session.selectOne("message.messageListCnt1",memberId);
	}

	@Override
	public int messageListCnt2(String memberId) {
		
		return session.selectOne("message.messageListCnt2",memberId);
	}

}
