package com.kh.market.product.model.service;

import java.util.List;
import java.util.Map;

import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Page;
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

	List<Product> memberSellView(Map<String, Object> map);
	
	List<Attachment> attachList();

	Product memberSellDetailView(int sellNo);

	int sellComplete(int sellNo);

	List<Product> memberBuyView(Map<String, Object> map);

	List<Attachment> attachSelectOne(String productNo);

	int memberSellSize(String memberId);

	List<Product> moreResult(Page p);

	List<Attachment> moreAttach();

<<<<<<< HEAD
	int productBuyerUpdate(Map<Object, Object> map);
=======
	int memberBuySize(String memberId);
>>>>>>> refs/remotes/origin/homin

}
