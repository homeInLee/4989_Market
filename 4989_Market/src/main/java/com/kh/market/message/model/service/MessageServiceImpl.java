package com.kh.market.message.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.kh.market.message.model.dao.MessageDAO;
import com.kh.market.message.model.vo.Message;

@Repository
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDAO messageDAO;

	@Override
	public List<Message> selectMessageList(String memberId) {
		return messageDAO.selectMessageList(memberId);
	}

	@Override
	public int insertMessage(Message message) {
		return messageDAO.insertMessage(message);
	}

	@Override
	public Message messageSelect(String messageNo) {
		return messageDAO.messageSelect(messageNo);
	}

	@Override
	public int messageDelete(String messageNo) {
		return messageDAO.messageDelete(messageNo);
	}

	@Override
	public List<Message> selectMessageList2(String memberId) {
		return messageDAO.selectMessageList2(memberId);
	}

	@Override
	public int messageRead(String messageNo) {
		return messageDAO.messageRead(messageNo);
	}

	@Override
	public int messageReview(Message m) {
		
		return messageDAO.messageReview(m);
	}

	@Override
	public int messageReviewUpdate(int messageNo) {
		
		return messageDAO.messageReviewUpdate(messageNo);
	}

}
