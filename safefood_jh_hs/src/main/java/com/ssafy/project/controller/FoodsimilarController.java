package com.ssafy.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;

public class FoodsimilarController implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("fname"));
		FoodDao imp = FoodDaoImpl.getFoodDao();
		MyBatisUtil util = MyBatisUtil.getUtil();
		Food food = imp.search(util.getSession(),code);	//현재
		List<Food>list = null;
		try {
			list = imp.searchAll(util.getSession());			
		}catch(Exception e) {
			e.printStackTrace();
		}
		//유클리디언 거리
		double[] u = new double[20];
		double[] idx = new double[20];
		int cnt =0;
		for (Food f : list) {
			double dis = Math.floor(Math.pow(food.getCalory()-f.getCalory(), 2)+Math.pow(food.getCarbo()-f.getCarbo(), 2)+
					Math.pow(food.getProtein()-f.getProtein(), 2)+Math.pow(food.getFat()-f.getFat(), 2)+Math.pow(food.getSugar()-f.getSugar(), 2)+
					Math.pow(food.getNatrium()-f.getNatrium(), 2));
			idx[cnt]=u[cnt] = dis;
			cnt++;
		}
		Arrays.sort(idx);
		List<Food>f = new ArrayList<>();
		for (int i = 1; i < 6; i++) {
			for (int j = 0; j < u.length; j++) {
				if(idx[i]==u[j]) {
					f.add(imp.search(util.getSession(),j+1));
				}
			}
		}
//		Gson gson = new Gson();
//		String jString = gson.toJson(f);		

		response.setContentType("application/json;charset=utf-8");
//		response.getWriter().append(jString);

		return "none:sss.jsp";
	}


}
