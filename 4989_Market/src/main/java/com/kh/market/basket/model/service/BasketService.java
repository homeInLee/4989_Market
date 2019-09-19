package com.kh.market.basket.model.service;

import java.util.List;

import com.kh.market.product.model.vo.Product;

public interface BasketService {

	List<Product> basketView(String basketMemberId);

}
