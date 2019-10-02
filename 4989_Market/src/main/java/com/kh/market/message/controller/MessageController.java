package com.kh.market.message.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.message.model.service.MessageService;
import com.kh.market.message.model.vo.Message;

@Controller
@RequestMapping("/message")
public class MessageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("/messageList.do")
	public ModelAndView messageList(ModelAndView mav, @RequestParam(value="memberId")String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		logger.debug("messageService={}", messageService.getClass());
		logger.info("memberId="+memberId);
		
		int listCnt = messageService.messageListCnt1(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> idPageMap = new HashMap<>();
		idPageMap.put("memberId", memberId);
		idPageMap.put("paging", paging);
		List<Message> messageList = messageService.selectMessageList(idPageMap);
		logger.info("messageList="+messageList);
		
		mav.addObject("messageList", messageList);
		mav.addObject("paging", paging);
		mav.setViewName("message/messageList");
		
		return mav;
	}
	@RequestMapping("/messageList2.do")
	public ModelAndView messageList2(ModelAndView mav, @RequestParam(value="memberId")String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range ) {
		logger.debug("messageService={}", messageService.getClass());
		logger.info("memberId="+memberId);
		
		int listCnt = messageService.messageListCnt2(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> idPageMap = new HashMap<>();
		idPageMap.put("memberId", memberId);
		idPageMap.put("paging", paging);
		List<Message> messageList = messageService.selectMessageList2(idPageMap);
		logger.info("messageList="+messageList);
		
		mav.addObject("messageList", messageList);
		mav.addObject("paging", paging);
		mav.setViewName("message/messageList2");
		
		return mav;
	}


	 @RequestMapping("/messageListEnd.do")
	 public ModelAndView messageListEnd(ModelAndView mav, @RequestParam("messageWriter") String messageWriter, @RequestParam(name="messageReciver",required=false) String messageReciver) { 
		 logger.debug("insert페이지로 연결");
		 mav.addObject("messageWriter", messageWriter);
		 mav.addObject("messageReciver", messageReciver);
		 mav.setViewName("message/messageInsert");
		 return mav; 
	 }

	@RequestMapping("/messageInsert.do")
	public ModelAndView insertMessage(ModelAndView mav, Message message) {
		logger.info("message="+message);
		
		int result = messageService.insertMessage(message);
		
		mav.addObject("msg", result>0?"전송이 성공하였습니다.":"전송이 실패하였습니다.");
		mav.addObject("loc", result>0?"/message/messageList2.do?memberId="+message.getMessageWriter():"/message/messageListEnd.do?messageWriter="+message.getMessageWriter()+"&messageReciver="+message.getMessageReciver());
		mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping("/messageSelect.do")
	public String messageSelect(Model model, @RequestParam("messageNo") String messageNo, @RequestParam("memberId") String memberId) {
		logger.info("messageNo="+messageNo);
		Message message = messageService.messageSelect(messageNo);
		if(memberId.equals(message.getMessageReciver())) {
			int result = messageService.messageRead(messageNo);			
		}
		logger.info("message="+message);
		model.addAttribute("message", message);
		return("message/messageSelect");
	}
	
	@RequestMapping("/messageDelete.do")
	public String messageDelete(Model model, @RequestParam("messageNo") String messageNo, @RequestParam("memberId") String memberId) {
		logger.info("messageNo="+messageNo);
		
		int result = messageService.messageDelete(messageNo);
		model.addAttribute("msg", result>0?"성곡적으로 삭제되었습니다.":"삭제가 실패하였습니다.");
		model.addAttribute("loc", "/message/messageList.do?memberId="+memberId);
		return("common/msg");
	}
	
}














