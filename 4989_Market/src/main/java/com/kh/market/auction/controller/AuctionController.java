package com.kh.market.auction.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
import com.kh.market.comment.model.service.CommentService;
import com.kh.market.common.util.HelloSpringUtils;
import com.kh.market.member.model.service.MemberService;
import com.kh.market.member.model.vo.Member;

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
	public String auctionSelectOne(Model model, @RequestParam int auctionNo ) {
		
		List<AuctionForList> auctionSelectOne = auctionService.auctionSelectOne(auctionNo);
		
		Member member = memberService.selectOneMember(auctionSelectOne.get(0).getAuctionWriter());
		
		/* Comment comment = commentService.commentSelectOne(auctionNo,"A"); */
		
		logger.info(auctionSelectOne.toString());
		
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
	public String boardFormEnd(Auction auction, MultipartFile[] upFile, Model model, HttpServletRequest request, @RequestParam("attachmentMainImage") String attachmentMainImage) {
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
	public ModelAndView memberAutionSellView(ModelAndView mav,@RequestParam("memberId") String memberId) {
		mav.setViewName("member/memberAutionSellView");
		return mav;
	}
}
