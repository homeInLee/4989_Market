package com.kh.market.review.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.review.model.vo.Review;

public interface ReviewService {

	int reviewCheckEnd(Review review);

	List<Review> reviewContentForm(String memberId);

}
