package com.kh.market.member.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.market.common.model.vo.Paging;
import com.kh.market.member.model.vo.Member;

@Repository
public class MemberDAOImpl implements MemberDAO {
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("member.selectOneMember",memberId);
	}

	@Override
	public int insertMember(Member member) {
		return sqlSession.insert("member.insertMember",member);
	}

	@Override
	public int memberUpdate(Member member) {
		return sqlSession.update("member.memberUpdate",member);
	}

	@Override
	public int memberDelete(Member memberLoggedIn) {
		return sqlSession.update("member.memberDelete",memberLoggedIn);
	}

	@Override
	public int updateAddress(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.update("member.updateAddress", m);
	}

	@Override
	public List<Member> memberList(Paging paging) {
		return sqlSession.selectList("member.memberList",paging);
	}

	@Override
	public int memberDeleteCancle(Member member) {
		return sqlSession.update("member.memberDeleteCancle",member);
	}

	@Override
	public int memberListCnt() {
		return sqlSession.selectOne("member.memberListCnt");
	}

}
