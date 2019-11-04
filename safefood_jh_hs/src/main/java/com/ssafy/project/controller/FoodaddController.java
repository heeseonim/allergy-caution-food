package com.ssafy.project.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;

public class FoodaddController implements Controller {
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String s= request.getParameter("ad");
		System.out.println(s);
		FoodDaoImpl imp = (FoodDaoImpl) FoodDaoImpl.getFoodDao();
		SqlSession session = MyBatisUtil.getUtil().getSession();
		Food food = imp.searchName(session, s);
		int n = imp.addFood(session, food);
		if(n == 1) {
			session.commit();
		}else {
			System.out.println("짝 개못함");
		}
		return "foodinfo.jsp";
	}

}
