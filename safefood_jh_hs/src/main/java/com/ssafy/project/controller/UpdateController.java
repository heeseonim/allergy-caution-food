package com.ssafy.project.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.MemberDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Member;

public class UpdateController implements Controller {
	private MemberDaoImpl impl = new MemberDaoImpl();
	private MyBatisUtil util = MyBatisUtil.getUtil();
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		Member member = new Member(id, pw, name, phone, email);
		try {
			SqlSession session = util.getSession();
			int num = impl.updateMember(session, member);
			System.out.println(num+"개 수정");
			return "redirect:index.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			return "redirect:index.jsp";
		}
	}

}
