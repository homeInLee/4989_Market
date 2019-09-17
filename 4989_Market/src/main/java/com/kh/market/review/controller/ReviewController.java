package com.kh.market.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.review.model.service.ReviewService;
import com.kh.market.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
		
	@RequestMapping("/reviewCheckForm.do")
	public ModelAndView reviewCheckForm(ModelAndView mav) {
		mav.setViewName("review/reviewCheckForm");
		return mav;
	}
	
	@RequestMapping("/reviewCheckEnd.do")
	public ModelAndView reviewCheckEnd(ModelAndView mav,@RequestParam("checkList") ArrayList<String> checkList,@RequestParam("content") String content,@RequestParam("memberId") String memberId,@RequestParam("receiver") String receiver) {
		
//		String checkNum="";
//		for(int i=0;i<checkList.size();i++) {
//			if(i==checkList.size()-1) {
//				checkNum+=checkList.get(i);
//			}else {
//				checkNum+=checkList.get(i)+",";	
//			}
//		}
		String[] point=checkList.toArray(new String[checkList.size()]);
		Review review=new Review(0, memberId, receiver, point, content);
		int result=reviewService.reviewCheckEnd(review);
		
		String msg="";
		String loc="/member/memberView.do?memberId="+memberId;
		if(result>0) {
			msg="리뷰작성완료";
		}else {
			msg="리뷰작성실패";			
		}
		
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/reviewContentForm.do")
	public ModelAndView reviewContentForm(ModelAndView mav,@RequestParam("memberId") String memberId) {
		
		List<Review> reviewList=reviewService.reviewContentForm(memberId);
		mav.addObject("reviewList",reviewList);
		mav.setViewName("review/reviewContentForm");
		return mav;
	}
	
	@RequestMapping("/reviewMannerForm.do")
	public ModelAndView reviewMannerForm(ModelAndView mav,@RequestParam("memberId") String memberId) {
		
		List<Review> reviewList=reviewService.reviewContentForm(memberId);
		for(int i=0;i<reviewList.size();i++) {
			for(int j=0;j<reviewList.get(i).getReviewPoint().length;j++) {
				System.out.println(reviewList.get(i).getReviewPoint()[j]);
			}
		}
		mav.addObject("reviewList",reviewList);
		mav.setViewName("review/reviewMannerForm");
		return mav;
	}
}
