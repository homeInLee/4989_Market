package com.kh.market.notice.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.PageContext;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.kh.market.notice.model.service.NoticeService;
import com.kh.market.notice.model.vo.Notice;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/noticeList.do")
	public ModelAndView noticeList(@RequestParam(value="cPage",
												defaultValue="1",
												required=false)int cPage) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.debug("/notice/noticeList.do 연결.");
		List<Notice> list = noticeService.selectNoticeAll(cPage);
		
		int totalContents = noticeService.totalContents();
		logger.info("totalContents="+totalContents);
		
		int totalPage = (int)Math.ceil((double)totalContents/NoticeService.NUM_PER_PAGE);
		logger.info("totalPage="+totalPage);
		
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageStart = ((cPage-1)/pageBarSize) * pageBarSize +1 ;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
		logger.info("pageStart["+pageStart+"] ~ pageEnd["+pageEnd+"]");
		
		logger.info("pageBar="+pageBar);
		
		mav.addObject("list",list);
		mav.addObject("cPage",cPage);
		mav.addObject("totalContents",totalContents);
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
	@RequestMapping("/noticeAuction")
	public ModelAndView noticeAuction(ModelAndView mav){
		
		List<Notice> list = noticeService.selectNoticeAuction();
		
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
//		
//		try {
//			//파일 업로드: 서버에 파일저장
//			String saveDirectory
//			= request.getSession()
//					 .getServletContext()
//					 .getRealPath("/resources/upload/board");
//		}catch(Exception e){
//			e.printStackTrace();
//		}
//		
		int result = noticeService.insertNotice(notice);
		
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
		
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		
		mav.addObject("notice", notice);
		mav.addObject("noticeNo", noticeNo);
		mav.setViewName("/notice/noticeView");
		
		return mav;
	}
	
	@RequestMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(ModelAndView mav,
									@RequestParam("noticeNo")int noticeNo) {
		logger.info("update@noticeNo="+noticeNo);
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		mav.addObject("notice", notice);
		mav.setViewName("notice/noticeUpdate");
		return mav;
	}
	
	@RequestMapping("/noticeDelete")
	public ModelAndView noticeDelete(ModelAndView mav,
									@RequestParam("noticeNo")int noticeNo) {
		logger.info("delete@noticeNo="+noticeNo);
		int result = noticeService.deleteNotice(noticeNo);
		mav.setViewName("notice/noticeList");
		return mav;
	}
	
}
