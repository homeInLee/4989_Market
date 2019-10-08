package com.kh.market.product.model.service;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.product.model.dao.ProductDAO;
import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Page;
import com.kh.market.product.model.vo.Product;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDAO productDAO;
	
	Logger logger = LoggerFactory.getLogger(getClass());

	
	@Override
	public List<Product> productList() {
		// TODO Auto-generated method stub
		return productDAO.productList();
	}

	@Override
	public int productRegistration(Product p, List<Attachment> attachList) {
		// TODO Auto-generated method stub
		int result = productDAO.productRegistration(p);
		
		if(result == 0) {
			logger.info("게시물 등록 오류");
		}
		
		int sellNo = p.getSellNo();
		logger.info("@@@@@@@@sellNo={}@@@@@@@@@@@@",sellNo);

		
		//사진 등록
		if(attachList.size()>0) {
			for (Attachment a : attachList) {
				a.setBoardNo(sellNo);
				
				result = productDAO.insertImg(a);
				if (result == 0) {
					
					logger.info("게시물 등록 오류");
				}

			}
		}
		
		
		return result;
	}

	@Override
	public Product productSelectOne(String productNo) {
		// TODO Auto-generated method stub
		return productDAO.productSelectOne(productNo);
	}

	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return productDAO.updateProduct(p);
	}

	@Override
	public int productDelete(String productNo) {
		// TODO Auto-generated method stub
		return productDAO.productDelete(productNo);
	}

	@Override
	public List<Product> productSearch(String searchWord) {
		return productDAO.productSearch(searchWord);
	}

	@Override
	public List<Product> memberSellView(Map<String, Object> map) {
		
		return productDAO.memberSellView(map);
	}

	@Override
	public Product memberSellDetailView(int sellNo) {
		return productDAO.memberSellDetailView(sellNo);
	}

	@Override
	public int sellComplete(int sellNo) {
		
		return productDAO.sellComplete(sellNo);
	}

	@Override
	public List<Product> memberBuyView(Map<String, Object> map) {
		
		return productDAO.memberBuyView(map);
	}
	public List<Attachment> attachList() {
		// TODO Auto-generated method stub
		return productDAO.attachList();
	}

	@Override
	public List<Attachment> attachSelectOne(String productNo) {
		// TODO Auto-generated method stub
		return productDAO.attachSelectOne(productNo);
	}

	@Override
	public int memberSellSize(String memberId) {
		
		return productDAO.memberSellSize(memberId);
	}
	
	@Override
	public List<Product> moreResult(Page p) {
		// TODO Auto-generated method stub
		return productDAO.moreResult(p);
	}

	@Override
	public List<Attachment> moreAttach() {
		// TODO Auto-generated method stub
		return productDAO.moreAttach();
	}

	@Override
	public int productBuyerUpdate(Map<Object, Object> map) {
		
		return productDAO.productBuyerUpdate(map);
	}
	
	@Override
	public int memberBuySize(String memberId) {
		// TODO Auto-generated method stub
		return productDAO.memberBuySize(memberId);
	}


}
