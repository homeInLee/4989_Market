package com.kh.market.product.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.auction.model.service.AuctionService;
import com.kh.market.auction.model.vo.Auction;
import com.kh.market.common.util.HelloSpringUtils;
import com.kh.market.member.model.service.MemberService;
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
	
	@RequestMapping("/productList.do")
	public String productList(Model model) {
		
		
		List<Product> plist = productService.productList();
		List<Attachment> attachList = productService.attachList();
		
		
		
		logger.info("list의 값={}", plist);
		logger.info("attachList의 값={}", attachList);
		logger.info("attachList의 첫번째값={}", attachList.get(1));
		
		
		
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
		
		
//        List<MultipartFile> fileList = mtfRequest.getFiles("file");
//        String src = mtfRequest.getParameter("src");
//        System.out.println("src value : " + src);
//
//		String saveDirectory_
//		= mtfRequest.getSession()
//				 .getServletContext()
//				 .getRealPath("/resources/upload/product");
//
//        for (MultipartFile mf : fileList) {
//            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
//            long fileSize = mf.getSize(); // 파일 사이즈
//
//            System.out.println("originFileName : " + originFileName);
//            System.out.println("fileSize : " + fileSize);
//
//            String safeFile = saveDirectory_ + System.currentTimeMillis() + originFileName;
//            try {
//                mf.transferTo(new File(safeFile));
//            } catch (IllegalStateException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            } catch (IOException e) {
//                // TODO Auto-generated catch block
//                e.printStackTrace();
//            }
//        }


		
		
		
		
		
		
		
		
		
		
		
		
			
		
		logger.info("upFile.length={}",upFile.length);
		logger.info("upFile[0].name={}",upFile[0].getName());

		logger.info("upFile[0].originalFileName={}",upFile[0].getOriginalFilename());
		logger.info("upFile[0].originalFileName={}",upFile[1].getOriginalFilename());
		logger.info("upFile[0].originalFileName={}",upFile[2].getOriginalFilename());
		logger.info("upFile[0].size={}",upFile[0].getSize());

	
	
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
			pList.addAll(productService.productSearch(arr[i]));
			aList.addAll(auctionService.productSearch(arr[i]));
		}
//		List<Product> pList = new ArrayList<>(new TreeSet<>(List1));
//		List<Auction> aList = new ArrayList<>(new TreeSet<>(List2));
		
		model.addAttribute("pList", pList);
		model.addAttribute("aList", aList);
		return "/product/productSearchList";
	}
	@RequestMapping("/editAddress.do")
	public String editAddress() {
		
		return "/product/editAddress";
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
