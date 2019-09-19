package com.kh.market.basket.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.basket.model.service.BasketService;
import com.kh.market.product.model.vo.Product;

@Controller
@RequestMapping("/basket")
public class BasketController {

	@Autowired
	BasketService basketService;
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/basketView.do")
	public ModelAndView basketView(@RequestParam("memberId") String basketMemberId,ModelAndView mav) {
		List<Product> myBasketList=basketService.basketView(basketMemberId);
		
		mav.addObject("myBasketList",myBasketList);
		mav.setViewName("basket/basketView");
		return mav;
	}
}
