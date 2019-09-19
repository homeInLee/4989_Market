package com.kh.market.basket.model.dao;

import java.util.List;

import com.kh.market.product.model.vo.Product;

public interface BasketDAO {

	List<Product> basketView(String basketMemberId);

}
