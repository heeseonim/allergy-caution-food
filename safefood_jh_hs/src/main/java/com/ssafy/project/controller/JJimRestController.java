package com.ssafy.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.service.JJimService;
import com.ssafy.service.QnABoardService;
import com.ssafy.vo.Board;
import com.ssafy.vo.JJim;
import com.ssafy.vo.PageBean;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@CrossOrigin({ "*" })
public class JJimRestController {
	@Autowired
	JJimService service;

	// 해당 아이디의 찜 목록들
	@GetMapping("/JJim/{id}")
	@ApiOperation("해당 아이디의 찜 목록들")
	public ResponseEntity<Map<String, Object>> showDetailBoard(@PathVariable String id) {
		try {
			return response(service.searchJJimById(id), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			return response("Get JJimlist Error", HttpStatus.CONFLICT, true);
		}
	}

	// 찜 추가
	@PostMapping("/JJim")
	@ApiOperation("찜추가")
	public ResponseEntity<Map<String, Object>> InsertBoard(@RequestBody JJim jjim) {
		try {
			JJim temp = service.findJJim(jjim);
			if(temp==null) {
				return response(service.insertJJim(jjim), HttpStatus.OK, true);				
			}else {
				return response("이미 추가했어요~",HttpStatus.OK, false);
			}
		} catch (RuntimeException e) {
			log.trace("jjim insert error : {}", e);
			throw e;
		}
	}

	// 글 삭제 동작
	@DeleteMapping("/JJim/{id}/{code}")
	public ResponseEntity<Map<String, Object>> DeleteBoard(@PathVariable String id, @PathVariable String code) {
		JJim jjim = new JJim(id, Integer.parseInt(code));
		System.out.println(jjim);
		try {
			return response(service.deleteJJim(jjim), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			log.trace("jjim delete error : {}", e);
			throw e;
		}
	}

	private ResponseEntity<Map<String, Object>> response(Object data, HttpStatus httpStatus, boolean status) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("data", data);
		resultMap.put("status", status);
		// 상태와 함께 Map반환
		return new ResponseEntity<>(resultMap, httpStatus);
	}
}
