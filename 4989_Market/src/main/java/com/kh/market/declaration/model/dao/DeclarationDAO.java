package com.kh.market.declaration.model.dao;

import java.util.List;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.declaration.model.vo.Declaration;

public interface DeclarationDAO {

	int insertMemberDeclaration(Declaration declaration);

	List<Declaration> declarationList(Paging paging);

	Declaration selectOneDeclaration(int declarationNo);

	int declarationProcess(String memberId);

	int declarationStateUpdate(int decNo);

	int declarationCheck(String declarationWriter);

	int declarationReceiveCheck(String memberId);

	int declarationListCnt();

}
