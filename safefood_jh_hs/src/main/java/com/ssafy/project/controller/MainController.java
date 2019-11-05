package com.ssafy.project.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.ssafy.service.FoodService;
import com.ssafy.service.MemberService;
import com.ssafy.vo.Food;
import com.ssafy.vo.FoodPageBean;
import com.ssafy.vo.Member;

@Controller
public class MainController {
	@Autowired
	MemberService mservice;

	@Autowired
	FoodService fservice;

	@GetMapping("/main.do")
	public String gomain() {
		return "/index";
	}

	@RequestMapping("/login.do")
	public String Login(@RequestParam String id, String password, HttpSession session) {
		System.out.println(id+" "+password+"들어왓당");
		try {
			boolean result = mservice.LoginMember(id, password);
			System.out.println(result);
			if(result) {
				Member member = mservice.searchMember(id);
				session.setAttribute("member", member);
				return "redirect:index.jsp";
			}else {
				return "/login";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/login";
		}
	}
	
	@RequestMapping("/signup.do")
	public String Signup(String id,String pw,String name,String phone,String email, String[] allergy, HttpSession session) {
		String al = Arrays.toString(allergy);
		System.out.println(phone);
		al = al.substring(1, al.length()-1).replaceAll(" ", "");
		Member member = new Member(id,pw,name, phone,email,al);
		System.out.println(member);
		try {
			int result = mservice.insertMember(member);	
			if(result>0) {
				session.setAttribute("member", member);
				return "redirect:index.jsp";
			}else {
				return "/signup";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/signup";
		}
	}
	
	@RequestMapping("/logout.do")
	public String Logout(HttpSession session) {
		session.invalidate();
		return "/index";
	}
	
	@RequestMapping("/memberlist.do")
	public String memberlist(HttpSession session) {
		try{
			List<Member> list = mservice.searchAll();
			session.setAttribute("memberlist", list);
			return "redirect:memberlist.jsp";
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/index";
		}
	}
	
	@PostMapping("/update.do")
	public String update(@RequestParam String id,String pw,String name,String phone,String email) {
		Member member = new Member(id, pw, name, phone, email, null);
		System.out.println(member+"업데이트");
		try {
			int result = mservice.updateMember(member);
			if(result >0) {
				return "redirect:index.jsp";
			}else {
				return "/memberinfo";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/memberinfo";
		}
	}
	
	@RequestMapping("/delete.do")
	public String delete(@RequestParam String id) {
		try {
			int result = mservice.deleteMember(id);
			if(result>0) {
				return "redirect:index.jsp";
			}else {
				return "/memberinfo";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/memberinfo";
		}
	}
	
	@GetMapping("/foodlist.do")
	public String doList(HttpSession session) {

		List<Food> f = fservice.searchAll();
		session.setAttribute("foods", f);
		session.setAttribute("data", "true");

		return "foodlist";
	}

	@RequestMapping("/foodlist.do")
	public String doSearch(@RequestParam String stype, String word, HttpSession session) {
		String sort = (String) session.getAttribute("sort");
		if (stype == null) {
			stype = "all";
		}
		List<Food> f = fservice.searchAll(new FoodPageBean(stype, word, "", ""));
		session.setAttribute("foods", f);
		session.setAttribute("data", "true");
		return "foodlist";
	}

	@RequestMapping("/foodview.do")
	public String doView(@RequestParam String code, HttpSession session) {
		Food f = fservice.search(Integer.parseInt(code));
		fservice.updateClick(f);
		session.setAttribute("foodview", f);
		return "redirect:foodinfo.jsp";
	}

	@RequestMapping("/foodsortlist.do")
	public String doSort(@RequestParam String stype, String word, HttpSession session, HttpServletResponse hsr) {
		String sort = (String) session.getAttribute("sort");

		System.out.println("정렬 여부" + sort);
		session.setAttribute("sort", "false");

		if (stype == null) {
			stype = "all";
		}

		List<Food> f = fservice.searchAll(new FoodPageBean(stype, word, "", ""));
		
		quickSort(f, 0, f.size()-1);
		
		session.setAttribute("foods", f);
		session.setAttribute("data", "true");
		
		Gson gson = new Gson();
		hsr.setContentType("application/json;charset=utf-8");
		try {
			hsr.getWriter().append(gson.toJson(f));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
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
	
	@RequestMapping("/foodsimilar.do")
	public String doSimilar(@RequestParam String fname, HttpServletResponse hsr) {
		int code = Integer.parseInt(fname);
		Food food = fservice.search(code);	//현재
		List<Food>list = null;
		try {
			list = fservice.searchAll();			
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
					f.add(fservice.search(j+1));
				}
			}
		}
		
		Gson gson = new Gson();
		String jString = gson.toJson(f);

		hsr.setContentType("application/json;charset=utf-8");
		try {
			hsr.getWriter().append(jString);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return "none:sss.jsp";
	}

}
