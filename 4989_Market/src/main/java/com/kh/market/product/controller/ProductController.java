package com.kh.market.product.controller;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeSet;
import java.util.stream.Collectors;

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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.auction.model.service.AuctionService;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.common.util.HelloSpringUtils;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.message.model.service.MessageService;
import com.kh.market.message.model.vo.Message;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Product;



@RequestMapping("/product")
@Controller
public class ProductController {

	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService;
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	MessageService messageService;
	@RequestMapping("/productList.do")
	public String productList(Model model) {
		
		
		List<Product> plist = productService.productList();
		List<Attachment> attachList = productService.attachList();
		
		Map<List<Product>, List<Attachment>> map = new HashMap<>();
		
		map.put(plist, attachList);

		
		

//		logger.info("attachList = {}",attachList);
//		logger.info("plist = {}", plist);

		
		model.addAttribute("attachList", attachList);
		model.addAttribute("plist", plist);	
		
		return "/product/productList";
	}
	
	@RequestMapping("/productRegistration.do")
	public String productRegistration() {
		logger.debug("상품 등록하기 실행");
		return "/product/productRegistration";
	}
	
	@RequestMapping(value="/productRegistrationEnd.do", method=RequestMethod.POST)
	public String productRegistrationEnd(
										 @RequestParam String productWriter, 
										 @RequestParam String productTitle, 
										 @RequestParam String productPrice, 
										 @RequestParam String content, 
										 @RequestParam String address,
										 Model model,
										 MultipartFile[] upFile,
										 MultipartHttpServletRequest mtfRequest
										) {

		
		
		
		


	
	
		//파일업로드:서버에 파일저장
		String saveDirectory
			= mtfRequest.getSession()
					 .getServletContext()
					 .getRealPath("/resources/upload/product");
		logger.info("파일 저장 경로:={}", saveDirectory);
		
		//db에 파일 메타정보
		List<Attachment> attachList = new ArrayList<>();
		
		//MultipartFile 다루기
		logger.info("upFile.toString={}",upFile.toString());
		
		for(MultipartFile f : upFile) {

			//파일 유효성 검사
			if(!f.isEmpty()) {
				//renamedFileName
				String originalFileName = f.getOriginalFilename();
				String renamedFileName = HelloSpringUtils.getRenamedFileName(originalFileName);

				try {
					//파일 실제 저장
					f.transferTo(new File(saveDirectory+"/"+renamedFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				//attachment vo객체 담기

				
				
				
				Attachment attach = new Attachment();
				attach.setOriginalfileName(originalFileName);
				attach.setRenamedfileName(renamedFileName);
				if (f.equals(upFile[0])) {
					attach.setAttachmentMainImage("Y");
					logger.info("현재 파일은 첫번째 파일  ori: {} 입니다.",originalFileName);
					logger.info("현재 파일은 첫번째 파일 rename: {} 입니다.",renamedFileName);
				}
				attachList.add(attach);
				logger.info("attachList={}", attachList.toString());
			}
			
		}

		
		
		
		
				
		Product p = new Product();
		p.setSellTitle(productTitle);
		p.setSellWriter(productWriter);

		p.setSellPrice(Integer.parseInt(productPrice));
		p.setSellContent(content);
		p.setSellAddress(address);
		int result = productService.productRegistration(p, attachList);
		
		
		model.addAttribute("msg", result>0?"물품 등록 성공":"물품등록 실패");
		model.addAttribute("loc", "/product/productList.do");
		
		return "common/msg";


	}

	
	@GetMapping("/productView.do")
	public String productSelectOne(@RequestParam String productNo, Model model) {
		logger.info(productNo);
		
		
		Product p = productService.productSelectOne(productNo);
		
		List<Attachment> attach = productService.attachSelectOne(productNo);

		logger.info("게시글 하나에 가져온 첨부파일{}",attach.get(0).getOriginalfileName());
		logger.info("게시글 하나에 가져온 첨부파일{}",attach.get(1).getOriginalfileName());
		logger.info("게시글 하나에 가져온 첨부파일{}",attach.get(2).getOriginalfileName());
		
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
	@PostMapping("/productEditEnd.do")
	public String productEditEnd(@RequestParam String productNo,
								 @RequestParam String productTitle,
								 @RequestParam String productContent,
								 @RequestParam String productPrice,
								 Model model) {
	
		Product p = new Product();
		p.setSellNo(Integer.parseInt(productNo));
		p.setSellTitle(productTitle);
		p.setSellContent(productContent);
		p.setSellPrice(Integer.parseInt(productPrice));
		
		int result = productService.updateProduct(p);
		
		
		model.addAttribute("msg", result>0?"수정 성공":"수정 실패");
		model.addAttribute("loc", "/product/productView.do?productNo="+productNo);
		
		return "redirect:productView.do?productNo="+productNo;
		
		
	
	}
	@RequestMapping("/productDelete.do")
	public String productDelete(@RequestParam String productNo, Model model) {
		
		int result = productService.productDelete(productNo);
		
		
		model.addAttribute("msg", result>0?"삭제 성공":"삭제 실패");
		model.addAttribute("loc", "/product/productList.do");
		
		return "common/msg";
		

	}
	@RequestMapping(value="/productSearch.do", method=RequestMethod.GET)
	public String productSearch(@RequestParam String searchWord, Model model) {
		logger.info("searchWord="+searchWord);
		List<Product> pList = productService.productSearch(searchWord);
		List<Auction> aList = auctionService.productSearch(searchWord);
		String[] arr = searchWord.split("\\s");
		for(int i=0; i<arr.length; i++) {
			List<Product> List1 = productService.productSearch(arr[i]);
			List<Auction> List2 = auctionService.productSearch(arr[i]);
			logger.info("pList="+pList);
			logger.info("aList="+aList);
			logger.info("List1="+List1);
			logger.info("List2="+List2);
	        for(int y=0; y<List1.size(); y++) {
	        	if(!pList.contains(List1.get(y))) {
	        		System.out.println(pList.contains(List1.get(y)));
	        		pList.add(List1.get(y));
	        		logger.info("List1.get(y)"+List1.get(y));
	        	}
	        }
	        for(int z=0; z<List2.size(); z++) {
	        	if(!aList.contains(List2.get(z))) {
	        		aList.add(List2.get(z));
	        		logger.info("List2.getzy)"+List2.get(z));
	        	}
	        }
		}
		logger.info("pList="+pList);
		logger.info("aList="+aList);
		model.addAttribute("pList", pList);
		model.addAttribute("aList", aList);
		return "/product/productSearchList";
	}
	@RequestMapping("/editAddress.do")
	public String editAddress() {
		
		return "/product/editAddress";
	}
	
	@RequestMapping("/memberSellView.do")
	public ModelAndView memberSellView(@RequestParam String memberId,ModelAndView mav) {
		
		List<Product> list=productService.memberSellView(memberId);
		mav.addObject("list",list);
		mav.setViewName("member/memberSellView");
		return mav;
	}
	
	@RequestMapping("/memberSellDetailView.do")
	public ModelAndView memberSellDetailView(@RequestParam("sellNo") int sellNo,ModelAndView mav,@RequestParam("memberId") String memberId) {
		
		Product p=productService.memberSellDetailView(sellNo);
		Member member = memberService.selectOneMember(memberId);
		
		mav.addObject("p",p);
		mav.addObject("member",member);
		mav.setViewName("member/memberSellDetailView");
		return mav;
	}
	
	@RequestMapping("/sellComplete.do")
	public ModelAndView sellComplete(ModelAndView mav,@RequestParam("sellNo") int sellNo,@RequestParam("sellWriter") String sellWriter,@RequestParam("sellBuyer") String sellBuyer) {
		int result1=productService.sellComplete(sellNo);
		Product p=productService.memberSellDetailView(sellNo);
		Message m=new Message(0, sellWriter+"님과의 거래가 완료되었습니다", sellWriter, sellBuyer, "구매물품 제목:"+p.getSellTitle()+",가격:"+p.getSellPrice(), null,"Y" ,null, null, null);
		int result2=messageService.messageReview(m);
		
		String msg="";
		String loc="";
		if(result1>0&&result2>0) {
			msg="판매완료확정 성공";
			loc="/product/memberSellView.do?memberId="+sellWriter;
		}else {
			msg="판매완료확정 실패";
			loc="/product/memberSellDetailView.do?sellNo="+sellNo+"&memberId="+sellWriter;
		}
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
	
	@RequestMapping("/memberbuyView.do")
	public ModelAndView memberbuyView(ModelAndView mav,@RequestParam("memberId") String memberId) {

		List<Product> list=productService.memberBuyView(memberId);
		mav.addObject("list",list);
		mav.setViewName("member/memberBuyView");
		return mav;
	}
	
	@RequestMapping("/memberBuyDetailView.do")
	public ModelAndView memberBuyDetailView(@RequestParam("sellNo") int sellNo,ModelAndView mav,@RequestParam("sellWriter") String sellWriter) {
		
		Product p=productService.memberSellDetailView(sellNo);
		Member member = memberService.selectOneMember(sellWriter);
		
		mav.addObject("p",p);
		mav.addObject("member",member);
		mav.setViewName("member/memberBuyDetailView");
		return mav;
		
	}
	@RequestMapping("/ajaxUpload.do")
	public String ajaxUpload() {
		
		return "/product/ajaxUpload";
	}
	
	
	
	
	
	
	@RequestMapping(value = "/progress2")
	public ModelAndView progress2(Model model) {
		ModelAndView mv = new ModelAndView("/test/progress2");
		return mv;
	}

	@RequestMapping("/fileUpload")
	public String fileUpload(MultipartHttpServletRequest multipartHttpServletRequest) throws IOException {
		//파일경로
		String filePath ="D:\\Upload\\";
		
		//파일들을 List형식으로 보관
		List<MultipartFile> files = multipartHttpServletRequest.getFiles("files");
		
		File file = new File(filePath);
		//파일이 없다면 디렉토리를 생성
		if (file.exists() == false) {
			file.mkdirs();
		}
		
		for (int i = 0; i < files.size(); i++) {
			System.out.println(files.get(i).getOriginalFilename() +" 업로드");
			//파일 업로드 소스 여기에 삽입
			file = new File(filePath+files.get(i).getOriginalFilename());
			files.get(i).transferTo(file);	
		}
		
	return "redirect:/";
	}


}
