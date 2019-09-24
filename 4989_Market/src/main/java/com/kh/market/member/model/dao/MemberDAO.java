package com.kh.market.member.model.dao;

import java.util.List;

import com.kh.market.member.model.vo.Member;
import com.kh.market.product.model.vo.Product;

public interface MemberDAO {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);
	
	int updateAddress(Member m);


}
