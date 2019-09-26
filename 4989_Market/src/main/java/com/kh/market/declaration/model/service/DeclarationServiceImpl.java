package com.kh.market.declaration.model.service;

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
		return 0;
	}
}
