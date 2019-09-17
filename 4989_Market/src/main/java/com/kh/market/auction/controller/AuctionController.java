package com.kh.market.auction.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.market.auction.model.service.AuctionService;

@Controller
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/auction.do")
	public String auctionMain(Model model) {
		
		List<Map<String,String>> auctionList = auctionService.auctionList();

		logger.info("경매="+auctionList.size());
		
		model.addAttribute("auctionList",auctionList);
		
		return "auction/auction";
	}
	

}
