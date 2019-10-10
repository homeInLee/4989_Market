package com.kh.market.review.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.message.model.service.MessageService;
import com.kh.market.product.model.vo.Product;
import com.kh.market.review.model.service.ReviewService;
import com.kh.market.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	@Autowired
	MessageService messageService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/reviewMain.do")
	public ModelAndView reviewMain(@RequestParam String memberId,ModelAndView mav) {
		mav.setViewName("review/reviewMain");
		return mav;
	}
	
	@RequestMapping("/reviewCheckForm.do")
	public ModelAndView reviewCheckForm(ModelAndView mav,@RequestParam("messageWriter") String messageWriter,@RequestParam("messageNo") int messageNo) {
		
		mav.addObject("messageWriter",messageWriter);
		mav.addObject("messageNo",messageNo);		
		mav.setViewName("review/reviewCheckForm");
		return mav;
	}
	
	@RequestMapping("/reviewCheckEnd.do")
	public ModelAndView reviewCheckEnd(ModelAndView mav,@RequestParam("checkList") ArrayList<String> checkList,@RequestParam("content") String content,@RequestParam("memberId") String memberId,@RequestParam("receiver") String receiver,@RequestParam("messageNo") int messageNo) {
		
		String[] point=checkList.toArray(new String[checkList.size()]);
		Review review=new Review(0, memberId, receiver, point, content);
		int result1=reviewService.reviewCheckEnd(review);
		messageService.messageReviewUpdate(messageNo);
		
		String msg="";
		String loc="/message/messageSelect.do?messageNo="+messageNo+"&memberId="+memberId;
		if(result1>0) {
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
	public ModelAndView reviewContentForm(ModelAndView mav,@RequestParam("memberId") String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range,HttpServletRequest request) {
		
		int listCnt = reviewService.reviewCnt(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("paging", paging);
		List<Review> reviewList=reviewService.reviewContentForm(map);
		
		mav.addObject("paging",paging);
		mav.addObject("reviewList",reviewList);
		mav.setViewName("review/reviewContentForm");
		return mav;
	}
	
	@RequestMapping("/reviewMannerForm.do")
	public ModelAndView reviewMannerForm(ModelAndView mav,@RequestParam("memberId") String memberId) {
		double q1=0.0,q2=0.0,q3=0.0,q4=0.0,q5=0.0,q6=0.0,q7=0.0;
		List<Double> reviewPoint=new ArrayList<>(); //각 지문의 평균점수 저장
		List<Review> reviewList=reviewService.reviewMannerForm(memberId);
		for(int i=0;i<reviewList.size();i++) {
			for(int j=0;j<reviewList.get(i).getReviewPoint().length;j++) {
				switch (j) {
				case 0:
					q1+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q1=Math.round((q1/(double)reviewList.size()*10))/10.0;
					
					}
					break;
				case 1:
					q2+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q2=Math.round((q2/(double)reviewList.size()*10))/10.0;
					}
					break;
				case 2:
					q3+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q3=Math.round((q3/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 3:
					q4+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q4=Math.round((q4/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 4:
					q5+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q5=Math.round((q5/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 5:
					q6+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q6=Math.round((q6/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 6:
					q7+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q7=Math.round((q7/(double)reviewList.size()*10))/10.0;
					}

					break;

				default:
					break;
				}
			}
		}
		reviewPoint.add(q1);
		reviewPoint.add(q2);
		reviewPoint.add(q3);
		reviewPoint.add(q4);
		reviewPoint.add(q5);
		reviewPoint.add(q6);
		reviewPoint.add(q7);
		mav.addObject("reviewSize",reviewList.size());
		mav.addObject("reviewPoint",reviewPoint);
		mav.setViewName("review/reviewMannerForm");
		return mav;
	}
	@RequestMapping("/reviewMemberContent.do")
	public ModelAndView reviewMemberContent(ModelAndView mav,@RequestParam("memberId") String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range,HttpServletRequest request) {
		
		int listCnt = reviewService.reviewCnt(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("paging", paging);
		List<Review> reviewList=reviewService.reviewContentForm(map);
		
		mav.addObject("memberId",memberId);
		mav.addObject("paging",paging);
		mav.addObject("reviewList",reviewList);
		mav.setViewName("review/reviewMemberContent");
		return mav;
	}
	
	@RequestMapping("/reviewMemberManner.do")
	public ModelAndView reviewMemberManner(ModelAndView mav,@RequestParam("memberId") String memberId) {
		double q1=0.0,q2=0.0,q3=0.0,q4=0.0,q5=0.0,q6=0.0,q7=0.0;
		List<Double> reviewPoint=new ArrayList<>(); //각 지문의 평균점수 저장
		List<Review> reviewList=reviewService.reviewMannerForm(memberId);
		for(int i=0;i<reviewList.size();i++) {
			for(int j=0;j<reviewList.get(i).getReviewPoint().length;j++) {
				switch (j) {
				case 0:
					q1+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q1=Math.round((q1/(double)reviewList.size()*10))/10.0;
					
					}
					break;
				case 1:
					q2+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q2=Math.round((q2/(double)reviewList.size()*10))/10.0;
					}
					break;
				case 2:
					q3+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q3=Math.round((q3/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 3:
					q4+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q4=Math.round((q4/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 4:
					q5+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q5=Math.round((q5/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 5:
					q6+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q6=Math.round((q6/(double)reviewList.size()*10))/10.0;
					}

					break;
				case 6:
					q7+=Integer.parseInt(reviewList.get(i).getReviewPoint()[j]);
					if(i==reviewList.size()-1) {
					q7=Math.round((q7/(double)reviewList.size()*10))/10.0;
					}

					break;

				default:
					break;
				}
			}
		}
		reviewPoint.add(q1);
		reviewPoint.add(q2);
		reviewPoint.add(q3);
		reviewPoint.add(q4);
		reviewPoint.add(q5);
		reviewPoint.add(q6);
		reviewPoint.add(q7);
		mav.addObject("memberId",memberId);
		mav.addObject("reviewSize",reviewList.size());
		mav.addObject("reviewPoint",reviewPoint);
		mav.setViewName("review/reviewMemberManner");
		return mav;
	}
}
