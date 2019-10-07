package com.kh.market.comment.model.dao;

import java.util.List;

import com.kh.market.comment.model.vo.Comment;

public interface CommentDAO {

	int commentInsert(Comment comment);

	List<Comment> selectCommentList(int auctionNo);

	int commentDelete(int commentNo);

	int commentInsert2(Comment comment);

	//productrComment
	int commentProductInsert(Comment comment);

	int commentProductInsert2(Comment comment);

	List<Comment> commentProductList(int sellNo);

	int commentProductDelete(int commentNo);

}
