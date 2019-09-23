package com.kh.market.basket.controller;

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

import com.kh.market.basket.model.service.BasketService;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

@Controller
@RequestMapping("/basket")
public class BasketController {

	@Autowired
	BasketService basketService;

	private Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/basketView.do")
	public ModelAndView basketView(@RequestParam("memberId") String basketMemberId,ModelAndView mav,@RequestParam(value="cPage",defaultValue="1", required=false) int cPage,HttpServletRequest request) {

		Map<Object, Object> map=new HashMap<Object, Object>();
		map.put("basketMemberId", basketMemberId);
		map.put("cPage", cPage);

		List<Product> myBasketList=basketService.basketView(map);

		//2.2 전체게시글수, 전체페이지수 구하기
		List<Basket> basketListSize=basketService.totalBasketCount(basketMemberId);
		int totalBoardCount = basketListSize.size();

		//(공식2)전체페이지수 구하기
		int totalPage = (int)Math.ceil((double)totalBoardCount/BasketService.NUM_PER_PAGE);

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
			pageBar += "<a href='"+request.getContextPath()+"/basket/basketView.do?memberId="+basketMemberId+"&cPage="+(pageNo-1)+"'>[이전]</a> ";

		}

		// pageNo section
		// 보통 !(빠져나가는 조건식)으로 많이 쓴다.
		while(!(pageNo>pageEnd || pageNo > totalPage)){

			if(cPage == pageNo ){
				pageBar += "<span class='cPage'>"+pageNo+"</span> ";
			} 
			else {
				pageBar += "<a href='"+request.getContextPath()+"/basket/basketView.do?memberId="+basketMemberId+"&cPage="+pageNo+"'>"+pageNo+"</a> ";
			}
			pageNo++;
		}

		//[다음] section
		if(pageNo > totalPage){
			//pageBar += "<span>[다음]</span>";
		} else {
			pageBar += "<a href='"+request.getContextPath()+"/basket/basketView.do?memberId="+basketMemberId+"&cPage="+pageNo+"'>[다음]</a>";
		}

		mav.addObject("pageBar",pageBar);
		mav.addObject("myBasketList",myBasketList);
		mav.setViewName("basket/basketView");
		return mav;
	}
}
