package com.kh.market.review.controller;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/reviewMain.do")
	public ModelAndView reviewMain(ModelAndView mav) {
		mav.setViewName("review/reviewMain");
		return mav;
	}
	
	@RequestMapping("/reviewCheckForm.do")
	public ModelAndView reviewCheckForm(ModelAndView mav) {
		mav.setViewName("review/reviewCheckForm");
		return mav;
	}
	
	@RequestMapping("/reviewCheckEnd.do")
	public ModelAndView reviewCheckEnd(ModelAndView mav,@RequestParam("checkList") ArrayList<String> checkList) {
		//String checkNum
		mav.setViewName("review/reviewMain");
		return mav;
	}
}
