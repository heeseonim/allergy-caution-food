package com.ssafy.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.service.HistoryService;
import com.ssafy.vo.History;
import com.ssafy.vo.JJim;

import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@CrossOrigin({ "*" })
public class HistoryRestController {
	@Autowired
	HistoryService hservice;

	// 해당 아이디의 찜 목록들
	@GetMapping("/selectHistory/{id}")
	@ApiOperation("해당 아이디의 구매내역")
	public ResponseEntity<Map<String, Object>> showDetailBoard(@PathVariable String id) {
		try {
			return response(hservice.selectHistory(id), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			return response("Get Historylist Error", HttpStatus.CONFLICT, true);
		}
	}

	// 찜 추가
	@PostMapping("/insertHistory")
	@ApiOperation("구매내역추가")
	public ResponseEntity<Map<String, Object>> InsertBoard(@RequestBody History history) {
		try {
			return response(hservice.insertHistory(history), HttpStatus.OK, true);
		} catch (RuntimeException e) {
			log.trace("History insert error : {}", e);
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
