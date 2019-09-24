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

	
}
