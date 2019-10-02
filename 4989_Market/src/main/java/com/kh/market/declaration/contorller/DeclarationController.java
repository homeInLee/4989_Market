package com.kh.market.declaration.contorller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.declaration.model.service.DeclarationService;
import com.kh.market.declaration.model.vo.Declaration;

@Controller
@RequestMapping("/declaration")
public class DeclarationController {

	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	DeclarationService declarationService;
	
	@RequestMapping("/connectDeclaration")
	public ModelAndView connectDeclaration(ModelAndView mav,
											Declaration declaration) {
		logger.info("declaration={}",declaration);
		mav.addObject("declaration",declaration);
		mav.setViewName("declaration/declarationWrite");
		return mav;
	}
	@RequestMapping("/insertMemberDeclaration")
	public String insertMemberDeclaration(Model model,
										Declaration declaration) {
		
		logger.info("declaration={}",declaration);
		int result = declarationService.insertMemberDeclaration(declaration);
		logger.info("result=",result);
		String msg = result > 0?"신고 등록 성공!":"신고 등록 실패ㅠㅠ";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/notice/noticeList.do");
		
		
		return "common/msg";
	}
	
	@RequestMapping("/declarationList")
	public ModelAndView declarationList(ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		int listCnt = declarationService.declarationListCnt();
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		logger.info("declarationList 요청");
		List<Declaration> list = declarationService.declarationList(paging);
		
		logger.info("list={}",list);
		mav.addObject("list",list);
		mav.addObject("paging", paging);
		mav.setViewName("declaration/declarationList");
		
		return mav;
		
	}
	
	@RequestMapping("/selectOneDeclaration")
	public ModelAndView selectOneDeclaration(ModelAndView mav,
											@RequestParam("declarationNo")int declarationNo){
		System.out.println("declarationNo="+declarationNo);
		logger.info("declarationView 이동");
		
		Declaration declaration = declarationService.selectOneDeclaration(declarationNo);
		
		int decNo = declarationNo;
		
		mav.addObject("declaration", declaration);
		mav.addObject("decNo",decNo);
		mav.setViewName("/declaration/declarationView");
		
		
		return mav;
		
	}
	
	@RequestMapping("/declarationProcess")
	public String declarationProcess(Model model,
										@RequestParam("memberId")String memberId,
										@RequestParam("decNo")int decNo
										) {
		logger.info("declarationProcess 시작");		
		
		System.out.println("memberId="+memberId);
		
		int result = declarationService.declarationProcess(memberId);
		
		String msg = "신고처리 실패";
		if(result > 0) {
			int state = declarationService.declarationStateUpdate(decNo);
			int massage = declarationService.declarationReceiveCheck(memberId);
			msg = "신고처리 성공";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/declaration/declarationList");
		
		return "common/msg";
	}
	
	@RequestMapping("/declarationCheck")
	public String declarationCheck(Model model,
									@RequestParam("declarationWriter")String declarationWriter
//									@RequestParam("declarationReceiver")String declarationReceiver
									) {
		
		System.out.println("declarationWriter="+declarationWriter);
		int result = declarationService.declarationCheck(declarationWriter);
		
		String msg = result > 0?"신고 알림 성공":"신고 알림 실패";
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/declaration/declarationList");
		
		return "common/msg";
	}
}
