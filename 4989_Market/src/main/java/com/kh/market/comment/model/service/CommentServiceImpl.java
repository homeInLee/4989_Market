package com.kh.market.comment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.comment.model.dao.CommentDAO;
import com.kh.market.comment.model.vo.Comment;

@Repository
public class CommentServiceImpl implements CommentService {
	
	@Autowired
	CommentDAO commentDAO;

	@Override
	public int commentInsert(Comment comment) {
		return commentDAO.commentInsert(comment);
	}

}
