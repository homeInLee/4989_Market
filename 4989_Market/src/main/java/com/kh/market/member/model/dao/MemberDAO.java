package com.kh.market.member.model.dao;

import java.util.List;

import com.kh.market.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);


}
