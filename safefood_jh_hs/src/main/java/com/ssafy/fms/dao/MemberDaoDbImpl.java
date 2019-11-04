package com.ssafy.fms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Member;

public class MemberDaoDbImpl implements MemberDaoDb {
	// - 추가 -
	private static MemberDaoDbImpl impl = new MemberDaoDbImpl();
	public MemberDaoDbImpl() {

	}
	public static MemberDaoDbImpl getImpl() {
		return impl;
	}
	private final String namespace="com.ssafy.mapper.MemberMapper.";
	
	@Override
	public int insertMember(SqlSession session, Member member) {
		String stmt = namespace+"insertMember";
		return session.insert(stmt, member);
	}

	@Override
	public Member searchMember(SqlSession session, String id) {
		String stmt = namespace+"searchMember";
		return session.selectOne(stmt, id);
	}

	@Override
	public boolean LoginMember(SqlSession session, String id, String pw) {
		String stmt = namespace+"LoginMember";
		Member member = session.selectOne(stmt, id);
		if (member == null) {
			return false;
		} else {
			if (pw.equals(member.getPw())) {
				return true;
			} else {
				return false;
			}
		}
	}

	@Override
	public int updateMember(SqlSession session, Member member) {
		String stmt = namespace+"updateMember";
		return session.update(stmt, member);
	}

	@Override
	public void deleteMember(SqlSession session, String id) {
		String stmt = namespace+"deleteMember";
		session.delete(stmt, id);
	}
	
	@Override
	public List<Member> searchAll(SqlSession session) {
		String stmt = namespace+"searchAll";
		List<Member> list = session.selectList(stmt);
		return list;
	}
	
}
