package com.kh.market.basket.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.basket.model.dao.BasketDAO;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDAO basketDAO;

	@Override
	public List<Product> basketView(Map<Object, Object> map) {
		
		return basketDAO.basketView(map);
	}

	@Override
	public List<Basket> totalBasketCount(String basketMemberId) {
		
		return basketDAO.totalBasketCount(basketMemberId);
	}
}
