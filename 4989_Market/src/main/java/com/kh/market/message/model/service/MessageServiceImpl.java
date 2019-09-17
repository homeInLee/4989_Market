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

}
