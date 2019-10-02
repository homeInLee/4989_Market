package com.kh.market.comment.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.kh.market.comment.model.dao.CommentDAO;
import com.kh.market.comment.model.vo.Comment;

@Repository
public class CommentServiceImpl implements CommentService {

	@Autowired
	CommentDAO commentDAO;

	@Override
	@Transactional
	public int commentInsert(Comment comment) {
//		int result = commentDAO.commentInsert(comment);
//		if(result > 0) {
//			commentDAO.messageInsert(commemt);
//		}
//		return result;
		return commentDAO.commentInsert(comment);
	}

	@Override
	public List<Comment> selectCommentList(int auctionNo) {
		return commentDAO.selectCommentList(auctionNo);
	}

	@Override
	public int commentDelete(int commentNo) {
		return commentDAO.commentDelete(commentNo);
	}

	@Override
	public int commentInsert2(Comment comment) {
		return commentDAO.commentInsert2(comment);
	}

}
