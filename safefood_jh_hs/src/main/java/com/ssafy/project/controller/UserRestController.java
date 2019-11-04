package com.ssafy.project.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.service.MemberService;
import com.ssafy.vo.Member;

import lombok.extern.slf4j.Slf4j;

@RestController
@RequestMapping("/member")
@Slf4j
public class UserRestController {
	@Autowired
	MemberService service;
	
	@PostMapping("/insert")
	public ResponseEntity<Object> insertMember(@RequestBody Member member) {
		try {
			int result = service.insertMember(member);
			if(result>0) {
				return new ResponseEntity<Object>(result, HttpStatus.OK);
			}else {
				return new ResponseEntity<Object>(result, HttpStatus.OK);
			}
		}catch(RuntimeException e) {
			throw e;
		}
	}
	
	
	

}
