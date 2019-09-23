package com.kh.market.member.model.service;

import java.util.List;

import com.kh.market.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);

}
