package com.kh.market.basket.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.product.model.vo.Product;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> basketView(String basketMemberId) {
		
		return sqlSession.selectList("basket.basketView",basketMemberId);
	}
}
