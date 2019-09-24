package com.kh.market.message.model.dao;

import java.util.List;

import com.kh.market.message.model.vo.Message;

public interface MessageDAO {

	List<Message> selectMessageList(String memberId);

	int insertMessage(Message message);

	Message messageSelect(String messageNo);

	int messageDelete(String messageNo);

	List<Message> selectMessageList2(String memberId);

	int messageRead(String messageNo);

	int messageReview(Message m);

}
