package com.ssafy.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.MemberDaoDbImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Member;

public class LoginController implements Controller {
	private MemberDaoDbImpl impl = MemberDaoDbImpl.getImpl();
	private MyBatisUtil util = MyBatisUtil.getUtil();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 파라미터 확인
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		try{
			SqlSession session = util.getSession();
			boolean result = impl.LoginMember(session, id, pw);
			if(result) {
				Member member = impl.searchMember(session, id);
				System.out.println("로긴성공~~");
				HttpSession sessions = request.getSession();
				sessions.setAttribute("member", member);
				return "redirect:index.jsp";
			}else {
				System.out.println("로긴실패");
				return "login.jsp";
			}
		}catch(Exception e) {
			e.printStackTrace();
			return "login.jsp";
		}
	}
	
}
