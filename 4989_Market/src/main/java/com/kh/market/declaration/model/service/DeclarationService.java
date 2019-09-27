package com.kh.market.declaration.model.service;

import java.util.List;

import com.kh.market.declaration.model.vo.Declaration;

public interface DeclarationService {

	int NUM_PER_PAGE = 10;
	
	int insertMemberDeclaration(Declaration declaration);

	List<Declaration> declarationList(int cPage);

}
