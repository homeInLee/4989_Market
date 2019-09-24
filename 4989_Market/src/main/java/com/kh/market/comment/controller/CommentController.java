package com.kh.market.comment.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	
}
