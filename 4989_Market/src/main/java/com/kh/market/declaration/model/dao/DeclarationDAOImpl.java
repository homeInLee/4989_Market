package com.kh.market.declaration.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public List<Declaration> declarationList(int cPage) {
		int offset = (cPage-1)*DeclarationService.NUM_PER_PAGE;
		int limit = DeclarationService.NUM_PER_PAGE;
		
		RowBounds rowbounds = new RowBounds(offset,limit);
		
		return sqlSession.selectList("declaration.declarationList",cPage,rowbounds);
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
}
