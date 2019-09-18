package com.kh.market.auction.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.market.auction.model.service.AuctionService;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	MemberService memberService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/auction.do")
	public String auctionMain(Model model) {
		
		List<Map<String,String>> auctionList = auctionService.auctionList();

		model.addAttribute("auctionList",auctionList);
		
		return "auction/auction";
	}
	
	@RequestMapping("/auctionSelectOne.do")
	public String auctionSelectOne(Model model, @RequestParam int auctionNo) {
		Auction auctionSelectOne = auctionService.auctionSelectOne(auctionNo);
		
		Member member = memberService.selectOneMember(auctionSelectOne.getAuctionWriter());
		
		logger.info(auctionSelectOne.toString());
		
		model.addAttribute("auctionSelectOne",auctionSelectOne);
		model.addAttribute("member",member);
		
		return "auction/auctionSelectOneView";
	}
	

}
