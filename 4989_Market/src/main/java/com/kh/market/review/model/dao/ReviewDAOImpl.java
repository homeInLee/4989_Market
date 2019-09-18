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
	public List<Review> reviewContentForm(Map<Object, Object> map) {
		int cPage=(int)map.get("cPage");
		int offset = (cPage-1)*ReviewService.NUM_PER_PAGE;
		int limit = ReviewService.NUM_PER_PAGE;
		RowBounds rowBounds=new RowBounds(offset, limit);
		
		return sqlSession.selectList("review.reviewContentForm",map,rowBounds);
	}

	@Override
	public List<Review> reviewMannerForm(String memberId) {
		
		return sqlSession.selectList("review.reviewMannerForm",memberId);
	}
}
