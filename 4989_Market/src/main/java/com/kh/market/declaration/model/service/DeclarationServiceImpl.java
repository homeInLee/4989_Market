package com.kh.market.declaration.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.common.model.vo.Paging;
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
	public List<Declaration> declarationList(Paging paging) {
		return declarationDAO.declarationList(paging);
	}

	@Override
	public Declaration selectOneDeclaration(int declarationNo) {
		return declarationDAO.selectOneDeclaration(declarationNo);
	}

	@Override
	public int declarationProcess(String memberId) {
		return declarationDAO.declarationProcess(memberId);
	}

	@Override
	public int declarationStateUpdate(int decNo) {
		return declarationDAO.declarationStateUpdate(decNo);
	}

	@Override
	public int declarationCheck(String declarationWriter) {
		return declarationDAO.declarationCheck(declarationWriter);
	}

	@Override
	public int declarationReceiveCheck(String memberId) {
		return declarationDAO.declarationReceiveCheck(memberId);
	}
	
	@Override
	public int declarationListCnt() {
		return declarationDAO.declarationListCnt();
	}
}
