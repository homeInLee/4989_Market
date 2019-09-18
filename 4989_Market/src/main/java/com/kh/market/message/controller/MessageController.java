package com.kh.market.message.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.message.model.service.MessageService;
import com.kh.market.message.model.vo.Message;

@Controller
@RequestMapping("/message")
public class MessageController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	MessageService messageService;
	
	@RequestMapping("/messageList.do")
	public ModelAndView messageList(ModelAndView mav, @RequestParam(value="memberId")String memberId ) {
		logger.debug("messageService={}", messageService.getClass());
		logger.info("memberId="+memberId);
		
		List<Message> messageList = messageService.selectMessageList(memberId);
		
		mav.addObject("messageList", messageList);
		mav.setViewName("message/messageList");
		
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
	public ModelAndView insermessage(ModelAndView mav, Message message) {
		logger.info("message="+message);
		
		int result = messageService.insertMessage(message);
		
		mav.setViewName("redirect:/message/messageList.do");
		
		return mav;
	}
	
	@RequestMapping("/messageSelect.do")
	public String messageSelect(Model model, @RequestParam("messageNo") String messageNo) {
		logger.info("messageNo="+messageNo);
		Message message = messageService.messageSelect(messageNo);
		logger.info("message="+message);
		model.addAttribute("message", message);
		return("message/messageSelect");
	}
}














