package com.kh.market.basket.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.basket.model.service.BasketService;
import com.kh.market.basket.model.vo.Basket;
import com.kh.market.product.model.vo.Product;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> basketView(Map<Object, Object> map) {
		int cPage=(int)map.get("cPage");
		int offset = (cPage-1)*BasketService.NUM_PER_PAGE;
		int limit = BasketService.NUM_PER_PAGE;
		RowBounds rowBounds=new RowBounds(offset, limit);
				
		return sqlSession.selectList("basket.basketView",map,rowBounds);
	}

	@Override
	public List<Basket> totalBasketCount(String basketMemberId) {
		
		return sqlSession.selectList("basket.totalBasketCount",basketMemberId);
	}
}
