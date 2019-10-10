package com.kh.market.product.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.common.model.vo.Page;
import com.kh.market.product.model.service.ProductService;
import com.kh.market.product.model.vo.Attachment;
import com.kh.market.product.model.vo.Product;
import com.kh.market.review.model.service.ReviewService;

@Repository
public class ProductDAOImpl implements ProductDAO {

	
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Product> productList(String sellCategory) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.productList", sellCategory);
	}

	@Override
	public int productRegistration(Product p) {
		// TODO Auto-generated method stub
		return sqlSession.insert("product.productRegistration", p);

	}

	@Override
	public Product productSelectOne(String productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("product.productView", productNo);
	}

	@Override
	public int updateProduct(Product p) {
		// TODO Auto-generated method stub
		return sqlSession.update("product.updateProduct", p);
	}

	@Override
	public int productDelete(String productNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("product.productDelete", productNo);
	}

	@Override
	public List<Product> productSearch(String searchWord) {
		return sqlSession.selectList("product.productSearch", searchWord);
	}

	@Override
	public List<Product> memberSellView(Map<String, Object> map) {
		
		return sqlSession.selectList("product.memberSellView",map);
	}
	public int insertImg(Attachment a) {
		return sqlSession.insert("product.insertImg", a);
	}

	@Override
	public List<Attachment> attachList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.attachList");
	}


	@Override
	public Product memberSellDetailView(int sellNo) {
		
		return sqlSession.selectOne("product.memberSellDetailView",sellNo);
	}

	@Override
	public int sellComplete(int sellNo) {
		
		return sqlSession.update("product.sellComplete",sellNo);
	}

	@Override
	public List<Product> memberBuyView(Map<String, Object> map) {
		
		return sqlSession.selectList("product.memberBuyView",map);
	}

	@Override
	public List<Attachment> attachSelectOne(String productNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.attachSelectOne", productNo);
	}

	@Override
	public int memberSellSize(String memberId) {
		return sqlSession.selectOne("product.memberSellSize",memberId);
	}
	
	public List<Product> moreResult(Page p) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.moreResult", p);
	}

	@Override
	public List<Attachment> moreAttach() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.moreAttach");
	}

	@Override
	public int productBuyerUpdate(Map<Object, Object> map) {
		
		return sqlSession.update("product.productBuyerUpdate",map);
	}
	@Override
	public int memberBuySize(String memberId) {
		return sqlSession.selectOne("product.memberBuySize",memberId);
	}

	@Override
	public List<Product> srchMoreResult(Map<String, String> sendMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.srchMoreResult", sendMap);
	}

	@Override
	public List<Product> freeProductList() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.freeProductList");
	}

	@Override
	public List<Product> moreFreeResult(Map<String, String> pageMap) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("product.moreFreeResult", pageMap);
	}


	
	
}
