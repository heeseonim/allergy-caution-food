package com.ssafy.service;

import java.util.List;

import com.ssafy.vo.Member;

public interface MemberService {
	int insertMember(Member member);
	boolean LoginMember(String id, String password);
	Member searchMember(String id);
	int updateMember(Member member);
	int deleteMember(String id);
	List<Member> searchAll();
}
