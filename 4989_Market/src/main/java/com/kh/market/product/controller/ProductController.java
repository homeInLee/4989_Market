package com.kh.market.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;

@Controller
public class ProductController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/productView.do")
	public String productView(Model model) {
		logger.info("실행완료");
		
		
		List<Product> plist = productService.productList();
		
		logger.debug("list의 값={}", plist);
		
		
		
		model.addAttribute("plist", plist);	
		
		return "/product/productView";
	}
	
	@RequestMapping("/productRegistration.do")
	public String productRegistration() {
		logger.debug("상품 등록하기 실행");
		return "/product/productRegistration";
	}
	
	@RequestMapping(value="/productRegistrationEnd.do", method=RequestMethod.GET)
	public String productRegistrationEnd(
										 @RequestParam String productWriter, 
										 @RequestParam String productTitle, Model model) {
		
		logger.info("asdsad 실행");
		model.addAttribute("헣허", "하하");
		return "/product/productRegistrationEnd";
	}
	
}
