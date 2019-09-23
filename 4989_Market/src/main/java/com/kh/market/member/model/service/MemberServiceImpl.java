package com.kh.market.member.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.market.member.model.dao.MemberDAO;
import com.kh.market.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

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

	
}
