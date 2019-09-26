package com.kh.market.product.model.service;


import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.product.model.dao.ProductDAO;
import com.kh.market.product.model.vo.Attachment;
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
	public List<Attachment> attachList() {
		// TODO Auto-generated method stub
		return productDAO.attachList();
	}


}
