package com.kh.market.message.model.service;

import java.util.List;

import com.kh.market.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMessageList(String memberId);

	int insertMessage(Message message);

}
