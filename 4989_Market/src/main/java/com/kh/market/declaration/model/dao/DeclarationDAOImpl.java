package com.kh.market.declaration.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.declaration.model.service.DeclarationService;
import com.kh.market.declaration.model.vo.Declaration;

@Repository
public class DeclarationDAOImpl implements DeclarationDAO {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public int insertMemberDeclaration(Declaration declaration) {
		return sqlSession.insert("declaration.insertMemberDeclaration", declaration);
	}

	@Override
	public List<Declaration> declarationList(Paging paging) {
//		int offset = (paging.getPage()-1)*DeclarationService.NUM_PER_PAGE;
//		int limit = DeclarationService.NUM_PER_PAGE;
//		
//		RowBounds rowbounds = new RowBounds(offset,limit);
		
		return sqlSession.selectList("declaration.declarationList",paging);
	}

	@Override
	public Declaration selectOneDeclaration(int declarationNo) {
		return sqlSession.selectOne("declaration.selectOneDeclaration", declarationNo);
	}

	@Override
	public int declarationProcess(String memberId) {
		return sqlSession.update("declaration.declarationProcess", memberId);
	}

	@Override
	public int declarationStateUpdate(int decNo) {
		return sqlSession.update("declaration.declarationStateUpdate",decNo);
	}

	@Override
	public int declarationCheck(String declarationWriter) {
		return sqlSession.insert("declaration.declarationCheck",declarationWriter);
	}

	@Override
	public int declarationReceiveCheck(String memberId) {
		return sqlSession.insert("declaration.declarationReceiveCheck", memberId);
	}
	
	@Override	
	public int declarationListCnt() {
		return sqlSession.selectOne("declaration.declarationListCnt");
	}
}
