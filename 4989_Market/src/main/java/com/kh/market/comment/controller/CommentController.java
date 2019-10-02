package com.kh.market.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.kh.market.comment.model.service.CommentService;
import com.kh.market.comment.model.vo.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentService commentService;
	
	@ResponseBody
	@RequestMapping("/commentInsert")
	public Map<String, String> commentInsert( Comment comment){
		logger.info("comment={}", comment);
		int result = commentService.commentInsert(comment);
		
		Map<String, String> map = new HashMap<>();
		map.put("msg", result>0?"성공!":"실패");
		
		return map;
	}
	
	@ResponseBody
	@RequestMapping("/commentInsert2")
	public Map<String, String> commentInsert2(Comment comment){
		logger.info("comment2={}", comment);
		int result = commentService.commentInsert2(comment);
		Map<String, String> map = new HashMap<>();
		map.put("mag", result>0?"성공":"실패");
		return map;
	}
	
	@RequestMapping("/commentList")
	@ResponseBody
	public List<Comment> selectCommentList(@RequestParam("auctionNo") int auctionNo) {
		List<Comment> comment = commentService.selectCommentList(auctionNo);
		//if(comment == null) comment = new Comment();
		
		return comment;
	}
	
	@RequestMapping("/commentDelete")
	@ResponseBody
	public Map<String, String> commentDelete(@RequestParam(value="commentNo") int commentNo){
		int result = commentService.commentDelete(commentNo);
		logger.info("commentNO={}", commentNo);
		
		
		  Map<String, String> resultMap = new HashMap<String, String>();  
		
		  if(result>0) {
			  resultMap.put("msg", "성공"); 
		  }
		  else {
			  resultMap.put("msg","실패"); 
		  }
		 
		 
		
		//model.addAttribute("msg", result>0?"성곡적으로 삭제되었습니다.":"삭제가 실패하였습니다.");
		//model.addAttribute("loc", "/comment/commentDelete?commentNo="+commentNo);
		//model.addAttribute("loc", "/");
		return resultMap;
	}
	
}
