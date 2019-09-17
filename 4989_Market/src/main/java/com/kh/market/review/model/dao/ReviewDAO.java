package com.kh.market.review.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.review.model.vo.Review;

public interface ReviewDAO {

	int reviewCheckEnd(Review review);

	List<Review> reviewContentForm(String memberId);

}
