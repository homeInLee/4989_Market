package com.kh.market.comment.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.market.comment.model.service.CommentService;
import com.kh.market.comment.model.vo.Comment;

@Controller
@RequestMapping("/comment")
public class CommentController {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	CommentService commentService;
	
	@RequestMapping("/commentInser.do")
	@ResponseBody
	public String commentInset(@ModelAttribute("Comment") Comment comment, HttpServletRequest request) {
		
		
		return "success";
	}

}
