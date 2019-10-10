package com.kh.market.product.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.market.common.model.vo.Page;
import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Product;

public interface ProductDAO {

	List<Product> productList(String sellCategory);

	int productRegistration(Product p);

	Product productSelectOne(String productNo);

	int updateProduct(Product p);

	int productDelete(String productNo);

	List<Product> productSearch(String searchWord);

	List<Product> memberSellView(Map<String, Object> map);

	Product memberSellDetailView(int sellNo);

	int sellComplete(int sellNo);

	List<Product> memberBuyView(Map<String, Object> map);
	
	int insertImg(Attachment a);

	List<Attachment> attachList();

	List<Attachment> attachSelectOne(String productNo);

	int memberSellSize(String memberId);

	List<Product> moreResult(Page p);

	List<Attachment> moreAttach();

	int productBuyerUpdate(Map<Object, Object> map);

	int memberBuySize(String memberId);

	List<Product> srchMoreResult(Map<String, String> sendMap);

	List<Product> freeProductList();

	List<Product> moreFreeResult(Map<String, String> pageMap);


	

}
