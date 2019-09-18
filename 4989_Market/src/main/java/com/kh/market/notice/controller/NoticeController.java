package com.kh.market.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.notice.model.service.NoticeService;
import com.kh.market.notice.model.vo.Notice;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/noticeList.do")
	public ModelAndView noticeList(ModelAndView mav) {
		
		logger.debug("/notice/noticeList.do 연결.");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	
	@RequestMapping("/noticeMember")
	public ModelAndView noticeMember(ModelAndView mav){

		List<Notice> list = noticeService.selectNoticeMember();
		
		mav.addObject("list",list);
		mav.setViewName("notice/noticeListView");
		
		return mav;
		
	}
	
	@RequestMapping("/noticePayment")
	public ModelAndView noticePayment(ModelAndView mav){
		
		List<Notice> list = noticeService.selectNoticePayment();
		
		mav.addObject("list",list);
		mav.setViewName("notice/noticeListView");
		
		return mav;
	}
	@RequestMapping("/noticeSell")
	public ModelAndView noticeSell(ModelAndView mav){
		
		List<Notice> list = noticeService.selectNoticeSell();
		
		mav.addObject("list",list);
		mav.setViewName("notice/noticeListView");
		
		return mav;
	}
	@RequestMapping("/noticeDeclaration")
	public ModelAndView noticeDeclaration(ModelAndView mav){
		
		List<Notice> list = noticeService.selectNoticeDeclaration();
		
		mav.addObject("list",list);
		mav.setViewName("notice/noticeListView");
		
		return mav;
	}
	@RequestMapping("/noticeOther")
	public ModelAndView noticeOther(ModelAndView mav){
		
		List<Notice> list = noticeService.selectNoticeOther();
		
		mav.addObject("list",list);
		mav.setViewName("notice/noticeListView");
		
		return mav;
	}
	
	@RequestMapping("/noticeWrite")
	public ModelAndView noticeWrite(ModelAndView mav) {
		
		logger.debug("noticeWrite 이동");
		
		mav.setViewName("notice/noticeWrite");
		
		return mav;
	}
	
	@RequestMapping(value="/noticeWriteEnd.do",
					method=RequestMethod.POST)
	public ModelAndView noticeWriteEnd(Notice notice,
								MultipartFile[] upFile,
								ModelAndView mav,
								HttpServletRequest request) {
		logger.info("게시글 저장 요청!");
//		logger.debug("Notice={}",notice);
//		logger.debug("upFile={}",upFile);
//		logger.debug("upFile.length={}",upFile.length);
//		logger.debug("upFile[0].name={}",upFile[0].getName());
//		logger.debug("upFile[0].originalFileName={}",upFile[0].getOriginalFilename());
//		logger.debug("upFile[0].size={}",upFile[0].getSize());
//		logger.debug("upFile[1].name={}",upFile[1].getName());
//		logger.debug("upFile[1].originalFileName={}",upFile[1].getOriginalFilename());
//		logger.debug("upFile[1].size={}",upFile[1].getSize());
		System.out.println("noticeType="+notice.getNoticeType());
		int result = noticeService.insertNotice(notice);
		System.out.println("result = "+result);
		String msg = result > 0?"게시물 등록 성공!":"게시물 등록 실패ㅠㅠ";
		mav.addObject("msg",msg);
		mav.addObject("loc","/notice/noticeList.do");
		
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
	@RequestMapping("/noticeView")
	public ModelAndView noticeView(ModelAndView mav,
									@RequestParam("noticeNo") int noticeNo) {
		System.out.println("noticeNo="+noticeNo);
		logger.debug("noticeView 이동");
		
		mav.setViewName("notice/noticeView");
		
		return mav;
	}
	
	
}
