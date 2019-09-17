package com.kh.market.product.model.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.product.model.dao.ProductDAO;
import com.kh.market.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;

	@Override
	public List<Product> productList() {
		// TODO Auto-generated method stub
		return productDAO.productList();
	}
}
