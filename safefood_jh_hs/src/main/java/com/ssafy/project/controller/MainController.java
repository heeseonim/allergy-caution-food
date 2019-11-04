package com.ssafy.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.ssafy.service.MemberService;
import com.ssafy.vo.Member;

@Controller
public class MainController {
	@Autowired
	MemberService mservice;
	
	@GetMapping("/main.do")
	public String gomain() {
		return "/index";
	}
	
	@PostMapping("/signup.do")
	public String MemberInsert(@RequestBody Member member) {
		try {
			int result = mservice.insertMember(member);
			if(result>0) {
				return "redirect:index.jsp";
			}else {
				return "signup.jsp";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "signup.jsp";
		}
	}
	
	@RequestMapping("/views/login.do")
	public String Login(@RequestParam String id, String password) {
		System.out.println(id+"들어왓당");
		try {
			boolean result = mservice.LoginMember(id, password);
			if(result) {
				return "/index";
			}else {
				return "/login";
			}
		}catch(RuntimeException e) {
			e.printStackTrace();
			return "/login";
		}
	}
	
	
	
}
