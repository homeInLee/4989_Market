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

import com.kh.market.review.model.service.ReviewService;
import com.kh.market.review.model.vo.Review;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	@Autowired
	ReviewService reviewService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/reviewMain.do")
	public ModelAndView reviewMain(@RequestParam String memberId,ModelAndView mav) {
		mav.setViewName("review/reviewMain");
		return mav;
	}
	
	@RequestMapping("/reviewCheckForm.do")
	public ModelAndView reviewCheckForm(ModelAndView mav) {
		mav.setViewName("review/reviewCheckForm");
		return mav;
	}
	
	@RequestMapping("/reviewCheckEnd.do")
	public ModelAndView reviewCheckEnd(ModelAndView mav,@RequestParam("checkList") ArrayList<String> checkList,@RequestParam("content") String content,@RequestParam("memberId") String memberId,@RequestParam("receiver") String receiver) {
		
		String[] point=checkList.toArray(new String[checkList.size()]);
		Review review=new Review(0, memberId, receiver, point, content);
		int result=reviewService.reviewCheckEnd(review);
		
		String msg="";
		String loc="/";
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
	public ModelAndView reviewContentForm(ModelAndView mav,@RequestParam("memberId") String memberId,@RequestParam(value="cPage",defaultValue="1", required=false) int cPage,HttpServletRequest request) {
		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("memberId", memberId);
		map.put("cPage", cPage);
		
		List<Review> reviewList=reviewService.reviewContentForm(map);
		
		//2.2 전체게시글수, 전체페이지수 구하기
		List<Review> reviewListSize=reviewService.reviewMannerForm(memberId);
		int totalBoardCount = reviewListSize.size();
		
		//(공식2)전체페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalBoardCount/ReviewService.NUM_PER_PAGE);
				
		//2.3 페이지바구성
		String pageBar = "";	
		int pageBarSize = 5;
		//(공식3)시작페이지 번호 세팅
		//cPage=5,pageBarSize=5 -> 1
		//cPage=6,pageBarSize=5 -> 6
		int pageStart = ((cPage - 1)/pageBarSize) * pageBarSize +1;
		//종료페이지 번호 세팅
		int pageEnd = pageStart+pageBarSize-1;
		int pageNo = pageStart;
				
		//[이전] section
		if(pageNo == 1 ){
			//pageBar += "<span>[이전]</span>"; 
		}
		else {
			pageBar += "<a href='"+request.getContextPath()+"/review/reviewContentForm.do?memberId="+memberId+"&cPage="+(pageNo-1)+"'>[이전]</a> ";
			
		}
					
		// pageNo section
		// 보통 !(빠져나가는 조건식)으로 많이 쓴다.
		while(!(pageNo>pageEnd || pageNo > totalPage)){
					
		if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
		} 
		else {
				pageBar += "<a href='"+request.getContextPath()+"/review/reviewContentForm.do?memberId="+memberId+"&cPage="+pageNo+"'>"+pageNo+"</a> ";
		}
				pageNo++;
		}
				
		//[다음] section
		if(pageNo > totalPage){
			//pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='"+request.getContextPath()+"/review/reviewContentForm.do?memberId="+memberId+"&cPage="+pageNo+"'>[다음]</a>";
		}
		
		mav.addObject("pageBar",pageBar);
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
}
