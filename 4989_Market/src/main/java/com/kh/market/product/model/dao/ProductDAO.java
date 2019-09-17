package com.kh.market.product.model.dao;

import java.util.List;

import com.kh.market.product.model.vo.Product;

public interface ProductDAO {

	List<Product> productList();

	int productRegistration(Product p);

	

}
