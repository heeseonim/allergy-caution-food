package com.ssafy.proejct.servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ssafy.project.controller.Controller;
import com.ssafy.project.controller.DeleteController;
import com.ssafy.project.controller.FoodListController;
import com.ssafy.project.controller.FoodSortListController;
import com.ssafy.project.controller.FoodViewController;
import com.ssafy.project.controller.FoodaddController;
import com.ssafy.project.controller.FoodsimilarController;
import com.ssafy.project.controller.LoginController;
import com.ssafy.project.controller.LogoutController;
import com.ssafy.project.controller.MemberListController;
import com.ssafy.project.controller.SignupController;
import com.ssafy.project.controller.UpdateController;

/**
 * Servlet implementation class ExtensionBaseServlet
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	//맵으로 컨트롤러 관리
	Map<String, Controller> map = new HashMap<>(); // 초기화 시점?
	
	@Override
	public void init() throws ServletException {
		super.init();
		map.put("/login.do", new LoginController());
		map.put("/logout.do", new LogoutController());
		map.put("/foodlist.do", new FoodListController());
		map.put("/foodsortlist.do", new FoodSortListController());
		map.put("/foodview.do", new FoodViewController());
		map.put("/signup.do", new SignupController());
		map.put("/update.do", new UpdateController());
		map.put("/delete.do", new DeleteController());
		map.put("/memberlist.do", new MemberListController());
		map.put("/foodsimilar.do", new FoodsimilarController());	
		map.put("/foodadd.do", new FoodaddController());
	}
	
	// get, post 요청이 모두 거쳐감 
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러 진입");
		
		
		String path = request.getServletPath();
		Controller controller = map.get(path);
		
		if(controller == null) {
			path = "login.jsp";
		}else {
			path = controller.execute(request, response);
		}
//		response.getWriter().append("*.do : 확장자 기반 처리 " + path);
		// 후처리 : 전달받은 페이지로 이동.

		HttpSession session = request.getSession();
		session.setAttribute("sort", "false");

		if(path.startsWith("redirect:")) {
			path = path.substring(path.indexOf(":")+1);
			response.sendRedirect(path);
		}else if(path.startsWith("none:")) {
		}else {
			RequestDispatcher disp = request.getRequestDispatcher(path);
			disp.forward(request, response);			
		}
		
	}

}
