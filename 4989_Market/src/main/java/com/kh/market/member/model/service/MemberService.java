package com.kh.market.member.model.service;

import java.util.List;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.member.model.vo.Member;

public interface MemberService {

	Member selectOneMember(String memberId);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);

	int updateAddress(Member m);

	List<Member> memberList(Paging paging);

	int insertMember(Member member);

	int memberDeleteCancle(Member member);

	int memberListCnt();

}
