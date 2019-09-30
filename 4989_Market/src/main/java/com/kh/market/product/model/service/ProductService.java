package com.kh.market.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Product;

public interface ProductService {

	//페이지당 게시물수
	int NUM_PER_PAGE=8;
	
	List<Product> productList();

	int productRegistration(Product p, List<Attachment> attachList);

	Product productSelectOne(String productNo);

	int updateProduct(Product p);

	int productDelete(String productNo);

	List<Product> productSearch(String searchWord);

	List<Product> memberSellView(Map<Object, Object> map);
	
	List<Attachment> attachList();

	Product memberSellDetailView(int sellNo);

	int sellComplete(int sellNo);

	List<Product> memberBuyView(String memberId);

	List<Attachment> attachSelectOne(String productNo);

	List<Product> memberSellSize(String memberId);

}
