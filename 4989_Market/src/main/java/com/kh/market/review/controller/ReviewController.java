package com.kh.market.review.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/reviewMain.do")
	public ModelAndView reviewMain(ModelAndView mav) {
		logger.debug("들어옴?");
		mav.setViewName("review/reviewMain");
		return mav;
	}
}
