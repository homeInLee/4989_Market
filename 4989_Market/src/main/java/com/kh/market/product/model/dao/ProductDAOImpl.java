package com.kh.market.product.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> productList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.productList");
	}
	
	
}
