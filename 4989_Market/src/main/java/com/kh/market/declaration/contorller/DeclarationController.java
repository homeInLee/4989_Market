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
	public ModelAndView declarationList(ModelAndView mav,
										@RequestParam(value="cPage",
													  defaultValue="1",
													  required=false)int cPage) {
		
		logger.info("declarationList 요청");
		List<Declaration> list = declarationService.declarationList(cPage);
		
		logger.info("list={}",list);
		mav.addObject("list",list);
		mav.setViewName("declaration/declarationList");
		
		return mav;
		
	}
	
}
