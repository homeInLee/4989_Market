package com.kh.market.message.model.dao;

import java.util.List;

import com.kh.market.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMessageList();

	int insertMessage(Message message);

}
