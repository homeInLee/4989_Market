package com.kh.market.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
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
	
	@GetMapping("/noticePayment")
	public List<Notice> noticePayment(){
		
		List<Notice> list = noticeService.selectNoticePayment();
		
		return list;
	}
	@GetMapping("/noticeSell")
	public List<Notice> noticeSell(){
		
		List<Notice> list = noticeService.selectNoticeSell();
		
		return list;
	}
	@GetMapping("/noticeDeclaration")
	public List<Notice> noticeDeclaration(){
		
		List<Notice> list = noticeService.selectNoticeDeclaration();
		
		return list;
	}
	@GetMapping("/noticeOther")
	public List<Notice> noticeOther(){
		
		List<Notice> list = noticeService.selectNoticeOther();
		
		return list;
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
	
	
	
	
}
