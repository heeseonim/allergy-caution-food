package com.ssafy.project.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.MemberDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Member;

public class MemberListController implements Controller {
	private MemberDaoImpl impl = new MemberDaoImpl();
	private MyBatisUtil util = MyBatisUtil.getUtil();
		
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			SqlSession sessions = util.getSession();
			List<Member> list = impl.searchAll(sessions);
			HttpSession session = request.getSession();
			session.setAttribute("memberlist", list);
			return "memberlist.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			return "index.jsp";
		}

	}

}
