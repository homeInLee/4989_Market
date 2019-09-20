package com.kh.market.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.review.model.vo.Review;

public interface ReviewService {

	//페이지당 게시물수
	int NUM_PER_PAGE=6;
	
	int reviewCheckEnd(Review review);

	List<Review> reviewContentForm(Map<Object, Object> map);

	List<Review> reviewMannerForm(String memberId);

}
