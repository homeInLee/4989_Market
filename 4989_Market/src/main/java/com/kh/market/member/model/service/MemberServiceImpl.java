package com.kh.market.member.model.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.common.vo.Attachment;
import com.kh.market.member.model.dao.MemberDAO;
import com.kh.market.member.model.vo.Member;
import com.kh.market.product.model.vo.Product;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Override
	public Member selectOneMember(String memberId) {
		return memberDAO.selectOneMember(memberId);
	}

	@Override
	public int insertMember(Member member) {
		return memberDAO.insertMember(member);
	}

	@Override
	public int memberUpdate(Member member) {
		return memberDAO.memberUpdate(member);
	}

	@Override
	public int memberDelete(Member memberLoggedIn) {
		return memberDAO.memberDelete(memberLoggedIn);
	}
	
	public int updateAddress(Member m) {
		// TODO Auto-generated method stub
		return memberDAO.updateAddress(m);
	}

	@Override
	public List<Member> memberList() {
		return memberDAO.memberList();
	}

	
}
