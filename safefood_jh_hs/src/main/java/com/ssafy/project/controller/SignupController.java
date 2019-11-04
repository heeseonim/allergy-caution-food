package com.ssafy.project.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.MemberDaoDbImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Member;

public class SignupController implements Controller {
	private MemberDaoDbImpl impl = new MemberDaoDbImpl();
	private MyBatisUtil util = MyBatisUtil.getUtil();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		System.out.println(id+" : "+pw);
		Member member = new Member(id, pw, name, phone, email);
		try {
			SqlSession session = util.getSession();
			impl.insertMember(session, member);
			return "redirect:index.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			return "signup.jsp";
		}
	}

}