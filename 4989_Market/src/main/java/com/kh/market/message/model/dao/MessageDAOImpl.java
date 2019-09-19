package com.kh.market.message.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.message.model.vo.Message;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public List<Message> selectMessageList( String memberId) {
		return session.selectList("message.selectMessageList", memberId);
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
	public List<Message> selectMessageList2(String memberId) {
		return session.selectList("message.selectMessageList2", memberId);
	}

	@Override
	public int messageRead(String messageNo) {
		return session.update("message.messageRead", messageNo);
	}

}
