package com.ssafy.fms.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.vo.Member;

public interface MemberDaoDb {
	int insertMember(SqlSession session, Member member);
	boolean LoginMember(SqlSession session, String id, String pw);
	Member searchMember(SqlSession session, String id);
	int updateMember(SqlSession session, Member member);
	public void deleteMember(SqlSession session, String id);
	List<Member> searchAll(SqlSession session);
}
