package com.ssafy.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ssafy.vo.Member;
@Repository
public class MemberDaoImpl implements MemberDao {
	private final String ns="com.ssafy.mapper.MemberMapper.";
	
	@Autowired
	SqlSession session;
	
	@Override
	public int insertMember(Member member) {
		return session.insert(ns+"insertMember", member);
	}

	@Override
	public Member searchMember(String id) {
		return session.selectOne(ns+"searchMember", id);
	}

	@Override
	public Member LoginMember(String id, String password) {
		return session.selectOne(ns+"LoginMember", id);
	}

	@Override
	public int updateMember(Member member) {
		return session.update(ns+"updateMember", member);
	}


	@Override
	public List<Member> searchAll() {
		return session.selectList(ns+"searchAll");
	}

	@Override
	public int deleteMember(String id) {
		return session.delete(ns+"deleteMember", id);
	}

	@Override
	public String searchPass(String id) {
		return session.selectOne(ns+"searchPass", id);
	}

	@Override
	public Member findpass(String id) {
		return session.selectOne(ns+"LoginMember", id);
	}
	
}
