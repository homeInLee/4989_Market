package com.kh.market.notice.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.kh.market.common.model.vo.Paging;
import com.kh.market.common.util.HelloSpringUtils;
import com.kh.market.member.model.vo.Member;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	
	@Autowired
	NoticeService noticeService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/noticeList.do")
	public ModelAndView noticeList(@RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		
		ModelAndView mav = new ModelAndView();
		
		logger.debug("/notice/noticeList.do 연결.");
		int listCnt = noticeService.noticeListCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticeAll(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "e");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	
	@RequestMapping("/noticeMember")
	public ModelAndView noticeMember(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		int listCnt = noticeService.noticeMemberCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticeMember(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "m");
		mav.setViewName("notice/noticeList");
		
		return mav;
		
	}
	
	@RequestMapping("/noticePayment")
	public ModelAndView noticePayment(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		int listCnt = noticeService.noticePaymentCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticePayment(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "p");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	@RequestMapping("/noticeSell")
	public ModelAndView noticeSell(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		int listCnt = noticeService.noticeSellCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticeSell(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "s");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	@RequestMapping("/noticeAuction")
	public ModelAndView noticeAuction(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		int listCnt = noticeService.noticeAuctionCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticeAuction(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "a");
		mav.setViewName("notice/noticeList");
		
		return mav;
	}
	@RequestMapping("/noticeOther")
	public ModelAndView noticeOther(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range){
		int listCnt = noticeService.noticeOtherCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		List<Notice> list = noticeService.selectNoticeOther(paging);
		logger.info("list="+list);
		for(int i=0; i<list.size(); i++) {
			logger.info("noticeType="+list.get(i).getNoticeType());
		}
		logger.info("listCnt="+listCnt);
		
		mav.addObject("list",list);
		mav.addObject("paging",paging);
		mav.addObject("type", "o");
		mav.setViewName("notice/noticeList");
		
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
									HttpServletRequest request,
									HttpServletResponse response,
									@RequestParam("noticeNo") int noticeNo,
									@RequestParam(value="decNo", defaultValue="0", required=false)int decNo ){
		System.out.println("decNo="+decNo);
//		System.out.println("noticeNo="+noticeNo);
		logger.debug("noticeView 이동");
		
		Notice notice = noticeService.selectNoticeOne(noticeNo);
		List<Map<Attachment, String>> attachMap = noticeService.selectAttachmentOne(noticeNo);
		
		Cookie[] cookies = request.getCookies();
		
		Cookie viewCookie = null;
		
		if(cookies != null && cookies.length > 0) {
			for(int i = 0; i<cookies.length; i++) {
				if(cookies[i].getName().equals("cookie"+noticeNo)) {
					System.out.println("첫 쿠키 생성");
					viewCookie = cookies[i];
				}
			}
		}
		
		if(notice != null) {
			mav.addObject("decNo",decNo);
			mav.addObject("attachMap", attachMap);
			mav.addObject("notice", notice);
			mav.addObject("noticeNo", noticeNo);
			
			if(viewCookie==null) {
				System.out.println("쿠키 없음");
				
				//쿠키생성
				Cookie newCookie = new Cookie("cookie"+noticeNo,"|" + noticeNo +"|");
				
				//쿠키 추가
				response.addCookie(newCookie);
				
				//쿠키를 추가 시키고 조회수 증가시킴
				int result = noticeService.noticeViewCount(noticeNo);
			
				
				if(result >0) {
					System.out.println("조회수 증가");
				}else {
					System.out.println("조회수 증가 에러");
				}
			}else {
				System.out.println("쿠키있음");
				
				//쿠키 값 받아옴
				String value = viewCookie.getValue();
				System.out.println("cookie 값 : "+value);
			}
			
			mav.setViewName("/notice/noticeView");
			return mav;
			
		}else {
			mav.setViewName("/common/error");
			return mav;
		}
	}
	
	
	
	@RequestMapping("/noticeUpdate")
	public ModelAndView noticeUpdate(ModelAndView mav,
									@RequestParam("noticeNo")int noticeNo) {
		logger.debug("update@noticeNo="+noticeNo);
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
									@RequestParam(value="oldOName", defaultValue="", required = false) String[] oldOName,
									@RequestParam(value="oldRName", defaultValue="", required = false) String[] oldRName,
									@RequestParam(value="delRName", defaultValue="", required = false) String[] delRName,
									int noticeNo,
									MultipartFile[] upFile,
									Model model,
									HttpServletRequest request
										) {
		logger.info("upFile={}",upFile);	
			try {
				//파일 업로드: 서버에 파일저장
				String saveDirectory
				= request.getSession()
						 .getServletContext()
						 .getRealPath("/resources/upload/notice");
				
				List<Attachment> attachList = new ArrayList<>();
				//첨부파일 추가 
			if(upFile != null && upFile.length>0 ) {
				logger.info("첨부파일 추가 있음");
			//MultipartFile 다루기
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
					Attachment attach = new Attachment();
					attach.setOriginalfileName(originalFileName);
					attach.setRenamedfileName(renamedFileName);
					attach.setBoardName("N");
					attachList.add(attach);
					logger.info("attach={}",attach);
					logger.info("attachList={}",attachList);
				}
			}
			}
//			try {
				
				if(delRName.length > 0 && delRName != null) {
					
					logger.info("파일 삭제 요청");
					Map<Object, Object> map = new HashMap<>();
					map.put("noticeNo", noticeNo);
					
					for(int i = 0; i<delRName.length; i++) {
						
//				System.out.println("delRName"+i+":"+delRName[i]);
						map.put("del", delRName[i]);
//				System.out.println(map.toString());
						int attachDel = noticeService.noticeDelFile(map);
					}
				}
//			}catch(Exception e) {
//				logger.error("파일삭제 오류", e);
//				throw new NoticeException("게시물 등록 오류",e);
//			}
		System.out.println("notice="+notice);
		int result = noticeService.noticeUpdateEnd(notice,attachList);
		System.out.println("result="+result);
		String msg = result > 0?"게시물 수정 성공!":"게시물 수정 실패ㅠㅠ";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/notice/noticeList.do");
		
			}catch(Exception e) {
				logger.error("게시물 등록 오류", e);
				throw new NoticeException("게시물 등록 오류",e);
			}
			
		return "common/msg";
	}
}
