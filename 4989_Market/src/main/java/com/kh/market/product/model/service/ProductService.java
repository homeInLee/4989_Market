package com.kh.market.product.model.service;

import java.util.List;

import com.kh.market.product.model.vo.Product;

public interface ProductService {

	List<Product> productList();

	int productRegistration(Product p);

	Product productSelectOne(String productNo);

	int updateProduct(Product p);

	int productDelete(String productNo);

	List<Product> productSearch(String searchWord);



}
