package com.kh.market.message.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.message.model.vo.Message;

public interface MessageService {

	List<Message> selectMessageList(Map<String, Object> idPageMap);

	int insertMessage(Message message);

	Message messageSelect(String messageNo);

	int messageDelete(String messageNo);

	List<Message> selectMessageList2(Map<String, Object> idPageMap);

	int messageRead(String messageNo);

	int messageReview(Message m);

	int messageReviewUpdate(int messageNo);

	int messageListCnt1(String memberId);

	int messageListCnt2(String memberId);

}
