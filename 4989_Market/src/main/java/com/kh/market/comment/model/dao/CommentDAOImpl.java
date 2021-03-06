package com.kh.market.comment.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.comment.model.vo.Comment;

@Repository
public class CommentDAOImpl implements CommentDAO {
	
	@Autowired
	SqlSessionTemplate session;

	@Override
	public int commentInsert(Comment comment) {
		return session.insert("comment.commentInsert", comment);
	}

	@Override
	public List<Comment> selectCommentList(int auctionNo) {
		return session.selectList("comment.selectCommentList", auctionNo);
	}

	@Override
	public int commentDelete(int commentNo) {
		return session.update("comment.commentDelete", commentNo);
	}

	@Override
	public int commentInsert2(Comment comment) {
		return session.insert("comment.commentInsert2", comment);
	}

	//productComment
	@Override
	public int commentProductInsert(Comment comment) {
		return session.insert("comment.commentProductInsert", comment);
	}

	@Override
	public int commentProductInsert2(Comment comment) {
		return session.insert("comment.commentProductInsert2", comment);
	}

	@Override
	public List<Comment> commentProductList(int sellNo) {
		return session.selectList("comment.commentProductList", sellNo);
	}

	@Override
	public int commentProductDelete(int commentNo) {
		return session.update("comment.commentProductDelete", commentNo);
	}
	
	//messageInsert
	//session.insert("message.messageInsert");

	
}
