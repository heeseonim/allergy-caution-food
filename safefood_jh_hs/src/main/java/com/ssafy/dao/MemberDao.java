package com.ssafy.dao;

import java.util.List;


import com.ssafy.vo.Member;

public interface MemberDao {
	int insertMember(Member member);
	Member LoginMember(String id, String pw);
	Member searchMember(String id);
	int updateMember(Member member);
	int deleteMember(String id);
	List<Member> searchAll();
}
