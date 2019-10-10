package com.kh.market.auction.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.auction.model.exception.AuctionException;
import com.kh.market.auction.model.service.AuctionService;
import com.kh.market.auction.model.vo.Attachment;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.auction.model.vo.AuctionForList;
import com.kh.market.basket.model.service.BasketService;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.comment.model.service.CommentService;
import com.kh.market.common.model.vo.Paging;
import com.kh.market.common.util.HelloSpringUtils;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;
import com.kh.market.message.model.service.MessageService;
import com.kh.market.message.model.vo.Message;
import com.kh.market.product.model.vo.Product;
import com.kh.market.review.model.vo.Review;

@Controller
@RequestMapping("/auction")
@SessionAttributes("memberLoggedIn")
public class AuctionController {
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	MemberService memberService;
	
	@Autowired
	CommentService commentService;
	
	@Autowired
	BasketService basketService;
	
	@Autowired
	MessageService messageService;
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/auction.do")
	public String auctionMain(Model model) {
		
		List<Map<String,String>> auctionList = auctionService.auctionList();
		
		
		List<Map<String,String>> mainImage = auctionService.mainImage();
		

		model.addAttribute("auctionList",auctionList);
		model.addAttribute("mainImage", mainImage);
		
		logger.info("auctionList={}",auctionList);
		logger.info("mainImage={}",mainImage);
		
		return "auction/auction";
	}
	
	@RequestMapping("/auctionSelectOne.do")
	public String auctionSelectOne(Model model, 
			@RequestParam int auctionNo,@RequestParam("memberId") String memberId, 
			@RequestParam(value="decNo", defaultValue="0", required=false)int decNo){
		
		String boardName="A";
		//장바구니 여부 검사 코드
		Basket b=new Basket(auctionNo, memberId, boardName);
		Basket basket=basketService.basketCheck(b);
		//
		
		List<AuctionForList> auctionSelectOne = auctionService.auctionSelectOne(auctionNo);
		
		Member member = memberService.selectOneMember(auctionSelectOne.get(0).getAuctionWriter());
		
		/* Comment comment = commentService.commentSelectOne(auctionNo,"A"); */
		
		logger.info(auctionSelectOne.toString());
		model.addAttribute("decNo",decNo);
		model.addAttribute("basket",basket);
		model.addAttribute("auctionSelectOne",auctionSelectOne);
		model.addAttribute("member",member);
		
//		model.addAttribute("comment", comment);
		
		return "auction/auctionSelectOneView";
	}
	
	@RequestMapping("/auctionEnroll.do")
	public void auctionEnroll() {
		
		logger.info("경매 등록 확인");
	}
	
	@RequestMapping("/auctionEnrollEnd.do")
	public String boardFormEnd(@RequestParam("sido") String sido,@RequestParam("gugun") String gugun,@RequestParam("cate") String cate,@RequestParam("gory") String gory, Auction auction, MultipartFile[] upFile, Model model, HttpServletRequest request, @RequestParam("attachmentMainImage") String attachmentMainImage) {
		logger.info("경매 등록 요청!!");
		
		try {
		
		logger.info("auction={}", auction);
		logger.info("upFile={}", upFile);
		logger.info("upFile.length={}", upFile.length);
		logger.info("upFile[0].name={}", upFile[0].getName());
		logger.info("upFile[0].originalFileName={}", upFile[0].getOriginalFilename());
		logger.info("upFile[0].size={}", upFile[0].getSize());
		logger.info("upFile[1].name={}", upFile[1].getName());
		logger.info("upFile[1].originalFileName={}", upFile[1].getOriginalFilename());
		logger.info("upFile[1].size={}", upFile[1].getSize());
		
		//파일 업로드: 서버에 파일저장.
		String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/auction");
		
		//db에 파일 메타 정보
		List<Attachment> attachList = new ArrayList<>();
		
		//MultipartFile 다루기
		for(MultipartFile f : upFile) {
			//파일 유효성 검사
			if(!f.isEmpty()) {
				//renamedFileName
				String originalFileName = f.getOriginalFilename();
				String renamedFileName = HelloSpringUtils.getRenamedFileName(originalFileName);
				
				logger.info("오리지널파일네임={}", originalFileName);
				logger.info("리네임드파일네임={}", renamedFileName);
				
				try {
					//파일 실제 저장 코드
					f.transferTo(new File(saveDirectory+"/"+renamedFileName));
				} catch(Exception e) {
					e.printStackTrace();
				}
				
				//attachment vo객체 담기
				Attachment attach = new Attachment();
				attach.setOriginalfileName(originalFileName);
				attach.setRenamedfileName(renamedFileName);
				
				if(f.equals(upFile[0])) {
					attach.setAttachmentMainImage("Y");
				}
				else
					attach.setAttachmentMainImage("N");
				
				attach.setBoardName("A");
				attachList.add(attach);
				
				logger.info("attach={}", attach);
				logger.info("attachList={}", attachList);
				
			}
		}
		
		//업무로직 auction, Attachment 테이블에 데이터 저장
		auction.setAuctionCategory(cate+" "+gory);
		auction.setAuctionAddress(sido+" "+gugun);
		int result = auctionService.insertAuction(auction, attachList);
		System.out.println(result);
		String msg = result>0?"게시물 등록 성공~":"게시물 등록 실패!!";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/auction/auctionSelectOne.do?auctionNo="+auctionService.selectBoardNo());
		
		}catch(Exception e) {
			logger.error("게시물등록 오류!!!", e);
			
			throw new AuctionException("게시물등록 오류!@@",e);
		}
	
		return "common/msg";
	
	}
	
	@RequestMapping("/memberAuctionSellView.do")
	public ModelAndView memberAutionSellView(ModelAndView mav,@RequestParam("memberId") String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		String boardName="A";
		int listCnt = auctionService.auctionSellCnt(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("paging", paging);
		List<Auction> auctionList=auctionService.memberAutionSellView(map);
		List<Attachment> attachmentList=auctionService.auctionAttachment(boardName);
		
		mav.addObject("attachmentList",attachmentList);
		mav.addObject("auctionList",auctionList);
		mav.addObject("paging",paging);
		mav.setViewName("member/memberAuctionSellView");
		return mav;
	}
	
	@RequestMapping("/memberAuctionBuyView.do")
	public ModelAndView memberAuctionBuyView(ModelAndView mav,@RequestParam("memberId") String memberId, @RequestParam(required = false, defaultValue = "1") int page, @RequestParam(required = false, defaultValue = "1") int range) {
		String boardName="A";
		int listCnt = auctionService.auctionBuyCnt(memberId);
		Paging paging = new Paging();
		paging.pageInfo(page, range, listCnt);
		Map<String, Object> map = new HashMap<>();
		map.put("memberId", memberId);
		map.put("paging", paging);
		List<Auction> auctionList=auctionService.memberAuctionBuyView(map);
		List<Attachment> attachmentList=auctionService.auctionAttachment(boardName);
		
		mav.addObject("attachmentList",attachmentList);
		mav.addObject("auctionList",auctionList);
		mav.addObject("paging",paging);
		mav.setViewName("member/memberAuctionBuyView");
		return mav;
	}
	
	@RequestMapping("/ingPrice.do")
		public String ingPrice(@RequestParam("auctionNo") int auctionNo, 
								@RequestParam("auctionIngPrice") int auctionIngPrice, 
								@RequestParam("auctionBuyer") String auctionBuyer,
								@ModelAttribute("memberLoggedIn") Member memberLoggedIn) {
			Map<String, Object> ingMap = new HashMap<>();
			ingMap.put("auctionNo", auctionNo);
			ingMap.put("auctionIngPrice", auctionIngPrice);
			ingMap.put("auctionBuyer", auctionBuyer);
			
			int result = auctionService.ingPrice(ingMap);
		
		
			return "redirect:/auction/auctionSelectOne.do?auctionNo="+auctionNo+"&memberId="+memberLoggedIn.getMemberId();
		}
	
	@RequestMapping("/auctionComplete.do")
	public ModelAndView sellComplete(ModelAndView mav,@RequestParam("auctionNo") int auctionNo,@RequestParam("auctionWriter") String auctionWriter,@RequestParam("auctionBuyer") String auctionBuyer) {
		
		int result1=auctionService.auctionComplete(auctionNo);
		List<AuctionForList> a=auctionService.auctionSelectOne(auctionNo);
		Message m=new Message(0, auctionWriter+"님과의 거래가 완료되었습니다", auctionWriter, auctionBuyer, "구매물품 제목:"+a.get(0).getAuctionTitle()+",가격:"+a.get(0).getAuctionPrice(), null,"Y" ,null, null, null);
		int result2=messageService.messageReview(m);
	
		String msg="";
		String loc="/auction/memberAuctionSellView.do?memberId="+auctionWriter;
		
		int result3=basketService.basketAuctionCompleteDelete(auctionNo);
		
		if(result1>0&&result2>0&&result3>0) {
			msg="판매완료확정 성공";
			
		}else {
			msg="판매완료확정 실패";
		}
		mav.addObject("msg",msg);
		mav.addObject("loc",loc);
		mav.setViewName("common/msg");
		return mav;
	}
	@RequestMapping("/directPrice.do")
		public String directPrice(@RequestParam("auctionNo") int auctionNo, 
								@RequestParam("auctionDirectPrice") int auctionDirectPrice, 
								@RequestParam("auctionBuyer") String auctionBuyer,
								@ModelAttribute("memberLoggedIn") Member memberLoggedIn) {
		
			Map<String, Object> directMap = new HashMap<>();
			directMap.put("auctionNo", auctionNo);
			directMap.put("auctionDirectPrice", auctionDirectPrice);
			directMap.put("auctionBuyer", auctionBuyer);
			
			int result = auctionService.directPrice(directMap);
		
		return "redirect:/auction/auctionSelectOne.do?auctionNo="+auctionNo+"&memberId="+memberLoggedIn.getMemberId();
	}
	
	@RequestMapping("/updateAuction.do")
		public String updateAuction(@RequestParam("auctionNo") int auctionNo, Model model) {
			
			Auction updateAuction = auctionService.updateAuction(auctionNo);
			List<Map<String,String>> updateAttachment = auctionService.updateAttachment(auctionNo);
			
			int attachmentIndex = 5 - updateAttachment.size();
			
			model.addAttribute("updateAuction", updateAuction);
			model.addAttribute("updateAttachment", updateAttachment);
			model.addAttribute("attachmentIndex", attachmentIndex);
		
		return "auction/auctionUpdate";
	}
		
	
	
	
	
	
	
	
	
}
