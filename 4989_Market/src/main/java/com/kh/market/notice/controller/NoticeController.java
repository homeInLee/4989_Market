package com.kh.market.notice.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.notice.model.exception.NoticeException;
import com.kh.market.notice.model.service.NoticeService;
import com.kh.market.notice.model.vo.Attachment;
import com.kh.market.notice.model.vo.Notice;
import com.kh.market.common.util.HelloSpringUtils;


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
//		logger.info("totalContents="+totalContents);
		
		int totalPage = (int)Math.ceil((double)totalContents/NoticeService.NUM_PER_PAGE);
//		logger.info("totalPage="+totalPage);
		
		String pageBar = "";
		int pageBarSize = 5;
		
		int pageStart = ((cPage-1)/pageBarSize) * pageBarSize +1 ;
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
//		logger.info("pageStart["+pageStart+"] ~ pageEnd["+pageEnd+"]");
		
//		logger.info("pageBar="+pageBar);
		
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
	
	@RequestMapping("/noticeWriteEnd.do")
	public String noticeWriteEnd(Notice notice,
								MultipartFile[] upFile,
								Model model,
								HttpServletRequest request) {
		logger.info("게시글 저장 요청!");
//		logger.info("Notice={}",notice);
//		logger.info("upFile={}",upFile);
//		logger.info("upFile.length={}",upFile.length);
//		logger.info("upFile[0].name={}",upFile[0].getName());
//		logger.info("upFile[0].originalFileName={}",upFile[0].getOriginalFilename());
//		logger.info("upFile[0].size={}",upFile[0].getSize());
//		logger.info("upFile[1].name={}",upFile[1].getName());
//		logger.info("upFile[1].originalFileName={}",upFile[1].getOriginalFilename());
//		logger.info("upFile[1].size={}",upFile[1].getSize());
//		
		
		try {
			//파일 업로드: 서버에 파일저장
			String saveDirectory
			= request.getSession()
					 .getServletContext()
					 .getRealPath("/resources/upload/notice");
			
			List<Attachment> attachList = new ArrayList<>();
			
//		//MultipartFile 다루기
		for(MultipartFile f : upFile) {
			if(!f.isEmpty()) {
				//renamedFileName
				String originalFileName = f.getOriginalFilename();
				String renamedFileName = HelloSpringUtils.getRenamedFileName(originalFileName);
				System.out.println("originalfileName="+originalFileName);
				System.out.println("renamedFileName="+renamedFileName);
				
				try {
					//파일 실제 저장
					f.transferTo(new File(saveDirectory+"/"+renamedFileName));
				}catch(Exception e){
					e.printStackTrace();
				}
				
				//attachment vo 객체 담기
				Attachment attach = new Attachment();
				attach.setOriginalfileName(originalFileName);
				attach.setRenamedfileName(renamedFileName);
				attach.setBoardName("N");
				attachList.add(attach);
				
				logger.info("attach={}", attach);
				logger.info("attachList={}", attachList);
			}
		}
		int result = noticeService.insertNotice(notice, attachList);
		
		String msg = result > 0?"게시물 등록 성공!":"게시물 등록 실패ㅠㅠ";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/notice/noticeList.do");
		
		}catch(Exception e) {
			logger.error("게시물 등록 오류", e);
			throw new NoticeException("게시물 등록 오류",e);
		}
		return "common/msg";
	}
	
	@RequestMapping("/noticeView")
	public ModelAndView noticeView(ModelAndView mav,
									@RequestParam("noticeNo") int noticeNo) {
		System.out.println("noticeNo="+noticeNo);
		logger.debug("noticeView 이동");
		
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		List<Map<Attachment, String>> attachMap = noticeService.selectAttachmentOne(noticeNo);
		
		mav.addObject("attachMap", attachMap);
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
		List<Map<Attachment, String>> attachMap = noticeService.selectAttachmentOne(noticeNo);
		
		mav.addObject("attachMap", attachMap);
		mav.addObject("notice", notice);
		mav.addObject("noticeNo",noticeNo);
		mav.setViewName("notice/noticeUpdate");
		return mav;
	}
	
	@RequestMapping("/noticeDelete")
	public String noticeDelete(Model model,
							 @RequestParam("noticeNo")int noticeNo) {
		logger.info("delete@noticeNo="+noticeNo);
		int result = noticeService.deleteNotice(noticeNo);
		String msg = result > 0?"게시물 삭제 성공!":"게시물 삭제 실패ㅠㅠ";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/notice/noticeList.do");
		return "common/msg";
	}
	
	@RequestMapping("/noticeUpdateEnd")
	public String noticeUpdateEnd (Notice notice,
									MultipartFile[] upFile,
									Model model,
									HttpServletRequest request
										) {
		List<String> oldFile = new ArrayList<>();
		
		oldFile = noticeService.selectOldFile(notice.getNoticeNo());
		System.out.println(oldFile);
		
		
		if(upFile == null) {
			try {
				//파일 업로드: 서버에 파일저장
				String saveDirectory
				= request.getSession()
						 .getServletContext()
						 .getRealPath("/resources/upload/notice");
				
				List<Attachment> attachList = new ArrayList<>();
				
			//MultipartFile 다루기
			for(MultipartFile f : upFile) {
				if(!f.isEmpty()) {
					//renamedFileName
					String originalFileName = f.getOriginalFilename();
					String renamedFileName = HelloSpringUtils.getRenamedFileName(originalFileName);
					System.out.println("originalfileName="+originalFileName);
					System.out.println("renamedFileName="+renamedFileName);
//					
					try {
						//파일 실제 저장
						f.transferTo(new File(saveDirectory+"/"+renamedFileName));
					}catch(Exception e){
						e.printStackTrace();
					}
					Attachment attach = new Attachment();
					attach.setOriginalfileName(originalFileName);
					attach.setRenamedfileName(renamedFileName);
					attach.setBoardName("N");
					attachList.add(attach);
				}
			}
		
		
		
		
		System.out.println("notice="+notice);
		int result = noticeService.noticeUpdateEnd(notice);
		String msg = result > 0?"게시물 수정 성공!":"게시물 수정 실패ㅠㅠ";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/notice/noticeList.do");
		
		}catch(Exception e) {
			logger.error("게시물 등록 오류", e);
			throw new NoticeException("게시물 등록 오류",e);
		}
		}
		return "common/msg";
	}
	
}
