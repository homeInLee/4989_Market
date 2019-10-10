package com.kh.market.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.auction.model.service.AuctionService;
import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.basket.model.service.BasketService;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.common.model.vo.Paging;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.product.model.service.ProductService;

import com.kh.market.product.model.vo.Product;

@RestController
@RequestMapping("/basket")
public class BasketController {

	@Autowired
	BasketService basketService;

	@Autowired
	ProductService productService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	AuctionService auctionService;
	private Logger logger = LoggerFactory.getLogger(getClass());

	@RequestMapping("/basketView.do")
	public ModelAndView basketView(@RequestParam("memberId") String basketMemberId,ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range,HttpServletRequest request) {
		String boardName="S";

		int basketListSize=basketService.totalBasketCount(basketMemberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, basketListSize);
		Map<String, Object> map = new HashMap<>();
		map.put("boardName", boardName);
		map.put("basketMemberId", basketMemberId);
		map.put("paging", paging);
		List<Product> myBasketList=basketService.basketView(map);
		List<Attachment> attachment=auctionService.auctionAttachment(boardName);
		System.out.println("attachment값은?"+attachment);
		//2.2 전체게시글수, 전체페이지수 구하기
		
		mav.addObject("attachment",attachment);
		mav.addObject("paging",paging);
		mav.addObject("myBasketList",myBasketList);
		mav.setViewName("basket/basketView");
		return mav;
	}
	
	@RequestMapping("/basketAuctionView.do")
	public ModelAndView basketAuctionView(@RequestParam("memberId") String basketMemberId,ModelAndView mav, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range,HttpServletRequest request) {
		String boardName="A";
		
		int listCnt=basketService.auctionBasketCnt(basketMemberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> map = new HashMap<>();
		map.put("boardName", boardName);
		map.put("basketMemberId", basketMemberId);
		map.put("paging", paging);		
		List<Auction> auctionList=basketService.basketAuctionView(map);
		List<Attachment> attachment=auctionService.auctionAttachment(boardName);
		System.out.println("attachment값은?"+attachment);
		
		mav.addObject("paging",paging);
		mav.addObject("attachment",attachment);
		mav.addObject("auctionList",auctionList);
		mav.setViewName("basket/basketAuctionView");
		return mav;
	}
	
//	@RequestMapping("/basketDetailView.do")
//	public ModelAndView basketDetailView(ModelAndView mav,@RequestParam("sellNo") int sellNo,@RequestParam("sellWriter") String sellWriter,@RequestParam("memberId") String memberId) {
//		Product p=productService.memberSellDetailView(sellNo);
//		Member member = memberService.selectOneMember(sellWriter);
//		
//		//장바구니 여부 검사 코드 (나중에 옮기자)
//		Basket b=new Basket(sellNo, memberId);
//		Basket basket=basketService.basketCheck(b);
//		
//		//
//		mav.addObject("basket",basket);
//		mav.addObject("p",p);
//		mav.addObject("member",member);
//		mav.setViewName("basket/basketDetailView");
//		return mav;
//
//	}
	
	@GetMapping("/basketInsert")
	public int basketInsert(@RequestParam("sellNo") int sellNo,@RequestParam("memberId") String memberId) {
		String boardName="S";		
		Basket b=new Basket(sellNo, memberId,boardName);
		int result=basketService.basketInsert(b);
		return result;
	}
	
	@GetMapping("/basketDelete")
	public int basketDelete(@RequestParam("sellNo") int sellNo,@RequestParam("memberId") String memberId) {
		String boardName="S";		
		Basket b=new Basket(sellNo, memberId,boardName);
		int result=basketService.basketDelete(b);
		return result;
	}
	
	@GetMapping("/basketAuctionInsert")
	public int basketAuctionInsert(@RequestParam("sellNo") int sellNo,@RequestParam("memberId") String memberId) {
		String boardName="A";		
		Basket b=new Basket(sellNo, memberId,boardName);
		int result=basketService.basketInsert(b);
		return result;
	}
	
	@GetMapping("/basketAuctionDelete")
	public int basketAuctionDelete(@RequestParam("sellNo") int sellNo,@RequestParam("memberId") String memberId) {
		String boardName="A";		
		Basket b=new Basket(sellNo, memberId,boardName);
		int result=basketService.basketDelete(b);
		return result;
	}
	
	@GetMapping("/basketSelectCnt")
	public int basketSelectCnt(@RequestParam("sellNo") int sellNo) {
		int result=0;
		List<Basket> b=basketService.basketSelectCnt(sellNo);
		
		if(b.size()!=0) {
			result=b.size();
		}
		return result;
	}
	@GetMapping("/basketSelectAuctionCnt")
	public int basketSelectAuctionCnt(@RequestParam("auctionNo") int auctionNo) {
		int result=0;
		List<Basket> b=basketService.basketSelectAuctionCnt(auctionNo);
		
		if(b.size()!=0) {
			result=b.size();
		}
		return result;
	}
}
