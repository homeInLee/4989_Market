package com.kh.market.review.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.review.model.vo.Review;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int reviewCheckEnd(Review review) {
		
		return sqlSession.insert("review.reviewCheckEnd",review);
	}

	@Override
	public List<Review> reviewContentForm(String memberId) {
		
		return sqlSession.selectList("review.reviewContentForm",memberId);
	}
}
