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

	@Override
	public int productRegistration(Product p) {
		// TODO Auto-generated method stub
		return productDAO.productRegistration(p);
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


}
