package com.kh.market.member.model.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kh.market.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);

	int updateAddress(Member m);

}
