package com.kh.market.notice.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.notice.model.service.NoticeService;
import com.kh.market.notice.model.vo.Notice;


@RestController
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@GetMapping("/noticeList.do")
	public ModelAndView noticeList(ModelAndView mav) {
		
		logger.debug("/notice/noticeList.do 연결.");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	
	@GetMapping("/noticeMember")
	public List<Notice> noticeMember(){

		List<Notice> list = noticeService.selectNoticeMember();
		
		return list;
	}
	
	
}
