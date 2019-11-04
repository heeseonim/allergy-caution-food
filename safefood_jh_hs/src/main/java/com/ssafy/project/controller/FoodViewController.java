package com.ssafy.project.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.service.FoodService;
import com.ssafy.service.FoodServiceImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;

public class FoodViewController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 변수
		int code = Integer.parseInt(request.getParameter("code"));
		
		// 가져오기
		FoodService fs = new FoodServiceImpl();
		FoodDao fd = FoodDaoImpl.getFoodDao();
		MyBatisUtil util = MyBatisUtil.getUtil();
		Food f = fs.search(code);
		
		fd.updateClick(util.getSession(), f);
		
		System.out.println("FoodView 호출");
		System.out.println(f);
		
		HttpSession session = request.getSession();
		session.setAttribute("foodview", f);
		
		request.setAttribute("foodview", f);
		return "redirect:foodinfo.jsp";
	}

}
