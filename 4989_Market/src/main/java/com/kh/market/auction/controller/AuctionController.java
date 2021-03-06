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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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

import oracle.net.aso.a;

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
	public String auctionMain(Model model,@RequestParam(value="auctionCategory",required=false,defaultValue="") String auctionCategory) {
		
		List<Map<String,String>> auctionList = auctionService.auctionList(auctionCategory);
		
		
		List<Map<String,String>> mainImage = auctionService.mainImage();
		
		logger.info("auctionCategory="+auctionCategory);
		model.addAttribute("auctionList",auctionList);
		model.addAttribute("mainImage", mainImage);
		

		
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

	public String boardFormEnd(@RequestParam("sido") String sido,@RequestParam("gugun") String gugun,@RequestParam("cate") String cate,@RequestParam("gory") String gory, Auction auction, MultipartFile[] upFile, Model model, HttpServletRequest request, @RequestParam("attachmentMainImage") String attachmentMainImage, @ModelAttribute("memberLoggedIn") Member memberLoggedIn) {
		logger.info("경매 등록 요청!!");
		
		try {
		
//		logger.info("auction={}", auction);
//		logger.info("upFile={}", upFile);
//		logger.info("upFile.length={}", upFile.length);
//		logger.info("upFile[0].name={}", upFile[0].getName());
//		logger.info("upFile[0].originalFileName={}", upFile[0].getOriginalFilename());
//		logger.info("upFile[0].size={}", upFile[0].getSize());
//		logger.info("upFile[1].name={}", upFile[1].getName());
//		logger.info("upFile[1].originalFileName={}", upFile[1].getOriginalFilename());
//		logger.info("upFile[1].size={}", upFile[1].getSize());
//		
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
		model.addAttribute("loc","/auction/auctionSelectOne.do?auctionNo="+auctionService.selectBoardNo()+"&memberId="+memberLoggedIn.getMemberId());
		
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
		paging.setListSize(8);
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
		paging.setListSize(8);
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
								@RequestParam("auctionWriter") String auctionWriter,
								@ModelAttribute("memberLoggedIn") Member memberLoggedIn,
								@RequestParam("auctionTitle") String auctionTitle) {
			Map<String, Object> ingMap = new HashMap<>();
			ingMap.put("auctionNo", auctionNo);
			ingMap.put("auctionIngPrice", auctionIngPrice);
			ingMap.put("auctionBuyer", auctionBuyer);
			
			Message message = new Message();
			message.setMessageTitle(auctionTitle +"의 입찰건이 있습니다.");
			message.setMessageWriter(memberLoggedIn.getMemberId());
			message.setMessageReciver(auctionWriter);
			message.setMessageContent(auctionBuyer+"님이 "+ auctionTitle +"을/를 "+auctionIngPrice+"원에 입찰 하셨습니다.\n");
			messageService.insertMessage(message);
			
			int result = auctionService.ingPrice(ingMap);
		
		
			return "redirect:/auction/auctionSelectOne.do?auctionNo="+auctionNo+"&memberId="+memberLoggedIn.getMemberId();
		}
	
	@RequestMapping("/auctionComplete.do")
	public ModelAndView sellComplete(ModelAndView mav,@RequestParam("auctionNo") int auctionNo,@RequestParam("auctionWriter") String auctionWriter,@RequestParam("auctionBuyer") String auctionBuyer) {
		
		int result1=auctionService.auctionComplete(auctionNo);
		List<AuctionForList> a=auctionService.auctionSelectOne(auctionNo);
		Message m=new Message(0, "("+a.get(0).getAuctionTitle()+")물품 거래 완료", auctionWriter, auctionBuyer, "물품 제목:"+a.get(0).getAuctionTitle()+" / 가격:"+a.get(0).getAuctionPrice()+"원", null,"Y" ,null, null, null);
		int result2=messageService.messageReview(m);
	
		String msg="";
		String loc="/auction/memberAuctionSellView.do?memberId="+auctionWriter;
		
		basketService.basketAuctionCompleteDelete(auctionNo);
		
		if(result1>0&&result2>0) {
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
								@RequestParam("auctionWriter") String auctionWriter,
								@ModelAttribute("memberLoggedIn") Member memberLoggedIn,
								@RequestParam("auctionTitle") String auctionTitle) {
		
			Map<String, Object> directMap = new HashMap<>();
			directMap.put("auctionNo", auctionNo);
			directMap.put("auctionDirectPrice", auctionDirectPrice);
			directMap.put("auctionBuyer", auctionBuyer);
			
			int result = auctionService.directPrice(directMap);
			
			Message message = new Message();
			message.setMessageTitle(auctionTitle +"을/를 즉시구매 되었습니다.");
			message.setMessageWriter("admin");
			message.setMessageReciver(auctionWriter);
			message.setMessageContent(auctionBuyer+"님이 "+ auctionTitle +"을/를 즉시구매 하셨습니다.\n"
									+ "경매 물품 거래를 준비해 주세요.");
			messageService.insertMessage(message);
		
		return "redirect:/auction/auctionSelectOne.do?auctionNo="+auctionNo+"&memberId="+memberLoggedIn.getMemberId();
	}
	
	@ResponseBody
	@PostMapping("/moreResult.do")
	public Map<String, Object> moreResult(@RequestParam String startCount,
										  @RequestParam String endCount
										  ){
		Map<String, Integer> pageMap = new HashMap<>();

		pageMap.put("startCount", Integer.parseInt(startCount));
		pageMap.put("endCount", Integer.parseInt(endCount));
		List<Auction> auctionList = auctionService.moreResult(pageMap);
		
		
		
		List<Attachment> attachList = auctionService.moreAttach();

		logger.info("불러온 사진 파일 null?={}", attachList.isEmpty());
		logger.info("attachList={}",attachList);
		System.out.println("["+attachList+"]");
		
		
		Map<String, Object> returnVal = new HashMap<>();
		returnVal.put("aList", auctionList);
		returnVal.put("attachList", attachList);
		return returnVal;
	}
	@RequestMapping("/updateAuction.do")
		public String updateAuction(@RequestParam("auctionNo") int auctionNo, Model model) {
			
			Auction updateAuction = auctionService.updateAuction(auctionNo);
			List<Map<String,String>> updateAttachment = auctionService.updateAttachment(auctionNo);
			
			int attachmentSize = updateAttachment.size();
			int attachmentIndex = 5 - updateAttachment.size();
			
			model.addAttribute("updateAuction", updateAuction);
			model.addAttribute("updateAttachment", updateAttachment);
			model.addAttribute("attachmentIndex", attachmentIndex);
			model.addAttribute("attachmentSize", attachmentSize);
		
		return "auction/auctionUpdate";
	}
	@RequestMapping("/auctionUpdateEnd.do")
	public String auctionUpdateEnd(Auction auction, MultipartFile[] upFile, Model model, HttpServletRequest request,@ModelAttribute("memberLoggedIn") Member memberLoggedIn) {
		logger.info("경매 수정 요청!!");
		
		try {
		
//		logger.info("auction={}", auction);
//		logger.info("upFile={}", upFile);
//		logger.info("upFile.length={}", upFile.length);
//		logger.info("upFile[0].name={}", upFile[0].getName());
//		logger.info("upFile[0].originalFileName={}", upFile[0].getOriginalFilename());
//		logger.info("upFile[0].size={}", upFile[0].getSize());
//		logger.info("upFile[1].name={}", upFile[1].getName());
//		logger.info("upFile[1].originalFileName={}", upFile[1].getOriginalFilename());
//		logger.info("upFile[1].size={}", upFile[1].getSize());
//		
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
				attach.setBoardNo(auction.getAuctionNo());
				
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
		int result = auctionService.updateAuctionEnd(auction, attachList);
		System.out.println(result);
		String msg = result>0?"게시물 수정 성공~":"게시물 수정 실패!!";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/auction/auctionSelectOne.do?auctionNo="+auction.getAuctionNo()+"&memberId="+memberLoggedIn.getMemberId());
		
		}catch(Exception e) {
			logger.error("게시물 수정 오류!!!", e);
			
			throw new AuctionException("게시물 수정 오류!@@",e);
		}
		
		
		
	
		return "common/msg";
	
	}
	
	@RequestMapping("/deleteAuction.do")
	public String deleteAuction(@RequestParam("auctionNo") int auctionNo, Model model) {
		
		int deleteAuction = auctionService.deleteAuction(auctionNo);
		
		
		String msg = deleteAuction>0?"게시물 삭제 성공":"게시물 삭제 실패!!";
		
		model.addAttribute("msg",msg);
		model.addAttribute("loc","/auction/auction.do");
		
		return "common/msg";
		
	}
	
	
	
	
	
}
