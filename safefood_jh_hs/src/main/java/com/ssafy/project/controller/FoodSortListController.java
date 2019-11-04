package com.ssafy.project.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.dao.FoodDao;
import com.ssafy.dao.FoodDaoImpl;
import com.ssafy.util.MyBatisUtil;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;

public class FoodSortListController implements Controller {

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
		
		System.out.println("정렬 여부" + sort);
		session.setAttribute("sort", "false");
		
		if(stype==null) {
			stype="all";
		}
					
		List<Food> f = fd.searchAll(util.getSession(), new FoodPageBean(stype, word, "", ""));
	
		quickSort(f, 0, f.size()-1);
		
		System.out.println("FoodList 호출");
//		System.out.println(stype);
//		System.out.println(word);
//		System.out.println(f);
		request.setAttribute("foods", f);
		
//		HttpSession session = request.getSession();
		session.setAttribute("foods", f);
		session.setAttribute("data", "true");
		
//		Gson gson = new Gson();
		
//		System.out.println(gson.toJson(f));
		response.setContentType("application/json;charset=utf-8");
//		response.getWriter().append(gson.toJson(f));
		
		return "none:foodlist.jsp";
	}

	public static void quickSort(List<Food> a, int left, int right) {
		if(left >= right) {	// 종료파트 원소가 두개 이상일 때만 작업하겠다.
			return;
		}
		//재귀 파트 
		int pivot = lomutoPartition(a, left, right);
		
		quickSort(a, left, pivot - 1);
		quickSort(a, pivot+1, right);
	}
	
	public static int lomutoPartition(List<Food> a, int left, int right) {
		int pivot = a.get(right).getFrequency();
		int i = left - 1;
		
		for (int j = left; j < right; j++) {
			if (a.get(j).getFrequency() > pivot) {
				i++;
				Food temp = a.get(i);
				a.set(i , a.get(j));
				a.set(j , temp);
			}
		}
		
		Food temp = a.get(i+1);
		a.set(i+1 , a.get(right));
		a.set(right , temp);
		
		return i+1;
	}
}
