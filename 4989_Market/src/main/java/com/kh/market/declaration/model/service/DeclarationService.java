package com.kh.market.declaration.model.service;

import java.util.List;

import com.kh.market.declaration.model.vo.Declaration;

public interface DeclarationService {

	int NUM_PER_PAGE = 10;
	
	int insertMemberDeclaration(Declaration declaration);

	List<Declaration> declarationList(int cPage);

	Declaration selectOneDeclaration(int declarationNo);

	int declarationProcess(String memberId);

	int declarationStateUpdate(int decNo);

	int declarationCheck(String declarationWriter);

	int declarationReceiveCheck(String memberId);

}
