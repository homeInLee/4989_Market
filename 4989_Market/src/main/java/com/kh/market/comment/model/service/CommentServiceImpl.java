package com.kh.market.comment.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.comment.model.dao.CommentDAO;

@Repository
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDAO commentDAO;

}
