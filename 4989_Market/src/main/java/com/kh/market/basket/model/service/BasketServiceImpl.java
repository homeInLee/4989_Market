package com.kh.market.basket.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.basket.model.dao.BasketDAO;
import com.kh.market.product.model.vo.Product;

@Service
public class BasketServiceImpl implements BasketService {

	@Autowired
	BasketDAO basketDAO;

	@Override
	public List<Product> basketView(String basketMemberId) {
		
		return basketDAO.basketView(basketMemberId);
	}
}
