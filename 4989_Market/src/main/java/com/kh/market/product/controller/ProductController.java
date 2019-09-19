package com.kh.market.product.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Product;


@RequestMapping("/product")
@Controller
public class ProductController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService;
	
	
	@RequestMapping("/productList.do")
	public String productView(Model model) {
		
		
		List<Product> plist = productService.productList();
		
		logger.debug("list의 값={}", plist);
		
		
		
		model.addAttribute("plist", plist);	
		
		return "/product/productList";
	}
	
	@RequestMapping("/productRegistration.do")
	public String productRegistration() {
		logger.debug("상품 등록하기 실행");
		return "/product/productRegistration";
	}
	
	@RequestMapping(value="/productRegistrationEnd.do", method=RequestMethod.GET)
	public String productRegistrationEnd(
										 @RequestParam String productWriter, 
										 @RequestParam String productTitle, 
										 @RequestParam String productPrice, 
										 @RequestParam String content, 
										 Model model) {

		Product p = new Product();
		p.setSellTitle(productTitle);
		p.setSellWriter(productWriter);
		p.setSellPrice(Integer.parseInt(productPrice));
		p.setSellContent(content);
		
		int result = productService.productRegistration(p);
		
		
		model.addAttribute("msg", result>0?"물품 등록 성공":"물품등록 실패");
		model.addAttribute("loc", "/productView.do");
		
		return "common/msg";
	}
	@RequestMapping("/photo_upload.do")
	public void photoUpload() {
		logger.info("ajax 실행됨@controller");
		
	}
	
	@GetMapping("/productView.do")
	public String productSelectOne(@RequestParam String productNo, Model model) {
		logger.info(productNo);
		
		
		Product p = productService.productSelectOne(productNo);
		
		logger.info(p.toString());
		
		
		model.addAttribute("p", p);
		return "/product/productView";
		
	}
	
	
	@GetMapping("/productEdit.do")
	public String productEdit(@RequestParam String productNo, Model model)
	{
		
		logger.info("업데이트 컨트롤러에서 받은 값={}",productNo);
		Product p = productService.productSelectOne(productNo);
		model.addAttribute("p", p);
		return "/product/productEdit";
	}
	@GetMapping("/productEditEnd.do")
	public String productEditEnd(@RequestParam String productNo,
								 @RequestParam String productTitle,
								 @RequestParam String productContent,
								 @RequestParam String productState,
								 @RequestParam String productPrice,
								 Model model) {
	
		Product p = new Product();
		p.setSellNo(Integer.parseInt(productNo));
		p.setSellTitle(productTitle);
		p.setSellContent(productContent);
		p.setSellState(productState);
		p.setSellPrice(Integer.parseInt(productPrice));
		
		int result = productService.updateProduct(p);
		
		
	return "/product/productList";
	
	}

}