package com.ssafy.project.controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.MemberDaoImpl;
import com.ssafy.util.MyBatisUtil;

public class DeleteController implements Controller {

	private MemberDaoImpl impl = new MemberDaoImpl();
	private MyBatisUtil util = MyBatisUtil.getUtil();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		try {
			SqlSession session = util.getSession();
			impl.deleteMember(session, id);
			return "redirect:login.jsp";
		}catch(Exception e) {
			e.printStackTrace();
			return "memberinfo.jsp";
		}
	}

}
