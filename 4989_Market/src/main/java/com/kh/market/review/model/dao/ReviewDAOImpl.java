package com.kh.market.review.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.review.model.service.ReviewService;
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
	public List<Review> reviewContentForm(Map<String, Object> map) {
		
		return sqlSession.selectList("review.reviewContentForm",map);
	}

	@Override
	public List<Review> reviewMannerForm(String memberId) {
		
		return sqlSession.selectList("review.reviewMannerForm",memberId);
	}

	@Override
	public int reivewCnt(String memberId) {
		return sqlSession.selectOne("review.reviewCnt",memberId);
	}
}
