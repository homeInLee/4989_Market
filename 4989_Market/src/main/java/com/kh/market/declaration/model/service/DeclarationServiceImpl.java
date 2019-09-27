package com.kh.market.declaration.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.declaration.model.dao.DeclarationDAO;
import com.kh.market.declaration.model.vo.Declaration;

@Service
public class DeclarationServiceImpl implements DeclarationService {

	@Autowired
	DeclarationDAO declarationDAO;

	@Override
	public int insertMemberDeclaration(Declaration declaration) {
		return declarationDAO.insertMemberDeclaration(declaration);
	}

	@Override
	public List<Declaration> declarationList(int cPage) {
		return declarationDAO.declarationList(cPage);
	}
}
