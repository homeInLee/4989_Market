package com.kh.market.declaration.model.dao;

import java.util.List;

import com.kh.market.declaration.model.vo.Declaration;

public interface DeclarationDAO {

	int insertMemberDeclaration(Declaration declaration);

	List<Declaration> declarationList(int cPage);

}
