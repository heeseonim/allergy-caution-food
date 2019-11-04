package com.ssafy.project.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.fms.dao.FoodDao;
import com.ssafy.fms.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodListController implements Controller {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 뷰 호출
		FoodDao fd = FoodDaoImpl.getFoodDao();
		MyBatisUtil util = MyBatisUtil.getUtil();
		String stype = request.getParameter("stype");
		String word = request.getParameter("word");
		
		HttpSession session = request.getSession();
		String sort = (String) session.getAttribute("sort");
		
		if(stype==null) {
			stype="all";
		}
					
		List<Food> f = fd.searchAll(util.getSession(),new FoodPageBean(stype, word, "", ""));
		
		System.out.println("FoodList 호출");
//		System.out.println(stype);
//		System.out.println(word);
//		System.out.println(f);
		request.setAttribute("foods", f);
		
//		HttpSession session = request.getSession();
		session.setAttribute("foods", f);
		session.setAttribute("data", "true");
	
		return "foodlist.jsp";
	}


}
