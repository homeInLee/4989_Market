package com.kh.market.comment.model.dao;

import java.util.List;

import com.kh.market.comment.model.vo.Comment;

public interface CommentDAO {

	int commentInsert(Comment comment);

	List<Comment> selectCommentList(int auctionNo);

	int commentDelete(int commentNo);


}
