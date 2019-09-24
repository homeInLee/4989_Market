package com.kh.market.member.model.service;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.kh.market.member.model.vo.Member;
import com.kh.market.product.model.vo.Product;

public interface MemberService {

	Member selectOneMember(String memberId);

	int insertMember(Member member);

	int memberUpdate(Member member);

	int memberDelete(Member memberLoggedIn);

	int updateAddress(Member m);

}
