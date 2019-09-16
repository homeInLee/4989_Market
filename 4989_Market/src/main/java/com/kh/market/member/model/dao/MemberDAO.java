package com.kh.market.member.model.dao;

import com.kh.market.member.model.vo.Member;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

}
