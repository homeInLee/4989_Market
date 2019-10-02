package com.kh.market.comment.model.service;

import java.util.List;

import com.kh.market.comment.model.vo.Comment;

public interface CommentService {

	int commentInsert(Comment comment);

	List<Comment> selectCommentList(int auctionNo);

	int commentDelete(int commentNo);

	int commentInsert2(Comment comment);

}
