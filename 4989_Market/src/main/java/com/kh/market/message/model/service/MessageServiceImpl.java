package com.kh.market.message.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.message.model.dao.MessageDAO;

@Service
public class MessageServiceImpl implements MessageService {
	
	@Autowired
	MessageDAO messageDAO;

}
