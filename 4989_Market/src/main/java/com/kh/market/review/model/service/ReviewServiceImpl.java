package com.kh.market.review.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.review.model.dao.ReviewDAO;
import com.kh.market.review.model.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	ReviewDAO reviewDAO;

	@Override
	public int reviewCheckEnd(Review review) {
		
		return reviewDAO.reviewCheckEnd(review);
	}

	@Override
	public List<Review> reviewContentForm(Map<String, Object> map) {
		
		return reviewDAO.reviewContentForm(map);
	}

	@Override
	public List<Review> reviewMannerForm(String memberId) {
		
		return reviewDAO.reviewMannerForm(memberId);
	}

	@Override
	public int reviewCnt(String memberId) {
		return reviewDAO.reivewCnt(memberId);
	}
}
