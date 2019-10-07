package com.kh.market.comment.model.service;

import java.util.List;

import com.kh.market.comment.model.vo.Comment;

public interface CommentService {

	int commentInsert(Comment comment);

	List<Comment> selectCommentList(int auctionNo);

	int commentDelete(int commentNo);

	int commentInsert2(Comment comment);

	//productComment
	int commentProductInsert(Comment comment);

	int commentProductInsert2(Comment comment);

	List<Comment> commentProductList(int sellNo);

	int commentProductDelete(int commentNo);

}
