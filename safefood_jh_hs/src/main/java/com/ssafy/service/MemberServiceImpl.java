package com.ssafy.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssafy.dao.MemberDao;
import com.ssafy.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao dao;
	
	@Override
	@Transactional
	public int insertMember(Member member) {
		return dao.insertMember(member);
	}

	@Override
	public boolean LoginMember(String id, String pw) {
		Member member = dao.LoginMember(id, pw);
		System.out.println(member.getId());
		System.out.println(member.getPw());
		System.out.println(member);
		if (pw.equals(member.getPw())) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Member searchMember(String id) {
		return dao.searchMember(id);
	}

	@Override
	public int updateMember(Member member) {
		return dao.updateMember(member);
	}

	@Override
	public int deleteMember(String id) {
		return dao.deleteMember(id);
	}

	@Override
	public List<Member> searchAll() {
		return dao.searchAll();
	}

}
